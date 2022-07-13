*** Settings ***
Documentation    Basic syntax with space separated format.
Library          OperatingSystem


*** Variables ***
${MESSAGE}       Hello world!


*** Test Cases ***
Log Test
    [Documentation]    Logging...

    Log To Console    ${MESSAGE}

Verify Directory
    [Documentation]    Directory verification test.

    Directory Should Exist    ${EXECDIR}
