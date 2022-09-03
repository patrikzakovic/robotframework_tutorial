*** Settings ***
Documentation    END 2 END TEST.
Library          SeleniumLibrary
Library    String

Suite Setup      Open Browser
...                  ${URL}
...                  ${BROWSER}
Test Setup       Select Process    ${TEST_NAME}
Suite Teardown   Close All Browsers

*** Variables ***
${URL}        http://localhost/index.php
${BROWSER}    Chrome

*** Keywords ***
Select Process
    [Arguments]    ${name}

    ${name}=    Replace String    ${name}    ${SPACE}    ${EMPTY}
    ${name}=    Convert To Lower Case    ${name}
    Click Element    xpath=//li/a[text()="${name}"]

*** Test Cases ***
Cakanie na text
    Page Should Contain Element    xpath=//p[contains(text(),"Text zobrazeny hned")]
    Element Should Be Visible    xpath=//p[contains(text(),"Text zobrazeny hned")]
    Wait Until Page Contains Element    xpath=//p[contains(text(),"Som tu az po 5 sekundach!")]    timeout=10s

Klikanie
    ${number_of_clicks}=    Set Variable    10
    FOR  ${index}    IN RANGE    ${number_of_clicks}
        Click Element    xpath=//button[@id="clickBtn" and text()="Klikaj"]
    END
    Page Should Contain Element    xpath=//span[@id="clickCounter" and text()="${number_of_clicks}"]

Vyberanie
    ${my_hero}=    Set Variable    Batman
    Select From List By Value    id=chooseYourHero     ${my_hero}
    Page Should Contain Element    xpath=//span[@id="heroName" and text()="${my_hero}"]

Vycitavanie
    ${city}=    Get Text    id=city
    Log To Console    City: ${city}
    Input Text    id=cityCheck    ${city}
    Click Button    Overit
    Wait Until Page Contains Element    xpath=//div[@id="successAlert" and contains(.,"Vybral si spravne mesto.")]    timeout=5s

Tabulka
    ${number_of_rows}=    Get Element Count    xpath=//tbody//tr[contains(., "na sklade")]
    FOR    ${row}    IN RANGE    1    ${number_of_rows} + ${1}
        ${name_of_product}=    Get Text    xpath=(//tbody//tr[contains(., "na sklade")])[${row}]/td[1]
        Log To Console    Product '${name_of_product}' should be checked...
        Select Checkbox    xpath=(//tbody//tr[contains(., "na sklade")])[${row}]//td/input[@type="checkbox"]
    END
    Click Button    Overit
    Page Should Contain   Vsetko si oznacil spravne!

Rozhodovanie
    ${txt}=    Get Text    xpath=//p[contains(.,"robot") or contains(.,"clovek")]
    ${txt}=    Fetch From Right    ${txt}    ${SPACE}
    ${txt}=    Fetch From Left    ${txt}     !
    Click Element    xpath=//label[contains(text(), "${txt}")]
    Page Should Contain    Vybral si spravne!