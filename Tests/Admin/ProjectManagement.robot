*** Settings ***
Documentation  Project Managemnt Automation is starting...
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Admin/PMAdminApp.robot

Test Setup     Begin Web Test
Test Teardown  End Web Test

#pybot -d Results Tests/Admin_PO/Projects_PO.robot

*** Variables ***
${Enironment} =  Project
${Browser} =  gc
&{URL}   Project=http://project8.proj.gr8hr.biz



#&{Project_Data}     ProjectName=Sample Project

*** Test Cases ***

#User must be able to navigate to Project Overview_PO Page
#    [Tags]  ${Smoke}
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#
#User must be able to create the project
#    [Tags]  ${Functional}
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#    Create Project
#
#User should not be able to create project with duplicate Project Name
#    [Tags]  ${Functional}
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#    Verify Duplicate Project Name
#
#User should not be able to create project with duplicate Project Code
#    [Tags]  ${Functional}
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#    Verify Duplicate Project Code
#
#User should be able to View a Project From Project List
#    [Tags]  ${Functional}
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#    View Project    Tesla
#
#User should be able to delete project having no workdays
##Create a project with Name as Delete Project
#    [Tags]  ${Functional}
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#    View Project    Delete Project
#    Delete Project Success
#
#User should not be able to delete project having workdays
#    [Tags]  ${Functional}
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#    View Project    Tesla
#    Delete Project Failure
#
#User should be able to Update the Project details
##Create a project with Name as Update Project
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#    View Project   Update Project
#    Update Project
#
#User should not be able to update project with duplicate Project Name
##Create a project with Name as Dup proj 1 Project
#    [Tags]  ${Functional}
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#    View Project   Dup proj 1
#    Verify Duplicate Project Name Update
#
#User should not be able to update project with duplicate Project Code
##Create a project with Name as Dup proj 2 Project
#    [Tags]  ${Functional}
#    Login To GreytHR Application
#    Navigate to Project Overview_PO page
#    View Project   Dup proj 2
#    Verify Duplicate Project Code Update
#
#User must be able to navigate to Project Workdays_PO Page
#    [Tags]  ${Smoke}
#    Login To GreytHR Application
#    Navigate to Project Workdays_PO page

User must be able to import workdays from Bulk Import
    [Tags]  ${Functional}
    login to greythr application
    navigate to project workdays page
    Bulk Imoprt Project Workdays
