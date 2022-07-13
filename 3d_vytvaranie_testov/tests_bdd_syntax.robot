*** Settings ***
Documentation    BDD/Gherkin TC syntax.


*** Test Cases ***
Valid Login
    Given login page is open
    When valid username and password are inserted
    and credentials are submitted
    Then welcome page should be open


*** Keywords ***
Login Page Is Open
    No Operation

Valid username and password are inserted
     No Operation

Credentials are submitted
    No Operation

Welcome page should be open
    No Operation