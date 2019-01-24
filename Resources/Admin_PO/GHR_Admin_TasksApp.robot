*** Settings ***

Resource  ../../Resources/Common_PO/SignInAndSignOut_PO/GHR_LoginPage.robot
Resource  ../../Resources/Admin_PO/Navigation_PO/GHR_Admin_Navigation.robot
Resource  ../../Resources/Admin_PO/Home_PO/GHR_Admin_HomePage.robot
Resource  ../../Resources/Admin_PO/Tasks_PO/GHR_Admin_TaskLandingPage.robot
Resource  ../../Resources/Admin_PO/Tasks_PO/GHR_Admin_TaskForm.robot
Resource  ../../Resources/Admin_PO/Tasks_PO/GHR_Admin_TasksToastMessages.robot
Resource  ../../Resources/Common_PO/GHR_Common.robot
Resource  ../../Resources/Admin_PO/Settings_PO/System Settings_PO/Checklist_PO/Checklist_Dashboard_PO/GHR_Admin_ChecklistDashboardPage.robot


*** Variables ***
${URL} =        https://indy6staging.greythr.com
${User_Name} =  majordomo1
${Password} =   majordomo@12345

*** Keywords ***

Login To GreytHR Application
    GHR_LoginPage.Load GreytHR                                          ${URL}
    GHR_LoginPage.Enter User Name                                       ${User_Name}
    GHR_LoginPage.Enter Password                                        ${Password}
    GHR_LoginPage.Click on Login button
    GHR_Admin_HomePage.Wait until Home page is loaded
    GHR_Admin_HomePage.Verify Home page is loaded

#Verify user is logged in successfully
#    GHR_Admin_HomePage.Verify Home page is loaded

Scroll
    Scroll Element Into View    //div[text()='Kumar has joined us in the company on 28 Nov 2018,']/following-sibling::div/div/div/div[@class='span1']
#    click element               //div[text()='Twelve has joined us in the company on 26 Dec 2018,']/following-sibling::div/div/div/div[@class='span1']
    if
    press key   ARROW_DOWN


Navigate to Tasks Page
    GHR_Admin_Navigation.Click on Tasks menu
    GHR_Admin_TaskLandingPage.Wait Untill Tasks page is loaded
    GHR_Admin_TaskLandingPage.Verify Tasks page is loaded

#Verify Tasks page is displayed
#     GHR_Admin_TaskLandingPage.Verify Tasks page is loaded

Create a Standalone task Task
    [Arguments]  ${Task_Name}
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TaskLandingPage.Click on Create Task button
    GHR_Admin_TaskForm.Enter Task Name                                     ${Task_Name}
    GHR_Admin_TaskForm.Click on Due Date input field
    GHR_Admin_TaskForm.Set Due Date                                        12      Feb     2019
    GHR_Admin_TaskForm.Set Priority Medium
    GHR_Admin_TaskForm.Enter Description                                   Task1
    GHR_Admin_TaskForm.Click on Add Assignee Icon
    GHR_Admin_TaskForm.Search and select Assignee                          5018
    GHR_Admin_TaskForm.Click on Tags tab
    GHR_Admin_TaskForm.Click on Add Tags Button
    GHR_Admin_TaskForm.Enter New Tag and Verify tag is created             abc
    GHR_Admin_TaskForm.Click on Followers Tab
    GHR_Admin_TaskForm.Click on Add Followers Button
    GHR_Admin_TaskForm.Search and select the follower                      5001
    GHR_Admin_TaskForm.Click on Save button to save the task
    GHR_Admin_TasksToastMessages.Verify Task Created Success Message is displayed

#Verify Task is created sucessfully
#    GHR_Admin_TasksToastMessages.Verify Task Created Success Message is displayed

Create a task mapping to checklist instance
    GHR_Common.Wait until Loader is disappeared
    GHR_Admin_TaskLandingPage.Click on Create Task button
    GHR_Admin_TaskForm.Enter Task Name                                     Task1
    GHR_Admin_TaskForm.Click on Due Date input field
    GHR_Admin_TaskForm.Set Due Date                                        12      Feb     2019
    GHR_Admin_TaskForm.Set Priority Medium
    GHR_Admin_TaskForm.Enter Description                                   Task1
    GHR_Admin_TaskForm.Click on Add Assignee Icon
    GHR_Admin_TaskForm.Search and select Assignee                          5018
    GHR_Admin_TaskForm.Click on Add Checklist link
    GHR_Admin_TaskForm.Search and select for a checklist                   AA (01) - aaaa
    GHR_Admin_TaskForm.Click on Tags tab
    GHR_Admin_TaskForm.Click on Add Tags Button
    GHR_Admin_TaskForm.Enter New Tag and Verify tag is created             abc
    GHR_Admin_TaskForm.Click on Followers Tab
    GHR_Admin_TaskForm.Click on Add Followers Button
    GHR_Admin_TaskForm.Search and select the follower                      5001
    GHR_Admin_TaskForm.Click on Save button to save the task
    GHR_Admin_TasksToastMessages.Verify Task Created Success Message is displayed

