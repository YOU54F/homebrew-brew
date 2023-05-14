#!/bin/sh
set -e

# pact_verifier_cli
# pact_mock_server_cli
# libpact_ffi
# pact-ruby-standlone
TOOL=${TOOL:-pact-ruby-standalone}
formulaes=$(cd Formula && ls -1 $TOOL*)
echo $formulaes
TEST_RESULT_FILE=TEST_RESULTS_$TOOL.md
[ -f $TEST_RESULT_FILE ] && rm $TEST_RESULT_FILE
echo "| formula | version | platform | arch | result |" >> $TEST_RESULT_FILE
echo "| ------- | ------- | -------- | ---- | ------ |" >> $TEST_RESULT_FILE

for formula in ${formulaes[@]}; do
  # echo https://github.com/pact-foundation/pact-reference/releases/tag/$tag
  version=${formula#$TOOL-} # 2.0.0.rb
  version=${version%.rb} # 2.0.0
  echo creating formula $formula \\nversion: $version
  if [[ "$version" == 'foobar' ]]; then
      echo skipping as version broken = $version
  else
     ./scripts/test_formula.sh $formula $version $TEST_RESULT_FILE
  fi     
done

git add $TEST_RESULT_FILE
git fetch
git commit -m "ci(test): [skip ci] add $TEST_RESULT_FILE"
git push