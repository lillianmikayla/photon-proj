#!/bin/bash

# Directories
BIN_DIR="bin"
LIB_DIR="lib"
NATIVES_DIR="lib/lwjgl-natives"

# Classpath: Exclude -sources.jar, -javadoc.jar, and -natives.jar
CLASSPATH="$BIN_DIR:$(find $LIB_DIR -name '*.jar' ! -name '*-sources.jar' ! -name '*-javadoc.jar' ! -name '*-natives.jar' | tr '\n' ':')"

# Run Java program with LWJGL native path
java -cp "$CLASSPATH" -Djava.library.path="$NATIVES_DIR" Main
exit 0
