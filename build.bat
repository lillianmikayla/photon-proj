@echo off
setlocal enabledelayedexpansion

:: Directories
set SRC_DIR=src
set BIN_DIR=bin
set LIB_DIR=lib

:: Create bin directory if it doesn't exist
if not exist %BIN_DIR% mkdir %BIN_DIR%

:: Classpath (include all JARs except -sources.jar, -javadoc.jar, and -natives.jar)
set CLASSPATH=%BIN_DIR%
for %%F in (%LIB_DIR%\*.jar) do (
    echo %%F | findstr /i "-sources.jar -javadoc.jar -natives.jar" >nul || set CLASSPATH=!CLASSPATH!;%%F
)

:: Compile Java files
echo Compiling Java files...
javac -cp "%CLASSPATH%" -d %BIN_DIR% %SRC_DIR%\*.java
if %ERRORLEVEL% neq 0 (
    echo Compilation failed!
    exit /b %ERRORLEVEL%
)

echo Compilation successful!
exit /b 0
