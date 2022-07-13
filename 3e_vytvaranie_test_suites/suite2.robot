*** Settings ***
Documentation    Example test suite 2.
Suite Setup      Log To Console    Starting tests from suite 2...
Test Setup       Log To Console    New test starting...
Library          OperatingSystem
Metadata         Version    1.0


*** Variables ***
${MESSAGE}       Hello, world!


*** Test Cases ***
Do Something
    [Documentation]    Example suite TC.

    Directory Should Exist    ${EXECDIR}
