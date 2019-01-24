*** Settings ***
Library  SeleniumLibrary         #timeout=5.0, implicit_wait=5.0, run_on_failure=Capture Page Screenshot, screenshot_root_directory=None

*** Variables ***
${Project_Workdays_Title} =                             xpath=//div[@class='title']
${Project_Workdays_Bulk_Import} =                       xpath=//a[contains(text(),'Bulk Import')]
*** Keywords ***
Verify Project Workdays page is loaded
    wait until element is visible       ${Project_Workdays_Title}   10s
    element should be visible           ${Project_Workdays_Title}

Click on Bulk import link
    click element                       ${project_workdays_bulk_import}





