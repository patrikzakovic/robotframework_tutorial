*** Settings ***
Documentation    Playground testing.
Library          SeleniumLibrary


*** Variables ***
${URL}         http://localhost/klikanie.php
${BROWSER}     Chrome

*** Test Cases ***
Click On Button On Page
    Open Browser    ${URL}    ${BROWSER}
    ${number_of_clicks}=    Set Variable    10
    FOR  ${index}    IN RANGE    ${number_of_clicks}
        Click Element    xpath=//button[@id="clickBtn" and text()="Klikaj"]
    END
    Page Should Contain Element    xpath=//span[@id="clickCounter" and text()="${number_of_clicks}"]