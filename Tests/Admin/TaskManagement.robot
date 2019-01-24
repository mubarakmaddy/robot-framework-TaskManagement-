*** Settings ***
#Author: Mubarak
Documentation  Task Managemnet Automation is starting...

Resource  ../../Resources/Common_PO/GHR_Common.robot
Resource  ../../Resources/Admin_PO/GHR_Admin_TasksApp.robot
Resource  ../../Resources/Admin_PO/GHR_Admin_ChecklistApp.robot
Resource  ../../Resources/Admin_PO/Navigation_PO/GHR_Admin_Navigation.robot

Test Setup     GHR_Common.Begin Web Test
Test Teardown  GHR_Common.End Web Test

#robot -d Results Tests/Admin/TaskManagement.robot



*** Variables ***
${Task_Name} =                  Task 25
${Task_Name_To_Be_Updated} =    Task 25
${Task_Description} =           Task 25 Desc
${Task_Name_To_Be_Updated} =    Updated Task 25 Desc
${Task_Due_Date} =
${Task_Priority} =
${Task_Assignee} =
${Task_Comment} =               Comet
${Task_Updated_Comment} =       UpComment
${Task_Tag} =                   Taghur
${Task_Follower} =              5018

*** Test Cases ***
##### TASK TEST CASES ##### TASK TEST CASES #### TASK TEST CASES ##### TASK TEST CASES #### TASK TEST CASES ##### TASK TEST CASES ####

Perform smoke test on task module
    [Tags]  ${Smoke}
    Login To GreytHR Application
    Navigate to Tasks Page
    Create a Standalone task Task                                   ${Task_Name}
    Search and select a Task to be previewed                        ${Task_Name}
    Update Task Name and Description                                ${Task_Name}                    ${Task_Name_To_Be_Updated}
    Complete Task                                                   ${Task_Name}
    Click on Completed Tasks Pill
    Reopen Task                                                     ${Task_Name}
    Click on Open Tasks Pill
    Search and select a Task to be previewed                        ${Task_Name}
    Post a Comment                                                  ${Task_Comment}
    Update Comment                                                  ${Task_Comment}                 ${Task_Updated_Comment}
    Delete Comment                                                  ${Task_Updated_Comment}
    Add a New Tag and verify Tag is present                         ${Task_Name}                    ${Task_Tag}
    Remove Tag and Verify Tag is removed                            ${Task_Name}                    ${Task_Tag}
    Add an existing tag and verify tag is added                     ${Task_Name}                    ${Task_Tag}
    Duplicate the previewed task                                    ${Task_Name}
    Delete the previewed task                                       ${Task_Name}

User must be able to login to GreytHR application As Admin
    [Tags]  ${Smoke}
    Login To GreytHR Application

Admin User must be able to navigate to Task Management
    [Tags]  ${Smoke}
    Login To GreytHR Application
    Navigate to Tasks Page

Admin User should be able to create a Standalone Task
    [Tags]  ${Functional}
    Login To GreytHR Application
    Navigate to Tasks Page
    Create a Standalone task Task                                   ${Task_Name}

Admin User should be able to create a Task Mapping to single checklist
    [Tags]  ${Functional}
    Login To GreytHR Application
    Navigate to Tasks Page
    Create a task mapping to checklist instance

Admin User should be able to view any task
    [Tags]  ${Functional}
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}

Admin User must be able to preview and update the Task Name & Description
    [Tags]  ${Functional}
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Update Task Name and Description                                ${Task_Name}                    ${Task_Name_To_Be_Updated}

Admin User should be able to complete the task
    [Tags]  ${Functional}
    Login To GreytHR Application
    Navigate to Tasks Page
    Complete Task                                                   ${Task_Name}

Admin User should be able to reopen the completed task
    Login To GreytHR Application
    Navigate to Tasks Page
    Click on Completed Tasks Pill
    Reopen Task                                                     ${Task_Name}

Admin User should be able to post a comment on the task
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Post a Comment                                                  ${Task_Comment}

Admin User should be able to update the comment
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Update Comment                                                  ${Task_Comment}                 ${Task_Updated_Comment}

Admin User should be able to delete the comment
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Delete Comment                                                  ${Task_Updated_Comment}

Admin User should be able to Post, Update and delete the comment
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Post a Comment                                                  ${Task_Comment}
    Update Comment                                                  ${Task_Comment}                 ${Task_Updated_Comment}
    Delete Comment                                                  ${Task_Updated_Comment}

Admin User should be able to Add a New Tag and verify if tag is created
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Add a New Tag                                                   ${Task_Tag}
    Save the Task and verify Task is saved successfully
    Verify Tag is present                                           ${Task_Tag}

Admin user should be able to remove added tag
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Remove Added Tag                                                ${Task_Tag}
    Save the Task and verify Task is saved successfully
    Search and select a Task to be previewed                        ${Task_Name}
    Verify Tag is removed

Admin User should be able to Add an existing Tag
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Add an Existing Tag                                             ${Task_Tag}
    Save the Task and verify Task is saved successfully
    Select the task to be previewed                                 ${Task_Name}
    Verify Tag is present                                           ${Task_Tag}

Admin user should be able to Add, remove and select a tag
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Add a New Tag and verify Tag is present                         ${Task_Name}                    ${Task_Tag}
    Remove Tag and Verify Tag is removed                            ${Task_Name}                    ${Task_Tag}
    Add an existing tag and verify tag is added                     ${Task_Name}                    ${Task_Tag}

Admin User should be able to Add Followers to the Task
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Add Followers to the Task                                       ${Task_Follower}
#   #Search and select a Task to be previewed                        ${Task_Name}
#   #Verify Follower is added successfully

Admin User should be able to Remove Followers to the Task
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Remove Follower of the Task                                     AH

Admin user should be able to duplicate a task
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Duplicate the Task

Admin user shoukd be able to delete a task
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Delete the task


Admin User should be able to change the checklist task to standalone task
    Login To GreytHR Application
    Navigate to Tasks Page
    Search and select a Task to be previewed                        ${Task_Name}
    Remap checklist task to Standlone



#### CHECKLIST TEST CASES ##### CHECKLIST TEST CASES #### CHECKLIST TEST CASES ##### CHECKLIST TEST CASES #### CHECKLIST TEST CASES #####


Admin user should be able to navigate to Checklist dashboard page from Task Dashboard page
    Login To GreytHR Application
    Navigate to Tasks Page
    Navigate to checklist from Task dashboard

Admin user should be able to navigate to Checklist dashboard page from system settings menu
    Login To GreytHR Application
    Navigate to checklist Dashboard Page from System Settings

Admin user should be able to create checklist
    Login To GreytHR Application
    Navigate to checklist Dashboard Page from System Settings
    Create Checklist

Admin user should be able to search and view any created checkilst
    Login To GreytHR Application
    Navigate to checklist Dashboard Page from System Settings
    Search and view the checklist       Payroll Process

Admin User should be able to delete a checklist having no active instances
    Login To GreytHR Application
    Navigate to checklist Dashboard Page from System Settings
    Search and view the checklist       Auto checklist
    Delete a chekclist

Create a task template from Blank State Screen for a checklist
    Login To GreytHR Application
    Navigate to checklist Dashboard Page from System Settings
    Search and view the checklist       Auto checklist
    Create Task Template from Blank state Screen
    Create Task Template

Create a task template from grid for a checklist
    Login To GreytHR Application
    Navigate to checklist Dashboard Page from System Settings
    Search and view the checklist       Auto checklist
    Create Task Template from grid
    Create Task Template

