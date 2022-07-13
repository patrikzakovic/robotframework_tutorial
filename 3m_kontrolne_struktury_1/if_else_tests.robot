*** Settings ***
Documentation    IF/ELSE SYNTAX.


*** Variables ***
${SCORE}     5
@{ANIMALS}    cat     dog
${NUMBER}    ${-5}

*** Test Cases ***
IF Example
    IF    ${SCORE} > 2
        Log To Console    The condition is met.
    END
Condition With Python Module
    IF    len(@{ANIMALS}) > 1
        Log To Console    The condition is met.
    END

Condition With ELSE Block
    IF    ${SCORE} > 10
        Log To Console    The condition is met.
    ELSE
        Log To Console    The condition is not met.
    END

Condition With ELSE IF Blocks
    IF    ${NUMBER} > 0 
        Log To Console    Positive number
    ELSE IF    ${NUMBER} < 0
        Log To Console    Negative number
    ELSE
        Log To Console    Something else
    END

Inline Condition
    IF    1 == 1    Log To Console    1 is equal to 1