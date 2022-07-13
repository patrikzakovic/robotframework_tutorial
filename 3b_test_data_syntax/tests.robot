*** Settings ***
Documentation    Test data sections.
Metadata         Version    1.0
Library          OperatingSystem


*** Variables ***
${TXT}    ROBOT FRAMEWORK IS AWESOME!


*** Test Cases ***
Example Test
    [Documentation]    Just example test.

    No Operation
    Wait And Print To Console


*** Keywords ***
Wait And Print To Console
    [Documentation]    First keyword.

    Sleep    2s
    Log To Console    ${TXT}


*** Comments ***
This is space for multiline comments.
Second line comment.
