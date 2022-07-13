*** Settings ***
Documentation    Example resource file


*** Variables ***
${TXT}    ROBOT FRAMEWORK


*** Keywords ***
Print Variable To Console
    [Documentation]    First keyword
    [Arguments]        ${var}

    Log To Console    ${var}
