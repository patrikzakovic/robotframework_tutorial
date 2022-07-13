*** Settings ***
Documentation    BREAK/CONTINUE STRUCTURE SYNTAX.


*** Variables ***
@{MOVIE_CHARACTERS}    Yoda    Batman    Wolverine    Thor

*** Test Cases ***
CONTINUE Example
    FOR    ${character}    IN    @{MOVIE_CHARACTERS}
        IF    "${character}" == "Batman"    CONTINUE
        Log To Console    ${character}
    END

BREAK Example
    FOR    ${character}    IN    @{MOVIE_CHARACTERS}
        IF    "${character}" == "Batman"    BREAK
        Log To Console    ${character}
    END