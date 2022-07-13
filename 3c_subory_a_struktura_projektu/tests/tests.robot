*** Settings ***
Documentation    First test suite.
Resource         ../resources/example.resource


*** Test Cases ***
Test
    [Documentation]    Test

    Log To Console    ${TXT}
