*** Settings ***
Library  Selenium2Library
Resource  ../Data/TaskManagement/TMInputData.robot
*** Variables ***
${Smoke} =         "Smoke"
${Functional} =     "Functional"

${GRH_Common_LandingPage_Loader} =                      xpath=//h4[text()='Loading...']

*** Keywords ***
Begin Web Test
     open browser  about:blank   gc
     Maximize Browser Window

End Web Test
    Close Browser

Wait until Loader is disappeared
    sleep  2s
    ${Loader_Status}=  run keyword and return status  page should contain element   ${GRH_Common_LandingPage_Loader}            20s
    run keyword if                                                                  ${Loader_Status}                            Wait for Loader to disappear


Wait for Loader to disappear
    wait until element is not visible                                               ${TM_LandingPage_Loader}                    20s
#    sleep   1s
