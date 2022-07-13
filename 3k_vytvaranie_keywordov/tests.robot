*** Settings ***
Documentation    Creating user keywords.
Library          OperatingSystem
Library          String


*** Test Cases ***
Tes With Two User Keywords
    [Documentation]    This test contains 2 keywords.

    Print Execution Directory Path
    Print Number Of Files In Execution Directory

Test Arguments
    [Documentation]    Test user keywords with arguments.

    One Argument Keyword    Hello world!
    One Argument Keyword    message=Positional argument!
    Two Arguments Keyword    positional value 1    positional value 2
    Two Arguments Keyword    arg1=named value 1    arg2=named value 2
    One Argument Keyword With Default Value
    One Argument Keyword With Default Value    arg=new value
    Variable Number Of Arguments    first    second    third   aaaa
    Create file.txt In ${EXECDIR}
    
    ${uppercase_name}=    Convert Name To Uppercase    Robot
    Log To Console    ${uppercase_name}
    
*** Keywords ***
Print Execution Directory Path
    [Documentation]   Just do something.
    ...               Second line.
    ...               Third line.
    [Tags]            Tag1
    [Timeout]         10s

    No Operation
    Directory Should Exist    ${EXECDIR}
    Log To Console    This is your execution directory: ${EXECDIR}

    [Teardown]        Log  clearing...
Print Number Of Files In Execution Directory
    [Documentation]    Do something else.
    [Tags]             Tag2

    ${number_of_files}=    Count Files In Directory    ${EXECDIR}
    Log To Console    Number of files in execdir: ${number_of_files}

One Argument Keyword
    [Documentation]    Print one argument.
    [Arguments]    ${message}

    Log To Console    The value of argument is: ${message}

Two Arguments Keyword
    [Documentation]    Print two arguments.
    [Arguments]    ${arg1}    ${arg2}

    Log To Console    1st argument: ${arg1}
    Log To Console    2nd argument: ${arg2}

One Argument Keyword With Default Value
    [Documentation]    Default value.
    [Arguments]    ${arg}=default value

    Log To Console    Value from keyword with default value: ${arg}

Variable Number Of Arguments
    [Documentation]    Accept any number of arguments.
    [Arguments]    @{manyargs}

    Log Many    @{manyargs}

Create ${file} In ${directory}
    [Documentation]    Create file in defined directory.

    Create File    ${directory}${/}${file}    NEW FILE

Convert Name To Uppercase
    [Arguments]    ${name}

    ${converted}=    Convert To Upper Case    ${name}

    RETURN    ${converted}