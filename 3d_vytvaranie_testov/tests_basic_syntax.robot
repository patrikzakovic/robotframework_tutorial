*** Settings ***
Documentation    Basic TC syntax.


*** Test Cases ***
Compare Two Strings
    [Documentation]    Comparing two strings.
    [Tags]             Basic
    [Setup]            Log To Console    START!
    [Timeout]          10s

    Sleep    15s
    Should Be Equal    string1    string1
    ${name}=    Set Variable    John

    [Teardown]         Log To Console    END!
