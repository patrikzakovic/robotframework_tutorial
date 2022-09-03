*** Settings ***
Documentation    Playground testing.
Library          SeleniumLibrary


*** Variables ***
${URL}         http://localhost/cakanienatext.php
${BROWSER}     Chrome

*** Test Cases ***
Verify Text On Page
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain Element    xpath=//p[contains(text(),"Text zobrazeny hned")]
    Element Should Be Visible    xpath=//p[contains(text(),"Text zobrazeny hned")]
    Wait Until Page Contains Element    xpath=//p[contains(text(),"Som tu az po 5 sekundach!")]    timeout=10s