*** Settings ***
Documentation    TRY/EXCEPT STRUCTURE SYNTAX.


*** Test Cases ***
First example
    TRY
        Log To Console    This is from try block.
    EXCEPT    Error message
        Log To Console    This is from except block.
    END
    Log To Console    This is after try/except block.


Catch Error Example
    TRY
        Log To Console    This is from try block.
        Fail     Error message
    EXCEPT    Error message
        Log To Console    This is from except block.
    END

Fail Example
    TRY
        Log To Console    This is from try block.
        Fail     Fail
    EXCEPT    Error message
        Log To Console    This is from except block.
    EXCEPT    Fail
        Log To Console    "Fail"
    END

Fail Example With Finally
    TRY
        Log To Console    This is from try block.
        Fail     Fail
    EXCEPT    Error message
        Log To Console    This is from except block.
    FINALLY
        Log To Console    This is always executed.
    END

Multiple Except Example
    TRY
        Log To Console    This is from try block.
    EXCEPT    Fail
        Log To Console    Failing...
    ELSE
        Log To Console    From ELSE block.
    END
    Log To Console    This is after try/except block.