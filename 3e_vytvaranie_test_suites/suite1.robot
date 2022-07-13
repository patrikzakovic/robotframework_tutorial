*** Settings ***
Documentation    Example test suite 1.
Suite Setup      Log To Console    Starting tests from suite 1...
Test Setup       Log To Console    New test starting...
Library          OperatingSystem
Metadata         Version    1.0


*** Variables ***
${MESSAGE}       Hello, world!


*** Test Cases ***
Do Something
    [Documentation]    Example suite TC.

    Log To Console    ${MESSAGE}
