*** Settings ***

Library  SeleniumLibrary        # timeout=5.0, implicit_wait=5.0, run_on_failure=Capture Page Screenshot, screenshot_root_directory=None

*** Variables ***
${Smoke} =                              "Smoke"
${Functional} =                         "Functional"
${GRH_Common_LandingPage_Loader} =      xpath=//h4[text()='Loading...']


*** Keywords ***
Begin Web Test
    open browser  about:blank   headlesschrome
    Maximize Browser Window

End Web Test
    Close Browser

Wait until Loader is disappeared
    sleep  2s
    ${Loader_Status}=  run keyword and return status  page should contain element   ${GRH_Common_LandingPage_Loader}
    run keyword if                                                                  ${Loader_Status}                            Wait for Loader to disappear


Wait for Loader to disappear
    wait until element is not visible                                               ${GRH_Common_LandingPage_Loader}

