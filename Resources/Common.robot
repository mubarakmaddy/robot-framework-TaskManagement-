*** Settings ***
Library  Selenium2Library
Resource  ../Data/TaskManagement/TMInputData.robot
*** Variables ***
${Smoke} =         "Smoke"
${Functional} =     "Functional"

*** Keywords ***
Begin Web Test
     open browser  about:blank   gc
     Maximize Browser Window

End Web Test
    Close Browser
