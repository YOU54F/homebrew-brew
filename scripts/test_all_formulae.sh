#!/bin/sh
set -e

# pact_verifier_cli
# pact_mock_server_cli
# libpact_ffi
# pact-ruby-standlone
TOOL=pact-ruby-standalone
formulaes=$(cd Formula && ls -1 $TOOL*)
echo $formulaes
rm TEST_RESULTS.md
echo "| formula | version | result |" >> TEST_RESULTS.md
echo "| ------- | ------- | ------ |" >> TEST_RESULTS.md

for formula in ${formulaes[@]}; do
  # echo https://github.com/pact-foundation/pact-reference/releases/tag/$tag
  version=${formula#$TOOL-} # 2.0.0.rb
  version=${version%.rb} # 2.0.0
  echo creating formula $formula \\nversion: $version
  if [[ "$version" == 'foobar' ]]; then
      echo skipping as version broken = $version
  else
     ./scripts/test_formula.sh $formula $version
  fi     
done