Search and select a Task to be previewed
    [Arguments]  ${Task_Name}
    GHR_Admin_TaskLandingPage.Search for a task                            ${Task_Name}
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TaskLandingPage.Click on Task to view                        ${Task_Name}
    GHR_Admin_TaskForm.Verify selected Task is Previewed                   ${Task_Name}
Search a Task
    [Arguments]  ${Task_Name}
    GHR_Admin_TaskLandingPage.Search for a task                            ${Task_Name}

Select the task to be previewed
    [Arguments]  ${Task_Name}
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TaskLandingPage.Click on Task to view                        ${Task_Name}
    GHR_Admin_TaskForm.Verify selected Task is Previewed                   ${Task_Name}

Update Task Name and Description
    [Arguments]  ${Updated_Task_Name}  ${Updated_Task_Description}
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TaskForm.Clear Task Name
    GHR_Admin_TaskForm.Enter Task Name                                     ${Updated_Task_Name}
    GHR_Admin_TaskForm.Clear Description
    GHR_Admin_TaskForm.Enter Description                                   ${Updated_Task_Description}
    GHR_Admin_TaskForm.Click on Save button to save the task
    GHR_Admin_TasksToastMessages.Verify Task Updated Success Message is displayed


#Verify Task is Updated successfully
#    GHR_Admin_TasksToastMessages.Verify Task Updated Success Message is displayed

Complete Task
    [Arguments]  ${Task_Name}
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TaskLandingPage.Search for a task                            ${Task_Name}
    GHR_Admin_TaskLandingPage.Click on Task Complete Checkbox              ${Task_Name}
    GHR_Admin_TasksToastMessages.Verify Task Completed Success Message is displayed

#Verify Task is Completed Successfully
#    GHR_Admin_TasksToastMessages.Verify Task Completed Success Message is displayed

Click on Completed Tasks Pill
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TaskLandingPage.Click on Completed Tasks Tab

Click on Open Tasks Pill
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TaskLandingPage.Click on Open Tasks Tab

Reopen Task
    [Arguments]  ${Task_Name}
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TaskLandingPage.Search for a task                            ${Task_Name}
    GHR_Admin_TaskLandingPage.Click on Task Reopen Checkbox                ${Task_Name}
    GHR_Admin_TasksToastMessages.Verify Task Reopened Success Message is displayed

#Verify Task is Reopened Successfully
#    GHR_Admin_TasksToastMessages.Verify Task Reopened Success Message is displayed

Post a Comment
    [Arguments]  ${Comment}
    GHR_Admin_TaskForm.Click on Comments tab
    GHR_Admin_TaskForm.Enter comment data                                  ${Comment}
    GHR_Admin_TaskForm.Click on Comment Post button
    GHR_Admin_TasksToastMessages.Verify Task Comment Posted Success Message is displayed

#Verify Comment is posted Successfully
#    GHR_Admin_TasksToastMessages.Verify Task Comment Posted Success Message is displayed


Update Comment
    [Arguments]  ${Comment_To_Be_Updated}      ${Updated_Comment}
    GHR_Admin_TaskForm.Click on Comments tab
    GHR_Admin_TaskForm.Click on Comment Edit icon of selected comment      ${Comment_To_Be_Updated}
    GHR_Admin_TaskForm.Clear Comment Data
    GHR_Admin_TaskForm.Enter comment data                                  ${Updated_Comment}
    GHR_Admin_TaskForm.Click on Comment Post button
    GHR_Admin_TasksToastMessages.Verify Task Comment Updated Success Message is displayed

#Verify Comment is updated sucessfully
#    GHR_Admin_TasksToastMessages.Verify Task Comment Updated Success Message is displayed

Delete Comment
    [Arguments]  ${Comment_To_Be_Deleted}
    GHR_Admin_TaskForm.Click on Comments tab
    GHR_Admin_TaskForm.Click on Comment Delete icon of selected comment    ${Comment_To_Be_Deleted}
    GHR_Admin_TasksToastMessages.Verify Task Comment Deleted Success Message is displayed

#Verify Comment is deleted Successfully
#    GHR_Admin_TasksToastMessages.Verify Task Comment Deleted Success Message is displayed


Add a New Tag
    [Arguments]  ${Tag_Name}
    GHR_Admin_TaskForm.Click on Tags tab
    GHR_Admin_TaskForm.Click on Add Tags Button
    GHR_Admin_TaskForm.Enter New Tag Name                                  ${Tag_Name}
    GHR_Admin_TaskForm.Click Enter to create the tag

