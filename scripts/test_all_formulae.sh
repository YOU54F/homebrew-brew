#!/bin/bash
set -e

# pact_verifier_cli
# pact_mock_server_cli
# libpact_ffi
# pact-ruby-standlone
TOOL=${TOOL:-pact-ruby-standalone}
ls -1 Formula/$TOOL*
formulaes=$(cd Formula && ls -1 $TOOL*)
echo $formulaes
TEST_RESULT_FILE=TEST_RESULTS_$TOOL.md
[ -f $TEST_RESULT_FILE ] && rm $TEST_RESULT_FILE
echo "| formula | version | platform | arch | result |" >> $TEST_RESULT_FILE
echo "| ------- | ------- | -------- | ---- | ------ |" >> $TEST_RESULT_FILE

for formula in ${formulaes[@]}; do
  # echo https://github.com/pact-foundation/pact-reference/releases/tag/$tag
  echo "formula is $formula"
  echo "TOOL is $TOOL"
  version=${formula#$TOOL-} # 2.0.0.rb
  version=${version%.rb} # 2.0.0
  echo creating formula $formula \\nversion: $version
  if [[ "$version" == 'foobar' ]]; then
      echo skipping as version broken = $version
  else
     ./scripts/test_formula.sh $formula $version $TEST_RESULT_FILE
  fi     
done

if [[ $RUNNER_OS == 'Linux' ]]; then
  git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
  git config --global user.name "GitHub Actions"
fi
if [[ $RUNNER_OS ]]; then
git fetch
git pull
RUNNER_TEST_RESULT_FILE=$TEST_RESULT_FILE.$RUNNER_OS.$RUNNER_ARCH.md
mv $TEST_RESULT_FILE $RUNNER_TEST_RESULT_FILE
git add $RUNNER_TEST_RESULT_FILE
git commit -m "ci(test): [skip ci] add $RUNNER_TEST_RESULT_FILE"
git push
fi
