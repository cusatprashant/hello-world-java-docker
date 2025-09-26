*** Settings ***
Documentation     Test Suite for Hello World Java Docker Application
Resource          resources/variables.robot

Suite Setup       Log    Starting Hello World Test Suite    console=True
Suite Teardown    Log    Hello World Test Suite Completed   console=True

*** Test Cases ***
# This file serves as a suite runner
# Individual tests are in api/ and ui/ directories