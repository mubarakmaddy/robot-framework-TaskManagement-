*** Settings ***
Resource  ../../Resources/Admin_PO/Navigation_PO/GHR_Admin_Navigation.robot
Resource  ../../Resources/Common_PO/GHR_Common.robot
Resource  ../../Resources/Admin_PO/Settings_PO/System Settings_PO/Checklist_PO/Checklist_Dashboard_PO/GHR_Admin_ChecklistDashboardPage.robot
Resource  ../../Resources/Admin_PO/Settings_PO/System Settings_PO/Checklist_PO/Checklist_Dashboard_PO/GHR_Admin_ChecklistForm.robot
Resource  ../../Resources/Admin_PO/Settings_PO/System Settings_PO/Checklist_PO/Checklist_Dashboard_PO/GHR_Admin_TaskTemplateForm.robot
Resource  ../../Resources/Admin_PO/Tasks_PO/GHR_Admin_TasksToastMessages.robot

*** Keywords ***

Navigate to checklist Dashboard Page from System Settings
    GHR_Admin_Navigation.Click on Settings Header Icon
    GHR_Admin_Navigation.Click on System Settings Menu Icon
    GHR_Admin_Navigation.Click on Checklist Menu
    GHR_Admin_Navigation.Click on Checklist Dashboard Sub Menu
    GHR_Admin_ChecklistDashboardPage.Verify Checklist Dashboard page is displayed
    GHR_Common.wait until Loader is disappeared

Create Checklist
    GHR_Admin_ChecklistDashboardPage.Click on Create Checklist Button
    GHR_Admin_ChecklistForm.Click on Blank Tab
    GHR_Admin_ChecklistForm.Enter Checklist Name                           Auto checklist
    GHR_Admin_ChecklistForm.Set Checklist Proirity                         Low
    GHR_Admin_ChecklistForm.Enter Checklist Description                    Auto checklist Desc
    GHR_Admin_ChecklistForm.Set Checklist Event Category                   Core HR
    GHR_Admin_ChecklistForm.Set Checklist Event Type                       Employee Birth Day
    GHR_Admin_ChecklistForm.Click on Triggers On Before Radio Button and enter no. of days       2
    GHR_Admin_ChecklistForm.Set Checklist Owner                            Manager
    GHR_Admin_ChecklistForm.Click on Checklist Save Button
    GHR_Admin_TasksToastMessages.Verify Checklist Created Success Message is displayed

Search and view the checklist
    [Arguments]  ${Checklist_Name}
    GHR_Admin_ChecklistDashboardPage.Search for a checklist                ${Checklist_Name}
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_ChecklistDashboardPage.Select the checklist fron the list    ${Checklist_Name}
    GHR_Common.wait until Loader is disappeared

Delete a chekclist
    GHR_Admin_ChecklistDashboardPage.Click on Checklist Options
    GHR_Admin_ChecklistDashboardPage.Click on Delete Option of the Checklit
    GHR_Admin_TasksToastMessages.Confirm Popup action
    GHR_Admin_TasksToastMessages.Verify Checklist Deleted Success Message is displayed

Create Task Template from Blank state Screen
    GHR_Admin_ChecklistDashboardPage.Click on Task Template Accordion
    GHR_Admin_ChecklistDashboardPage.Click on Add new Task Template Button in Blank State Screen

Create Task Template from grid
    GHR_Admin_ChecklistDashboardPage.Click on Task Template Accordion
    GHR_Admin_ChecklistDashboardPage.Click on Add new Task Template Button in grid

Create Task Template
    GHR_Admin_TaskTemplateForm.Enter Task Template Name                    New Temp
    GHR_Admin_TaskTemplateForm.Set Task Template Proirity                  Medium
    GHR_Admin_TaskTemplateForm.Enter Task Template Description             New Temp
    GHR_Admin_TaskTemplateForm.Enter Complete By Days                      3
    GHR_Admin_TaskTemplateForm.Set Task Template Owner                     Employee Reviewer
    GHR_Admin_TaskTemplateForm.Click on Save Button of Task templaten form
    GHR_Admin_TasksToastMessages.Verify Task Template Created Success Message is displayed

