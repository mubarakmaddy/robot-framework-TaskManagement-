*** Settings ***

Resource  ../../Resources/Admin/SignInAndSignOut_PO/LoginPage.robot
Resource  ../../Resources/Admin/Home_PO/GreytHRHomePage.robot
Resource  ../../Resources/Admin/Navigation_PO/GreytHRNavigation.robot
Resource  ../../Resources/Admin/TaskManagement2.0_PO/TM_TaskLandingPage.robot
Resource  ../../Resources/Admin/TaskManagement2.0_PO/TM_TaskForm.robot
Resource  ../../Resources/Admin/TaskManagement2.0_PO/TM_ToastMessages.robot
Resource  ../../Resources/Admin/TaskManagement2.0_PO/TM_ChecklistDashboardPage.robot
Resource  ../../Resources/Admin/TaskManagement2.0_PO/TM_ChecklistForm.robot
Resource  ../../Resources/Admin/TaskManagement2.0_PO/TM_TaskTemplateForm.robot


*** Keywords ***

Create Task CSV



Login To GreytHR Application
    [Arguments]  ${Login_credentials}
    LoginPage.Load GreytHR
    LoginPage.Enter User Name                                       ${Login_credentials}
    LoginPage.Enter Password                                        ${Login_credentials}
    LoginPage.Click on Login button
    GreytHRHomePage.Verify Home page is loaded

Navigate to Task Management Page
    GreytHRNavigation.Click on unexpanded Taskmanagement menu
    GreytHRNavigation.Click on expanded Taskmanagement menu
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_TaskLandingPage.Wait Untill My Task Board page is loaded
    TM_TaskLandingPage.Verify Tasks page is loaded

Create Standalone task Task
    [Arguments]  ${Task_Details}
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_TaskLandingPage.Click on Create Task button
    TM_TaskForm.Enter Task Name                                     ${Task_Details[0]}
    TM_TaskForm.Click on Due Date input field
    TM_TaskForm.Set Due Date                                        12      Feb     2019
    TM_TaskForm.Set Priority Medium
    TM_TaskForm.Enter Description                                   ${Task_Details[1]}
#    TM_TaskForm.Click on Add Assignee Icon
#    TM_TaskForm.Search and select Assignee                          ${Assignee_Number}
#    TM_TaskForm.Click on Tags tab
#    TM_TaskForm.Click on Add Tags Button
#    TM_TaskForm.Enter New Tag and Verify tag is created             ${Tag_Name}
#    TM_TaskForm.Click on Followers Tab
#    TM_TaskForm.Click on Add Followers Button
#    TM_TaskForm.Search and select the follower                      5001
    TM_TaskForm.Click on Save button to save the task
    TM_ToastMessages.Verify Task Created Success Message is displayed

Create a task mapping to checklist instance
    [Arguments]  ${Task_Name}  ${Task_Description}  ${Assignee_Number}  #@{Checklist_Name}
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_TaskLandingPage.Click on Create Task button
    TM_TaskForm.Enter Task Name                                     ${Task_Name}
    TM_TaskForm.Click on Due Date input field
    TM_TaskForm.Set Due Date                                        12      Feb     2019
    TM_TaskForm.Set Priority Medium
    TM_TaskForm.Enter Description                                   ${Task_Description}
    TM_TaskForm.Click on Add Assignee Icon
    TM_TaskForm.Search and select Assignee                          ${Assignee_Number}
    TM_TaskForm.Click on Add Checklist link
    TM_TaskForm.Search and select for a checklist                   Greyt (0034) - Payroll Checklist
#    TM_TaskForm.Click on Tags tab
#    TM_TaskForm.Click on Add Tags Button
#    TM_TaskForm.Enter New Tag and Verify tag is created             abc
#    TM_TaskForm.Click on Followers Tab
#    TM_TaskForm.Click on Add Followers Button
#    TM_TaskForm.Search and select the follower                      5001
    TM_TaskForm.Click on Save button to save the task
    TM_ToastMessages.Verify Task Created Success Message is displayed

Add Followers to the Task
    [Arguments]  ${Follower}
    TM_TaskForm.Click on Followers Tab
    TM_TaskForm.Click on Add Followers Button
    TM_TaskForm.Search and select the follower                      ${Follower}
    TM_TaskForm.Click on Save button to save the task
    TM_ToastMessages.Verify Task Created Success Message is displayed

Remove Follower of the Task
    [Arguments]  ${Follower}
    TM_TaskForm.Click on Followers Tab
    TM_TaskForm.Mouse Over Follower                                 ${Follower}
#    TM_TaskForm.Click on remove button of the follower
    TM_TaskForm.Click on Save button to save the task
    TM_ToastMessages.Verify Task Created Success Message is displayed

View Task
    [Arguments]  ${Task_Name}
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_TaskLandingPage.Search for a task    ${Task_Name}
    TM_TaskLandingPage.Click on Task to view                        ${Task_Name}

