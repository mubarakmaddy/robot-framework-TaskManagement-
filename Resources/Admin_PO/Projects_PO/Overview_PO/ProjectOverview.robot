*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${Project_Overview_Header} =                          xpath=//h2[text()='Overview']
${Project_Overview_Create_Project_Button} =           xpath=//button[contains(text(),'Create project')]
${Project_Overview_Delete_Project_icon} =             xpath=//i[@title='Delete Project']
${Project_Overview_Edit_Project_icon} =               xpath=//i[@title='Edit Project']
${Project_Overview_Project_Delete_Confirm_Button} =   xpath=//div[@class='delete-button']/button[@class='btn accept']
${Project_Overview_Project_Search Field} =            xpath=//input[@class='form-control']

*** Keywords ***

Verify Project Overview page is loaded
    wait until element is visible   ${Project_Overview_Header}                          10s
    element should be visible       ${Project_Overview_Header}

Click on Create Project Button
    click element                   ${Project_Overview_Create_Project_Button}

Search For a Project
    [Arguments]  ${Project_Name}
    input text                      ${Project_Overview_Project_Search Field}            ${Project_Name}

Select a Project From List
    [Arguments]  ${Project_Name}
    input text                      ${Project_Overview_Project_Search Field}            ${Project_Name}
    click element   xpath=//div[@class='col-lg-10 col-md-10 col-sm-10 project-col-def']/div[@title='${Project_Name}']
    element should be visible  xpath=(//div[@class='project-header']/div[@title='${Project_Name}'])[1]

Click on Delete Project icon
    wait until element is visible   ${project_overview_delete_project_icon}             10s
    click element                   ${project_overview_delete_project_icon}

Click On Delete Project Confirm Button
    wait until element is visible   ${project_overview_project_delete_confirm_button}   10s
    click button                    ${project_overview_project_delete_confirm_button}

Click on Edit Project icon
    wait until element is visible   ${Project_Overview_Edit_Project_icon}               10s
    click element                   ${Project_Overview_Edit_Project_icon}
