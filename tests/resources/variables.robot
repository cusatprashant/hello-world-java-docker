*** Variables ***
# Application Configuration
${BASE_URL}           http://localhost:8080
${API_TIMEOUT}        30
${UI_TIMEOUT}         10s

# Browser Configuration  
${BROWSER}            Chrome
${HEADLESS}           False

# Expected Response Values
${EXPECTED_SUCCESS}   ${True}
${EXPECTED_HELLO}     world
${EXPECTED_MESSAGE}   adding a new msg

# Test Data
&{EXPECTED_JSON}      success=${True}    hello=world    new-message=adding a new msg