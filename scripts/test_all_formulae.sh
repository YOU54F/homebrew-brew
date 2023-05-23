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
echo "# $TOOL Test Results" >> $TEST_RESULT_FILE
echo "## $(date)" >> $TEST_RESULT_FILE
echo "## $(uname -s) $(uname -m)" >> $TEST_RESULT_FILE
echo "### Legend" >> $TEST_RESULT_FILE
echo "- 🕵️ - Failed to Install" >> $TEST_RESULT_FILE
echo "- ❌ - Tests Failed" >> $TEST_RESULT_FILE
echo "- ✅ - Tests Passed" >> $TEST_RESULT_FILE
echo "" >> $TEST_RESULT_FILE
echo "## Results" >> $TEST_RESULT_FILE
echo 
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

# if runner os is linux set git config
if [[ $RUNNER_OS == 'Linux' ]]; then
  git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
  git config --global user.name "github-actions[bot]"
fi
  RUNNER_TEST_RESULT_FILE=${TEST_RESULT_FILE%.md}.$RUNNER_OS.$RUNNER_ARCH.md
  mv $TEST_RESULT_FILE $RUNNER_TEST_RESULT_FILE
if [[ $RUNNER_OS && -z $ACT ]]; then
  git fetch
  git pull
  git add $RUNNER_TEST_RESULT_FILE
  git commit -m "ci(test): [skip ci] add $RUNNER_TEST_RESULT_FILE"
  git push
fi
