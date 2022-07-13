*** Settings ***
Documentation    REST API testing with RequestsLibrary.
Library          RequestsLibrary
Library          JSONLibrary

*** Variables ***
${URL}    https://jsonplaceholder.typicode.com


*** Test Cases ***
GET Request All Posts
    [Documentation]    GET Request - retreive all posts.

    GET    url=${URL}/posts    expected_status=200


GET Request And Response Object
    [Documentation]    Retreive all posts and parse response object.

    ${response}=    GET    url=${URL}/posts    expected_status=200
    FOR    ${item}    IN    @{response.json()}
        Log To Console    ID: ${item['userId']} | Title: ${item['title']}
    END

Filter Data With GET Request
    [Documentation]    Filter data with GET request.

    ${response}=    GET    url=${URL}/posts/1    expected_status=200
    Log To Console    ID: ${response.json()['id']} | Title: ${response.json()['title']}
    
    &{params}=    Create Dictionary    id=1
    ${response}=    GET    url=${URL}/posts   expected_status=200    params=${params}
    FOR    ${item}    IN    @{response.json()}
        Log To Console    ID: ${item['id']} | Title: ${item['title']}
    END

PUT Request
    [Documentation]    Updating data with PUT request.

    &{headers}=    Create Dictionary    Content-type=application/json    charset=UTF-8
    &{data}=    Create Dictionary    id=1    title=title updated    body=lore ipsum um ipsum lorem    userId=1
    
    ${response}=    PUT    url=${URL}/posts/1   json=${data}    headers=${headers}
    Log To Console    ${response.json()}
    
    ${json_data}=    Load Json From File    ${CURDIR}/update.json
    ${response}=    PUT    url=${URL}/posts/1    json=${json_data}    headers=${headers}
    Log To Console    ${response.json()}

PATCH Request
    [Documentation]    Patching data with PATCH request.

    &{headers}=    Create Dictionary    Content-type=application/json    charset=UTF-8
    &{data}=    Create Dictionary    title=title patched
    
    ${response}=    PATCH    url=${URL}/posts/1   json=${data}    headers=${headers}
    Log To Console    ${response.json()}
    
    ${json_data}=    Load Json From File    ${CURDIR}/patch.json
    ${response}=    PATCH    url=${URL}/posts/1    json=${json_data}    headers=${headers}
    Log To Console    ${response.json()}

POST Request
    [Documentation]    Create post with POST request.

    &{headers}=    Create Dictionary    Content-type=application/json    charset=UTF-8
    &{data}=    Create Dictionary    title=new post    body=lore ipsum um ipsum lorem    userId=1
    
    ${response}=    POST    url=${URL}/posts    json=${data}    headers=${headers}    expected_status=201
    Log To Console    ${response.json()}
    
    ${json_data}=    Load Json From File    ${CURDIR}/file.json
    ${response}=    POST    url=${URL}/posts    json=${json_data}    headers=${headers}
    Log To Console    ${response.json()}

DELETE Request
    [Documentation]    Deleting data with DELETE method.

    ${response}=    DELETE    url=${URL}/posts/100    expected_status=200
    Log To Console    ${response.json()}