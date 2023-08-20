@echo off

rem This script allows you to switch between using Gradle and Maven for building projects.

rem Function to switch to Gradle
:use_gradle
echo Using Gradle for building.
.\gradlew.bat build && ./gradlew :application:bootRun
goto :eof

rem Function to switch to Maven
:use_maven
echo Using Maven for building.
.\mvnw.bat install && ./mvnw spring-boot:run -pl application
goto :eof

rem Display usage information
:display_usage
echo Usage: %~nx0 [options]
echo Options:
echo   -g, --gradle    Switch to using Gradle for building
echo   -m, --maven     Switch to using Maven for building
goto :eof

rem Check for command-line options
if "%1" == "-g" (
    goto use_gradle
) else if "%1" == "--gradle" (
    goto use_gradle
) else if "%1" == "-m" (
    goto use_maven
) else if "%1" == "--maven" (
    goto use_maven
) else if "%1" == "-h" (
    goto display_usage
) else if "%1" == "--help" (
    goto display_usage
) else (
    goto display_usage
)
