*** Settings ***
Documentation  Task Managemnet Automation is starting...
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Admin/TMAdminApp.robot
#Resource  ../../Data/TaskManagement/TMInputData.robot


Test Setup     Common.Begin Web Test
Test Teardown  Common.End Web Test

#pybot -d Results Tests/Admin/TaskManagement.robot

*** Test Cases ***
##### TASK TEST CASES ##### TASK TEST CASES #### TASK TEST CASES ##### TASK TEST CASES #### TASK TEST CASES ##### TASK TEST CASES ####



#User must be able to login to GreytHR application As Admin
#    [Tags]  ${Smoke}
#    Login To GreytHR Application    ${Majordmo_Login_credentials}

#Admin User must be able to navigate to Task Management
#    [Tags]  ${Smoke}
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page

#Admin User should be able to create a Standalone Task
#    [Tags]  ${Functional}
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    Create Standalone task Task       TMInputData.Task Details

#Admin User should be able to create a Task Mapping to single checklist
#    [Tags]  ${Functional}
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    Create a task mapping to checklist instance      New Task3    New Task Desc3   5018  #${Checklist_Name}

#Admin User should be able to view any task
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task   Release payslips

#Admin User must be able to view and update any task (Task Name & Description)
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task   View Task
#    Update Task     dEMO   dEMO
#
#Admin User should be able to complete the task
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    Complete Task   View Task

#Admin User should be able to reopen the completed task
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    Reopen Task   View Task

#Admin User should be able to post a comment on the task
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task   Comment task
#    Post Comment    Comment 1

#Admin User should be able to update the comment
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task   Comment task
#    Update Comment  Comment 1   Updated Comment

#Admin User should be able to delete the comment
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task    Comment task
#    Delete Comment  Updated Comment

#Admin User should be able to Add a New Tag and verify if tag is created
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task    Comment task
#    Add a New Tag   New Tag
#    View Task    Comment task
#    Verify Tag is present   New Tag
#
#Admin User should be able to Add an existing Tag
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task    Comment task
#    Add an Existing Tag   Abc
#
#Admin User should be able to Add Followers to the Task
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task    Deepak Panda1
#    Add Followers to the Task   5018
#
#Admin User should be able to Remove Followers to the Task
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task    Deepak Panda1
#    Remove Follower of the Task     AH
#
#Admin User should be able to remove the tag of the selected task
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task    Comment task
#    Remove Tag  New Tag
#
#Admin User should be able to change the checklist task to standalone task
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    View Task    Comment task
#    Remap checklist task to Standlone
#
#
#
##### CHECKLIST TEST CASES ##### CHECKLIST TEST CASES #### CHECKLIST TEST CASES ##### CHECKLIST TEST CASES #### CHECKLIST TEST CASES #####
#
#
#Admin user should be able to navigate to Checklist dashboard page from Task Dashboard page
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to Task Management Page
#    Navigate to checklist from Task dashboard
#
#Admin user should be able to navigate to Checklist dashboard page from system settings menu
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to checklist Dashboard Page from System Settings
#
#Admin user should be able to create checklist
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to checklist Dashboard Page from System Settings
#    Create Checklist

#Admin user should be able to search and view any created checkilst
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to checklist Dashboard Page from System Settings
#    Search and view the checklist       Payroll Process

Admin User should be able to delete a checklist having no active instances
    Login To GreytHR Application    ${Admin_Login_credentials}
    Navigate to checklist Dashboard Page from System Settings
    Search and view the checklist       Auto checklist
    Delete a chekclist

#Create a task template from Blank State Screen for a checklist
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to checklist Dashboard Page from System Settings
#    Search and view the checklist       Auto checklist
#    Create Task Template from Blank state Screen
#    Create Task Template

#Create a task template from grid for a checklist
#    Login To GreytHR Application    ${Admin_Login_credentials}
#    Navigate to checklist Dashboard Page from System Settings
#    Search and view the checklist       Auto checklist
#    Create Task Template from grid
#    Create Task Template

