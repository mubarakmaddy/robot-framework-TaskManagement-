*** Settings ***

Library  SeleniumLibrary        # timeout=5.0, implicit_wait=5.0, run_on_failure=Capture Page Screenshot, screenshot_root_directory=None


*** Variables ***

${GHR_Home_Page_Title} =  xpath=//a[@href="#feeds"]

*** Keywords ***

Wait until Home page is loaded
    wait until element is visible    ${GHR_HomePageTitle}    10s


Verify Home page is loaded
    element should be visible        ${GHR_HomePageTitle}

