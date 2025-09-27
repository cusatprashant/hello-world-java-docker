*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           OperatingSystem
Library           BuiltIn
Library           JSONLibrary

*** Variables ***
${BASE_URL}       http://localhost:8080

*** Test Cases ***
Validate Root Endpoint
    [Documentation]    Test the root endpoint returns expected JSON response
    [Tags]    api    smoke
    
    # Create HTTP session
    Create Session    hello    ${BASE_URL}
    
    # Make GET request to root endpoint
    ${response}=    GET On Session    hello    /
    
    # Log response details
    Log    Response Status: ${response.status_code}    console=True
    Log    Response Content: ${response.content}    console=True
    
    # Validate HTTP status code
    Should Be Equal As Strings    ${response.status_code}    200
    
    # Parse JSON response using JSONLibrary
    ${json}=    Convert String To Json    ${response.content}
    
    # Validate JSON structure and values
    Should Be True    ${json}[success]
    Should Be Equal As Strings    ${json}[hello]    world
    Should Be Equal As Strings    ${json}[new-message]    A sample java application deployed with REST API, Maven and docker
    
    # Additional validation - check if all expected keys exist
    Dictionary Should Contain Key    ${json}    success
    Dictionary Should Contain Key    ${json}    hello  
    Dictionary Should Contain Key    ${json}    new-message
    
    # Validate data types
    Should Be Equal    ${json}[success]    ${True}
    
    [Teardown]    Delete All Sessions

Health Check Endpoint Test
    [Documentation]    Verify the application is running and responsive
    [Tags]    health    smoke
    
    # Create HTTP session
    Create Session    app    ${BASE_URL}
    
    # Make request with timeout
    ${response}=    GET On Session    app    /    expected_status=200    timeout=10
    
    # Basic validation
    Should Be Equal As Integers    ${response.status_code}    200
    Should Not Be Empty    ${response.content}
    
    [Teardown]    Delete All Sessions

*** Keywords ***
Setup Test Environment
    [Documentation]    Common setup for all tests
    Log    Starting API tests against ${BASE_URL}    console=True

Teardown Test Environment  
    [Documentation]    Common cleanup for all tests
    Log    API tests completed    console=True
    Delete All Sessions