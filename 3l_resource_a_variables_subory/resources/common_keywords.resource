*** Settings ***
Documentation     Common user keywords.
Library           OperatingSystem
Library           DateTime


*** Variables ***
${DATE_FORMAT}    %d.%m.%Y


*** Keywords ***
Create File With Current Date Information
    [Documentation]    Create file on given path
    ...                with current date information.
    [Arguments]    ${path}

    ${current_date}=    Get Current Date    result_format=${DATE_FORMAT}
    Create File    ${path}    Todays is ${current_date}.
