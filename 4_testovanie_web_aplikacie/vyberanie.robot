*** Settings ***
Documentation    Playground testing.
Library          SeleniumLibrary


*** Variables ***
${URL}         http://localhost/vyberanie.php
${BROWSER}     Chrome

*** Test Cases ***
Select Values From Dropdown
    Open Browser    ${URL}    ${BROWSER}
    ${my_hero}=    Set Variable    Batman
    Select From List By Value    id=chooseYourHero     ${my_hero}
    Page Should Contain Element    xpath=//span[@id="heroName" and text()="${my_hero}"]