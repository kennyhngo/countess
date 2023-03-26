#!/bin/bash

# Link javascript-obfuscator by running:
# npm link javascript-obfuscator

# Check if javascript-obfuscator is installed
javascript-obfuscator -h > /dev/null 2> /dev/null
if [ $? -ne 0 ]; then
    echo -e "You may need to link javascript-obfuscator."
    echo "Try running 'npm link javascript-obfuscator'"
    exit 1
fi

# Stop on errors
set -Eeuo pipefail

# Input and output directories
INPUT_FOLDER="src"
OUTPUT_FOLDER="build"

# Remove contents in output directory
rm -rf $OUTPUT_FOLDER/*


# Obfuscate JavaScript files
javascript-obfuscator $INPUT_FOLDER --output $OUTPUT_FOLDER --compact true --dead-code-injection true --debug-protection true --disable-console-output true --identifiers-prefix "obf" --numbers-to-expressions true --simplify true

# CLI Option explanations, as seen here:
# https://github.com/javascript-obfuscator/javascript-obfuscator#cli-options
# compact => Compact code output on one line.
# deadCodeInjection => Inject random blocks of dead code.
# debugProtection => makes it almost impossible to use the debugger function of the Developer Tools.
# disableConsoleOutput => Disable the use of console. family functions.
# identifiersPrefix => Helps to avoid conflicts between global identifiers of these files.
# numbersToExpressions => Enables numbers conversion to expressions.
# simplify => Enables additional code obfuscation through simplification.

exit 0
