*** Settings ***
Documentation    Scalars, lists and dictionaries.


*** Variables ***
${TXT}       ROBOT FRAMEWORK IS AWESOME!
${NUMBER}    ${200}
@{MONTHS}    January    February    March    April
&{CAR}       brand=Ford    model=Mustang    year=2022

@{USER}      John    Doe
&{USER2}     firstname=John    surname=Doe


*** Test Cases ***
Log Scalar Variable As Is
    Log To Console    ${TXT}

Log List Variable As Is
    Log To Console    ${MONTHS}

Log Dict Variable As Is
    Log To Console    ${CAR}

# list variable demonstration
Constants For List
    Log User Data    robot    framework

List Variable
    Log User Data    @{USER}

# dictionary variable demonstration
Constants
    Log User Data    firstname=robot    surname=framework

Dict Variable
    Log User Data    &{USER2}

Get First Item From List
    Log To Console    ${MONTHS}[0]

Get Car Model From Dic
    Log To Console    ${CAR}[model]
    Log To Console    ${CAR.model}

*** Keywords ***
Log User Data
    [Arguments]    ${firstname}    ${surname}

    Log To Console    Firstname: ${firstname}
    Log To Console    Surname: ${surname}