*** Settings ***
Resource  ../../Resources/Admin/Navigation_PO/GreytHRNavigation.robot
Resource  ../../Resources/Admin/TaskManagement2.0_PO/TM_ChecklistDashboardPage.robot
Resource  ../../Resources/Admin/TaskManagement2.0_PO/TM_ChecklistForm.robot
Resource  ../../Resources/Admin/TaskManagement2.0_PO/TM_TaskTemplateForm.robot

*** Keywords ***

Navigate to checklist Dashboard Page from System Settings
    GreytHRNavigation.Click on Settings Header Icon
    GreytHRNavigation.Click on System Settings Menu Icon
    GreytHRNavigation.Click on Checklist Menu
    GreytHRNavigation.Click on Checklist Dashboard Sub Menu
    TM_ChecklistDashboardPage.Verify Checklist Dashboard page is displayed
    TM_TaskLandingPage.wait until Loader is disappeared

Create Checklist
    TM_ChecklistDashboardPage.Click on Create Checklist Button
    TM_ChecklistForm.Click on Blank Tab
    TM_ChecklistForm.Enter Checklist Name                           Auto checklist
    TM_ChecklistForm.Set Checklist Proirity                         Low
    TM_ChecklistForm.Enter Checklist Description                    Auto checklist Desc
    TM_ChecklistForm.Set Checklist Event Category                   Core HR
    TM_ChecklistForm.Set Checklist Event Type                       Employee Birth Day
    TM_ChecklistForm.Click on Triggers On Before Radio Button and enter no. of days       2
    TM_ChecklistForm.Set Checklist Owner                            Manager
    TM_ChecklistForm.Click on Checklist Save Button
    TM_ToastMessages.Verify Checklist Created Success Message is displayed

Search and view the checklist
    [Arguments]  ${Checklist_Name}
    TM_ChecklistDashboardPage.Search for a checklist                ${Checklist_Name}
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_ChecklistDashboardPage.Select the checklist fron the list    ${Checklist_Name}
    TM_TaskLandingPage.wait until Loader is disappeared

Delete a chekclist
    TM_ChecklistDashboardPage.Click on Checklist Options
    TM_ChecklistDashboardPage.Click on Delete Option of the Checklit
    TM_ToastMessages.Confirm Popup action
    TM_ToastMessages.Verify Checklist Deleted Success Message is displayed

Create Task Template from Blank state Screen
    TM_ChecklistDashboardPage.Click on Task Template Accordion
    TM_ChecklistDashboardPage.Click on Add new Task Template Button in Blank State Screen

Create Task Template from grid
    TM_ChecklistDashboardPage.Click on Task Template Accordion
    TM_ChecklistDashboardPage.Click on Add new Task Template Button in grid

Create Task Template
    TM_TaskTemplateForm.Enter Task Template Name                    New Temp
    TM_TaskTemplateForm.Set Task Template Proirity                  Medium
    TM_TaskTemplateForm.Enter Task Template Description             New Temp
    TM_TaskTemplateForm.Enter Complete By Days                      3
    TM_TaskTemplateForm.Set Task Template Owner                     Employee Reviewer
    TM_TaskTemplateForm.Click on Save Button of Task templaten form
    TM_ToastMessages.Verify Task Template Created Success Message is displayed

