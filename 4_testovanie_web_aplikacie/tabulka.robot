*** Settings ***
Documentation    Playground testing.
Library          SeleniumLibrary


*** Variables ***
${URL}         http://localhost/tabulka.php
${BROWSER}     Chrome


*** Test Cases ***
Process Table Data
    Open Browser    ${URL}    ${BROWSER}
    ${number_of_rows}=    Get Element Count    xpath=//tbody//tr[contains(., "na sklade")]
    FOR    ${row}    IN RANGE    1    ${number_of_rows} + ${1}
        ${name_of_product}=    Get Text    xpath=(//tbody//tr[contains(., "na sklade")])[${row}]/td[1]
        Log To Console    Product '${name_of_product}' should be checked...
        Select Checkbox    xpath=(//tbody//tr[contains(., "na sklade")])[${row}]//td/input[@type="checkbox"]
    END
    Click Button    Overit
    Page Should Contain   Vsetko si oznacil spravne!


