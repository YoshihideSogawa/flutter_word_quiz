# https://qiita.com/gki/items/a861d7ac1c61d6de928e
# https://github.com/priezz/dart_full_coverage
#/bin/sh

outputFile="$(pwd)/test/coverage_test.dart"
packageName="$(< pubspec.yaml grep '^name: ' | awk '{print $2}')"

if [ "$packageName" = "" ]; then
    echo "Run $0 from the root of your Dart/Flutter project"
    exit 1
fi

printf "/// *** GENERATED FILE - ANY CHANGES WOULD BE OBSOLETE ON NEXT GENERATION *** ///\n" > "$outputFile"

{
  printf "/// Helper to test coverage for all project files\n"
  printf "// ignore_for_file: unused_import\n"
  find lib -name '*.dart' | grep -v '.g.dart' | grep -v '.freezed.dart' | grep -v 'generated_plugin_registrant' | awk -v package="$packageName" '{gsub("^lib", "", $1); printf("import '\''package:%s%s'\'';\n", package, $1);}'
  printf "\nvoid main() {}"
} >> "$outputFile"

fvm flutter test --coverage

lcov --remove coverage/lcov.info '**/*.g.dart' '**/*.freezed.dart' -o coverage/lcov.info

genhtml coverage/lcov.info -o coverage/result

rm "$outputFile"

while getopts :o opt; do
  case $opt in
  "o") open coverage/result/index.html ;;
  *)
    echo "usage $0 [-o]"
    exit 1 ;;
  esac
done
