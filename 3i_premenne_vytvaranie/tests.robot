*** Settings ***
Documentation    Creating variables.


*** Variables ***
${TXT}       ROBOT FRAMEWORK IS AWESOME!


*** Test Cases ***
Set Value To Scalar
    ${x}=    Set Variable    X returned from keyword.
    Log To Console    ${x}

Set Values To List
    @{fruits}=    Create List    apple    orange    banana
    Log To Console    ${fruits}

Set Items To Dic
    &{user}=    Create Dictionary    email=user@gmail.com    password=secret
    Log To Console    ${user}