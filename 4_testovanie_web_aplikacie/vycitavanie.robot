*** Settings ***
Documentation    Playground testing.
Library          SeleniumLibrary


*** Variables ***
${URL}         http://localhost/vycitavanie.php
${BROWSER}     Chrome


*** Test Cases ***
Input Data To Form
    Open Browser    ${URL}    ${BROWSER}
    ${city}=    Get Text    id=city
    Log To Console    City: ${city}
    Input Text    id=cityCheck    ${city}
    Click Button    Overit
    Wait Until Page Contains Element    xpath=//div[@id="successAlert" and contains(.,"Vybral si spravne mesto.")]    timeout=5s