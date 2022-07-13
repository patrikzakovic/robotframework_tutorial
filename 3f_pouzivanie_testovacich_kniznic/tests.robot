*** Settings ***
Documentation    Importing test libraries.
Library          OperatingSystem
Library          SeleniumLibrary    30s


*** Test Cases ***
Library Import
    [Documentation]    Importing library....

    Import Library    DateTime
    ${current_date}=    Get Current Date    result_format=%d.%m.%Y
    Log To Console    Today is ${current_date}
