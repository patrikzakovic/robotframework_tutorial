| *** Settings ***   |
| Documentation      | Basic syntax with pipe separated format.
| Library            | OperatingSystem


| *** Variables ***  |
| ${MESSAGE}         | Hello world!


| *** Test Cases *** |                 |                |
| Log Test           | [Documentation] | Logging... |
|                    | Log To Console  | ${MESSAGE}     |

| Verify Directory   | [Documentation] | Directory verification test. |
|                    | Test Keyword  | ${EXECDIR}     |


| *** Keywords ***   |                        |         |
| Test Keyword       | [Documentation]        | Dalsi priklad testu |
|                    | [Arguments]            | ${path}             |
|                    | Directory Should Exist | ${path}             |
