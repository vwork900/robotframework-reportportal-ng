*** Settings ***
Documentation     Minimal smoke tests for Report Portal integration.
...                 Used by CI (e.g. Jenkins) when the test suite path is "tests".
...                 Includes both passing and failing cases for Report Portal reporting.

*** Test Cases ***
Smoke Test Pass
    [Documentation]    Minimal test that always passes so the pipeline finds and runs the suite.
    Log    Smoke test executed.
    Should Be Equal    ${1}    ${1}

Pass - Numbers Equal
    [Documentation]    Pass: equal numbers.
    Should Be Equal As Numbers    42    42
    Log    Numbers match.

Pass - String Contains
    [Documentation]    Pass: string contains expected substring.
    Should Contain    hello world    world
    Log    Substring found.

Pass - List Not Empty
    [Documentation]    Pass: list has items.
    @{items}=    Create List    a    b    c
    builtin.Should Not Be Empty    ${items}
    Length Should Be    ${items}    3

Pass - True Condition
    [Documentation]    Pass: boolean check.
    Should Be True    ${True}
    Should Not Be True    ${False}

Fail - Values Not Equal
    [Documentation]    Fail: intentional mismatch for reporting.
    Should Be Equal    foo    bar

Fail - Number Mismatch
    [Documentation]    Fail: wrong numeric assertion.
    Should Be Equal As Numbers    10    99

Fail - Explicit Fail
    [Documentation]    Fail: explicit failure for Report Portal.
    Log    About to fail on purpose.
    Fail    Intentional failure for CI/Report Portal demo.

Fail - String Does Not Contain
    [Documentation]    Fail: substring not in string.
    Should Contain    hello    xyz

Fail - Empty Check
    [Documentation]    Fail: list is empty but we expect not empty.
    @{empty}=    Create List
    List Should Not Be Empty    ${empty}
