@echo off
setlocal enabledelayedexpansion

:: Directories
set BIN_DIR=bin
set LIB_DIR=lib
set NATIVES_DIR=lib\lwjgl-natives

:: Classpath (include all JARs except -sources.jar, -javadoc.jar, and -natives.jar)
set CLASSPATH=%BIN_DIR%
for %%F in (%LIB_DIR%\*.jar) do (
    echo %%F | findstr /i "-sources.jar -javadoc.jar -natives.jar" >nul || set CLASSPATH=!CLASSPATH!;%%F
)

:: Run Java program with LWJGL native path
java -cp "%CLASSPATH%" -Djava.library.path="%NATIVES_DIR%" Main
exit /b 0
