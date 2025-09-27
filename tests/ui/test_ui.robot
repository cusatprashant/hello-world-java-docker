*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot

*** Variables ***
${BROWSER}        Chrome
${TIMEOUT}        10s

*** Test Cases ***
Homepage Should Display JSON Keys
    [Documentation]    Verify the homepage displays the expected JSON response
    [Tags]    ui    smoke
    
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Browser Implicit Wait    ${TIMEOUT}
    
    # Verify page loads successfully
    # Title Should Be    Whitelabel Error Page    # Default Spring Boot title, or update if you have a custom one
    
    # Check for JSON content in the page
    Page Should Contain    success
    Page Should Contain    hello
    Page Should Contain    world
    Page Should Contain    new-message
    Page Should Contain    A sample java application deployed with REST API, Maven and docker
    
    # Verify it looks like JSON structure
    Page Should Contain    "success":true
    Page Should Contain    "hello":"world"
    
    [Teardown]    Close Browser

Homepage JSON Structure Test
    [Documentation]    Test that the homepage returns proper JSON structure
    [Tags]    ui    json
    
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Browser Implicit Wait    ${TIMEOUT}
    
    # Get page source and verify it contains JSON
    ${page_source}=    Get Source
    Should Contain    ${page_source}    {"success":true
    Should Contain    ${page_source}    "hello":"world"
    Should Contain    ${page_source}    "new-message":"A sample java application deployed with REST API, Maven and docker"
    
    [Teardown]    Close Browser

*** Keywords ***
Setup Browser Environment
    [Documentation]    Common browser setup
    Set Selenium Speed    0.5s
    Set Selenium Timeout    ${TIMEOUT}