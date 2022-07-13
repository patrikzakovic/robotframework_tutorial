*** Settings ***
Documentation    FOR LOOP SYNTAX.


*** Variables ***
@{NAMES}         John           George
@{ID_NUMBERS}    x123           x345
&{USER1}         name=John      email=john@gmail.com
&{USER2}         name=George    email=george@gmail.com
@{USERS}         ${USER1}       ${USER2}

*** Test Cases ***
First Loop Example
    FOR    ${item}    IN    John    George
        Log    ${item}
        Log    -------
    END
Loop Example With List
    FOR    ${name}    IN    @{NAMES}
        Log    ${name}
        Log    -------
    END

Loop To Upper Limit
    FOR    ${index}    IN RANGE    10
        Log To Console    Index: ${index}
    END

Loop In Range
    FOR    ${index}    IN RANGE    1    11
        Log To Console    Index: ${index}
    END

Iteration Over Sequence With Index
    FOR    ${index}    ${name}    IN ENUMERATE    @{NAMES}
        Log To Console    On index ${index} is ${name}
    END

Iteration Over Multiple Lists
    FOR    ${id}    ${name}    IN ZIP    ${ID_NUMBERS}    ${NAMES}
        Log To Console    Id: ${id} | Name: ${name}
    END

Dictionary Iteration
    FOR    ${key}    ${value}    IN    &{USER1}
        Log To Console    Key is '${key}' and value is '${value}'
    END

Nested Interation
    FOR    ${user}    IN    @{USERS}
        Log To Console    \nDict: ${user}
        FOR    ${key}    ${value}    IN    &{user}
            Log To Console    \tKey is '${key}' and value is '${value}'
        END
    END