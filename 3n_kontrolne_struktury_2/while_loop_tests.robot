*** Settings ***
Documentation    WHILE LOOP SYNTAX.


*** Test Cases ***
WHILE Example
    ${number}=    Set Variable    0
    WHILE    ${number} < 10
        Log To Console    Iteration: ${number}
        ${number}=    Evaluate    ${number} + ${1}
    END
WHILE Example With Limit
    WHILE    ${True}    limit=100
        Log To Console    I'am running 100 times.
    END