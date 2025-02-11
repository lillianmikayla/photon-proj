#!/bin/bash

# Directories
SRC_DIR="src"
BIN_DIR="bin"
LIB_DIR="lib"

# Classpath: Include all JARs except -sources.jar, -javadoc.jar, and -natives.jar
CLASSPATH="$BIN_DIR:$(find $LIB_DIR -name '*.jar' ! -name '*-sources.jar' ! -name '*-javadoc.jar' ! -name '*-natives.jar' | tr '\n' ':')"

# Create bin directory if it doesn't exist
mkdir -p "$BIN_DIR"

# Compile Java files
echo "Compiling Java files..."
javac -Xlint:all -cp "$CLASSPATH" -d "$BIN_DIR" $(find "$SRC_DIR" -name "*.java")

# Check for compilation errors
if [ $? -ne 0 ]; then
    echo "Compilation failed!"
    exit 1
fi

echo "Compilation successful!"
exit 0
