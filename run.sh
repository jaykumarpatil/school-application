#!/bin/bash

# This script allows you to switch between using Gradle and Maven for building projects.

# Function to switch to Gradle
use_gradle() {
    echo "Using Gradle for building."
    ./gradlew build && ./gradlew :application:bootRun
}

# Function to switch to Maven
use_maven() {
    echo "Using Maven for building."
    ./mvnw install && ./mvnw spring-boot:run -pl application
}

# Display usage information
display_usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -g, --gradle    Switch to using Gradle for building"
    echo "  -m, --maven     Switch to using Maven for building"
}

# Check for command-line options
case "$1" in
    -g | --gradle)
        use_gradle
        ;;
    -m | --maven)
        use_maven
        ;;
    -h | --help)
        display_usage
        exit 0
        ;;
    *)
        display_usage
        exit 1
        ;;
esac