Save the Task and verify Task is saved successfully
    GHR_Admin_TaskForm.Click on Save button to save the task
    GHR_Admin_TasksToastMessages.Verify Task Updated Success Message is displayed

Verify Tag is present
    [Arguments]  ${Tag_Name}
    GHR_Admin_TaskForm.Click on Tags tab
    GHR_Admin_TaskForm.Verify Tag is created                               ${Tag_Name}
    GHR_Admin_TaskForm.Click on close task form icon


Add a New Tag and verify Tag is present
    [Arguments]  ${Task_Name}    ${Tag_Name}
     Add a New Tag                                                  ${Tag_Name}
     Save the Task and verify Task is saved successfully
     Select the task to be previewed                                ${Task_Name}
     Verify Tag is present                                          ${Tag_Name}


Add an Existing Tag
    [Arguments]  ${Tag_Name}
    GHR_Admin_TaskForm.Click on Tags tab
    GHR_Admin_TaskForm.Click on Add Tags Button
    GHR_Admin_TaskForm.Search and Select the tag from the search results    ${Tag_Name}

Add an existing tag and verify tag is added
    [Arguments]  ${Task_Name}    ${Tag_Name}
    Select the task to be previewed                                 ${Task_Name}
    Add an Existing Tag                                             ${Tag_Name}
    Save the Task and verify Task is saved successfully
    Select the task to be previewed                                 ${Task_Name}
    Verify Tag is present                                           ${Tag_Name}

Remove Added Tag
    [Arguments]  ${Tag_Name}
    GHR_Admin_TaskForm.Click on Tags tab
    GHR_Admin_TaskForm.Click on cross icon of selected tag                 ${Tag_Name}

Verify Tag is removed
    [Arguments]  ${Tag_Name}
    GHR_Admin_TaskForm.Click on Tags tab
    GHR_Admin_TaskForm.Verify given Tag is not present                     ${Tag_Name}
    GHR_Admin_TaskForm.Click on close task form icon

Remove Tag and Verify Tag is removed
    [Arguments]  ${Task_Name}     ${Tag_Name}
    Select the task to be previewed                                 ${Task_Name}
    Remove Added Tag                                                ${Tag_Name}
    Save the Task and verify Task is saved successfully
    Select the task to be previewed                                 ${Task_Name}
    Verify Tag is removed                                           ${Tag_Name}

Add Followers to the Task
    [Arguments]  ${Follower}
    GHR_Admin_TaskForm.Click on Followers Tab
    GHR_Admin_TaskForm.Click on Add Followers Button
    GHR_Admin_TaskForm.Search and select the follower                      ${Follower}
    GHR_Admin_TaskForm.Click on Save button to save the task
    GHR_Admin_TasksToastMessages.Verify Task Updated Success Message is displayed

Verify Follower is added successfully
    GHR_Admin_TaskForm.Click on Followers Tab
    GHR_Admin_TaskForm.Verify Follower is present


Remove Follower of the Task
    [Arguments]  ${Follower}
    GHR_Admin_TaskForm.Click on Followers Tab
    GHR_Admin_TaskForm.Mouse Over Follower                                 ${Follower}
#    GHR_Admin_TaskForm.Click on remove button of the follower
    GHR_Admin_TaskForm.Click on Save button to save the task
    GHR_Admin_TasksToastMessages.Verify Task Created Success Message is displayed

Duplicate the task
    GHR_Admin_TaskForm.Click on Task options icon
    GHR_Admin_TaskForm.Select Task Duplicate option
    GHR_Admin_TaskForm.Confirm action
    GHR_Admin_TasksToastMessages.Verify Task duplicated Success Message is displayed

Duplicate the previewed task
    [Arguments]  ${Task_Name}
    Select the task to be previewed                                 ${Task_Name}
    Duplicate the task

Delete the task
    GHR_Admin_TaskForm.Click on Task options icon
    GHR_Admin_TaskForm.Select Task Delete optiion
    GHR_Admin_TaskForm.Confirm action
    GHR_Admin_TasksToastMessages.Verify Task deleted Success Message is displayed

Delete the previewed task
    [Arguments]  ${Task_Name}
    Select the task to be previewed                                 ${Task_Name}
    Delete the task

Remap checklist task to Standlone
    GHR_Admin_TaskForm.Click on cross icon of the checklist instance
    GHR_Admin_TaskForm.Click on Save button to save the task
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TasksToastMessages.Verify Task Updated Success Message is displayed

Navigate to checklist from Task dashboard
    GHR_Common.wait until Loader is disappeared
    GHR_Admin_TaskLandingPage.Click on Go To Checklists link
    GHR_Admin_ChecklistDashboardPage.Verify Checklist Dashboard page is displayed
    GHR_Common.wait until Loader is disappeared





