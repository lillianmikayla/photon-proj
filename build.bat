@echo off

REM Directories
set SRC_DIR=src
set BIN_DIR=bin
set LIB_DIR=lib

REM Classpath: Include all JARs except -sources.jar, -javadoc.jar, and -natives.jar
setlocal enabledelayedexpansion
set CLASSPATH=%BIN_DIR%
for %%f in (%LIB_DIR%\*.jar) do (
    if not "%%~nf"=="*-sources" if not "%%~nf"=="*-javadoc" if not "%%~nf"=="*-natives" (
        set CLASSPATH=!CLASSPATH!;%%f
    )
)

REM Create bin directory if it doesn't exist
if not exist "%BIN_DIR%" mkdir "%BIN_DIR%"

REM Compile Java files
echo Compiling Java files...
javac -Xlint:all -cp "%CLASSPATH%" -d "%BIN_DIR%" %SRC_DIR%\*.java

REM Check for compilation errors
if %errorlevel% neq 0 (
    echo Compilation failed!
    exit /b 1
)

echo Compilation successful!
exit /b 0