Update Task
    [Arguments]  ${Task_Name}  ${Task_Description}
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_TaskForm.Clear Task Name
    TM_TaskForm.Enter Task Name                                     ${Task_Name}
    TM_TaskForm.Clear Description
    TM_TaskForm.Enter Description                                   ${Task_Description}
    TM_TaskForm.Click on Save button to save the task
    TM_ToastMessages.Verify Task Updated Success Message is displayed

Complete Task
    [Arguments]  ${Task_Name}
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_TaskLandingPage.Search for a task              ${Task_Name}
    TM_TaskLandingPage.Click on Task Complete Checkbox       ${Task_Name}
    TM_ToastMessages.Verify Task Completed Success Message is displayed

Reopen Task
    [Arguments]  ${Task_Name}
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_TaskLandingPage.Click on Completed Tasks Tab
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_TaskLandingPage.Click on Task Reopen Checkbox                ${Task_Name}
    TM_ToastMessages.Verify Task Completed Success Message is displayed

Post Comment
    [Arguments]  ${Comment}
    TM_TaskForm.Click on Comments tab
    TM_TaskForm.Enter comment data                                  ${Comment}
    TM_TaskForm.Click on Comment Post button
    TM_ToastMessages.Verify Task Comment Posted Success Message is displayed


Update Comment
    [Arguments]  ${Comment_To_Be_Updated}      ${Updated_Comment}
    TM_TaskForm.Click on Comments tab
    TM_TaskForm.Click on Comment Edit icon of selected comment      ${Comment_To_Be_Updated}
    TM_TaskForm.Clear Comment Data
    TM_TaskForm.Enter comment data      ${Updated_Comment}
    TM_TaskForm.Click on Comment Post button
    TM_ToastMessages.Verify Task Comment Updated Success Message is displayed


Delete Comment
    [Arguments]  ${Comment_To_Be_Deleted}
    TM_TaskForm.Click on Comments tab
    TM_TaskForm.Click on Comment Delete icon of selected comment    ${Comment_To_Be_Deleted}
    TM_ToastMessages.Verify Task Comment Deleted Success Message is displayed

Add a New Tag
    [Arguments]  ${Tag_Name}
    TM_TaskForm.Click on Tags tab
    TM_TaskForm.Click on Add Tags Button
    TM_TaskForm.Enter New Tag Name                                  ${Tag_Name}
    TM_TaskForm.Click Enter to create the tag
    TM_TaskForm.Click on Save button to save the task
    TM_ToastMessages.Verify Task Updated Success Message is displayed

Verify Tag is present
    [Arguments]  ${Tag_Name}
    TM_TaskForm.Click on Tags tab
    TM_TaskForm.Verify Tag is created                               ${Tag_Name}

Add an Existing Tag
    [Arguments]  ${Tag_Name}
    TM_TaskForm.Click on Tags tab
    TM_TaskForm.Click on Add Tags Button
    TM_TaskForm.Search and Select the tag from the search results    ${Tag_Name}

Remove Tag
    [Arguments]  ${Tag_Name}
    TM_TaskForm.Click on Tags tab
    TM_TaskForm.Click on cross icon of selected tag                 ${Tag_Name}
    TM_TaskForm.Click on Save button to save the task
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_ToastMessages.Verify Task Updated Success Message is displayed

Remap checklist task to Standlone
    TM_TaskForm.Click on cross icon of the checklist instance
    TM_TaskForm.Click on Save button to save the task
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_ToastMessages.Verify Task Updated Success Message is displayed

Navigate to checklist from Task dashboard
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_TaskLandingPage.Click on Go To Checklists link
    TM_ChecklistDashboardPage.Verify Checklist Dashboard page is displayed
    TM_TaskLandingPage.wait until Loader is disappeared

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
    TM_ChecklistForm.Enter Checklist Name       Auto checklist
    TM_ChecklistForm.Set Checklist Proirity       Low
    TM_ChecklistForm.Enter Checklist Description       Auto checklist Desc
    TM_ChecklistForm.Set Checklist Event Category       Core HR
    TM_ChecklistForm.Set Checklist Event Type           Employee Birth Day
    TM_ChecklistForm.Click on Triggers On Before Radio Button and enter no. of days       2
    TM_ChecklistForm.Set Checklist Owner    Manager
    TM_ChecklistForm.Click on Checklist Save Button
    TM_ToastMessages.Verify Checklist Created Success Message is displayed

Search and view the checklist
    [Arguments]  ${Checklist_Name}
    TM_ChecklistDashboardPage.Search for a checklist    ${Checklist_Name}
    TM_TaskLandingPage.wait until Loader is disappeared
    TM_ChecklistDashboardPage.Select the checklist fron the list   ${Checklist_Name}
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
    TM_TaskTemplateForm.Enter Task Template Name    New Temp
    TM_TaskTemplateForm.Set Task Template Proirity    Medium
    TM_TaskTemplateForm.Enter Task Template Description    New Temp
    TM_TaskTemplateForm.Enter Complete By Days    3
    TM_TaskTemplateForm.Set Task Template Owner    Employee Reviewer
    TM_TaskTemplateForm.Click on Save Button of Task templaten form
    TM_ToastMessages.Verify Task Template Created Success Message is displayed





