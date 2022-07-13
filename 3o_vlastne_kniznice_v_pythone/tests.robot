*** Settings ***
Documentation    Importing custom test libraries.
Library          libs/MyLibrary.py
Library          libs/ExampleLibrary.py

*** Test Cases ***
Test Custom Library
    ${n}=    Set Variable    ${13}
    ${is_even}=    Is Number Even    number=${n}
    Log To Console    ${is_even}

Test Example Library
    ${date}=    Get Current Date
    Log To Console    Today is: ${date}