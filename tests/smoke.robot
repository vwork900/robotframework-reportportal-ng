*** Settings ***
Documentation     Minimal smoke tests for Report Portal integration.
...                 Used by CI (e.g. Jenkins) when the test suite path is "tests".

*** Test Cases ***
Smoke Test Pass
    [Documentation]    Minimal test that always passes so the pipeline finds and runs the suite.
    Log    Smoke test executed.
    Should Be Equal    ${1}    ${1}
