# This script allows you to switch between using Gradle and Maven for building projects.

# Function to switch to Gradle
function Use-Gradle {
    Write-Host "Using Gradle for building."
    .\gradlew.bat build && ./gradlew :application:bootRun
}

# Function to switch to Maven
function Use-Maven {
    Write-Host "Using Maven for building."
    .\mvnw.bat install && ./mvnw spring-boot:run -pl application
}

# Display usage information
function Display-Usage {
    Write-Host "Usage: $((Get-Item $MyInvocation.MyCommand).Name) [options]"
    Write-Host "Options:"
    Write-Host "  -g, --gradle    Switch to using Gradle for building"
    Write-Host "  -m, --maven     Switch to using Maven for building"
}

# Check for command-line options
if ($args[0] -eq "-g" -or $args[0] -eq "--gradle") {
    Use-Gradle
}
elseif ($args[0] -eq "-m" -or $args[0] -eq "--maven") {
    Use-Maven
}
elseif ($args[0] -eq "-h" -or $args[0] -eq "--help") {
    Display-Usage
}
else {
    Display-Usage
}
