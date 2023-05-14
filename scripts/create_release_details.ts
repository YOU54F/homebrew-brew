import { yamlParse } from './deps.ts';
import { exec, OutputMode } from 'https://deno.land/x/exec/mod.ts';

const data = yamlParse(await Deno.readTextFile('pact_mock_server_cli.yml'));
console.log(data);

const repoName = 'https://github.com/pact-foundation/pact-reference.git';
const toolName = 'pact_mock_server_cli';
const tags = await exec(`gh release list --repo ${repoName} --limit 1000`, {
  output: OutputMode.Capture
});
console.log(tags);

const releases = tags.output
  .split(' ')
  .filter((rels) => rels.includes(toolName))
  .map((release) => {
    const releaseDetailsString = release.split('\t');
    return {
      version: releaseDetailsString[0],
      tag: releaseDetailsString[2],
      date: releaseDetailsString[3].split('\n')[0]
    };
  });

console.log(releases);

releases.forEach(async (release) => {
  console.log(release.tag);
  const releaseDetails = await exec(
    `gh release view --repo ${repoName} ${release.tag} --json apiUrl,assets,author,body,createdAt,id,isDraft,isPrerelease,name,publishedAt,tagName,tarballUrl,targetCommitish,uploadUrl,url,zipballUrl`,
    { output: OutputMode.Capture }
  );

  const detail = JSON.parse(releaseDetails.output) as {
    apiUrl: string;
    assets: {
      apiUrl: string;
      contentType: string;
      createdAt: string;
      downloadCount: number;
      id: string;
      label: string;
      name: string;
      size: number;
      state: string;
      updatedAt: string;
      url: string;
    }[];
    author: {
      id: string;
      author: string;
    };
    body: string;
    createdAt: string;
    id: string;
    isDraft: boolean;
    isPrerelease: boolean;
    name: string;
    publishedAt: string;
    tagName: string;
    tarballUrl: string;
    targetCommitish: string;
    uploadUrl: string;
    url: string;
    zipballUrl: string;
  };
  // console.log(detail);
  await Deno.writeTextFile(
    `${detail.tagName}.json`,
    JSON.stringify(detail, null, 2)
  );

  console.log(
    detail.assets.filter((a) => a.url.includes('osx')).map((d) => d.url)[0]
  );

  const homebrewDetail = {
    name: detail.name,

    on_macos: {
      on_intel: {
        url:
          detail.assets
            .filter((a) => a.url.includes('osx-x86_64'))
            .map((d) => d.url)[0] ?? undefined,
        sha256: undefined
      },
      on_arm: {
        url:
          detail.assets
            .filter((a) => a.url.includes('osx-aarch64'))
            .map((d) => d.url)[0] ?? undefined,
        sha256: undefined
      }
    },
    on_linux: {
      on_intel: () => {
        return {
          url:
            detail.assets
              .filter((a) => a.url.includes('linux-x86_64'))
              .map((d) => d.url)[0] ?? undefined,
          sha256: undefined
        };
      },
      on_arm: () => {
        return {
          url:
            detail.assets
              .filter((a) => a.url.includes('linux-aarch64'))
              .map((d) => d.url)[0] ?? undefined,
          sha256: undefined
        };
      }
    }
  };

  console.log(homebrewDetail);

  await Deno.writeTextFile(
    `${detail.tagName}-homebrew.template.json`,
    JSON.stringify(homebrewDetail, null, 2)
  );
});
