import { yamlParse } from './deps.ts';
import { exec, OutputMode } from 'https://deno.land/x/exec/mod.ts';

// USAGE
//   gh release download [<tag>] [flags]

// FLAGS
//   -A, --archive format        Download the source code archive in the specified format (zip or tar.gz)
//       --clobber               Overwrite existing files of the same name
//   -D, --dir directory         The directory to download files into (default ".")
//   -O, --output file           The file to write a single asset to (use "-" to write to standard output)
//   -p, --pattern stringArray   Download only assets that match a glob pattern
//       --skip-existing         Skip downloading when files of the same name exist

// INHERITED FLAGS
//       --help                     Show help for command
//   -R, --repo [HOST/]OWNER/REPO   Select another repository using the [HOST/]OWNER/REPO format

// EXAMPLES
//   # download all assets from a specific release
//   $ gh release download v1.2.3
  
//   # download only Debian packages for the latest release
//   $ gh release download --pattern '*.deb'
  
//   # specify multiple file patterns
//   $ gh release download -p '*.deb' -p '*.rpm'
  
//   # download the archive of the source code for a release
//   $ gh release download v1.2.3 --archive=zip

// LEARN MORE
//   Use 'gh <command> <subcommand> --help' for more information about a command.
//   Read the manual at https://cli.github.com/manual

type PLATFORMS = "macos" | "windows" | "linux"
type ARCHS = "arm64" | "x64"
type ARCHS_IDENTIFIERS = "arm64" | "x64" | "aarch64" | "x86_64"
const data = yamlParse(await Deno.readTextFile('pact_mock_server_cli.yml')) as {
  name: string,
  homepage: string,
  latest: string,
  release: {
    url: string,
    tag: string,
    example: {
      url: string,
      tag: string,
    },
    archive: {
      type: string,
      checksums: { type: string, version_from: string, exclude: {
        [PLATFORMS: string]: {

        } 
      } }
    }
  },
  platforms: {
    macos: { x64: { arch_identifier: "x86_64", downloads: [] } },
    linux: {
      x64: { arch_identifier: "aarch64", downloads: [] },
      arm64: { arch_identifier: "aarch64", downloads: [] }
    },
    windows: { x64: { arch_identifier: "x86_64", downloads: [] } }
  }
}
// const repoName = 'https://github.com/pact-foundation/pact-reference.git';

console.log(data.release.archive.checksums.exclude)
console.log(data.platforms.linux.arm64.downloads)
// const tags = await exec(`gh release download --repo ${data.} -p '*osx*' pact_mock_server_cli-v0.6.1`, {
//   output: OutputMode.Capture
// });
// console.log(tags);

