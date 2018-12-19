*** Settings ***

Resource  ../../Resources/Admin/SignInAndSignOut_PO/LoginPage.robot
Resource  ../../Resources/Admin/Home_PO/GreytHRHomePage.robot
Resource  ../../Resources/Admin/Navigation_PO/GreytHRNavigation.robot
Resource  ../../Resources/Admin/ProjectManagement/Overview/ProjectOverview.robot
Resource  ../../Resources/Admin/ProjectManagement/Overview/CreateProjectForm.robot
Resource  ../../Resources/Admin/ProjectManagement/Overview/UpdateProjectForm.robot
Resource  ../../Resources/Admin/ProjectManagement/Workdays/ProjectWorkdays.robot
Resource  ../../Resources/Admin/Employee_PO/Admin/ExcelImport.robot
Resource  ../../Resources/Admin/ProjectManagement/PM_ToastMessages.robot


*** Keywords ***

Login To GreytHR Application
    LoginPage.Load GreytHR
    LoginPage.Enter User Name
    LoginPage.Enter Password
    LoginPage.Click on Login button
    GreytHRHomePage.Verify Home page is loaded

Navigate to Project Overview page
    GreytHRNavigation.Click on unexpanded ProjectManagement menu
    GreytHRNavigation.Click on Project Overview page in GreytHR
    ProjectOverview.Verify Project Overview page is loaded

Create Project
    ProjectOverview.Click on Create Project Button
    CreateProjectForm.Enter Project Name            Project1
    CreateProjectForm.Enter Project Code            Project1
    CreateProjectForm.Set Project Priority          1
    CreateProjectForm.Enter Project Description     Project1
    CreateProjectForm.Set Project Client            ABC Ltd
    CreateProjectForm.Set Project Billable Type     Time and Material
    CreateProjectForm.Set Project Wage Rate         100
    CreateProjectForm.Set Project Wage Type         Per Day
    CreateProjectForm.Set Project OT Rate           100
    CreateProjectForm.Set Project OT Type           Per Hour
    CreateProjectForm.Save Project Button
    CreateProjectForm.Verify Project Created Success Banner is displayed

Verify Duplicate Project Name
    ProjectOverview.Click on Create Project Button
    CreateProjectForm.Enter Project Name            Project2
    CreateProjectForm.Save Project Button
    CreateProjectForm.Click On Create Another Project Button
    CreateProjectForm.Enter Project Name            Project2
    CreateProjectForm.Save Project Button
   PM_ToastMessages.Duplicate Project Name Alert Message

Verify Duplicate Project Code
    ProjectOverview.Click on Create Project Button
    CreateProjectForm.Enter Project Name            Project3
    CreateProjectForm.Enter Project Code            Project3
    CreateProjectForm.Save Project Button
    CreateProjectForm.Click On Create Another Project Button
    CreateProjectForm.Enter Project Name            Project3
    CreateProjectForm.Enter Project Code            Project3
    CreateProjectForm.Save Project Button
    PM_ToastMessages.Duplicate Project Code Alert Message

View Project
    [Arguments]  ${ProjectToView}
    ProjectOverview.Select a Project From List     ${ProjectToView}

Delete Project Success
    ProjectOverview.Click on Delete Project icon
    ProjectOverview.Click On Delete Project Confirm Button
    PM_ToastMessages.Verify Project Delete Success Message is displayed

Delete Project Failure
    ProjectOverview.Click on Delete Project icon
    ProjectOverview.Click On Delete Project Confirm Button
    PM_ToastMessages.Verify Project Delete Failure Message is displayed

Update Project
    ProjectOverview.Click on Edit Project icon
    UpdateProjectForm.Update project name              UpdatedProject2
    UpdateProjectForm.Update Project Code              UpdatedProject2
    UpdateProjectForm.Update Project Priority          2
    UpdateProjectForm.Update Project Description       UpdatedProject2
    UpdateProjectForm.Update Project Client            Flipkart
    UpdateProjectForm.Update Project Billable Type     Non Billable
    UpdateProjectForm.Update Project Wage Rate         200
    UpdateProjectForm.Update Project Wage Type         Per Hour
    UpdateProjectForm.Update Project OT Rate           200
    UpdateProjectForm.Update Project OT Type           Per Day
    UpdateProjectForm.Click on Update Project Button
    PM_ToastMessages.Verify Project Updated Success Message is displayed

Verify Duplicate Project Name Update
    ProjectOverview.Click on Edit Project icon
    UpdateProjectForm.Update project name              Tesla
    UpdateProjectForm.Click on Update Project Button
    PM_ToastMessages.Duplicate Project Name Alert Message

Verify Duplicate Project Code Update
    ProjectOverview.Click on Edit Project icon
    UpdateProjectForm.Update Project Code              Tesla
    UpdateProjectForm.Click on Update Project Button
    PM_ToastMessages.Duplicate Project Code Alert Message

Navigate to Project Workdays page
    GreytHRNavigation.Click on unexpanded ProjectManagement menu
    GreytHRNavigation.Click on Project Workdays page in GreytHR
    ProjectWorkdays.Verify Project Workdays page is loaded

Bulk Imoprt Project Workdays
    ProjectWorkdays.Click on Bulk import link
    ExcelImport.Verify Excel import page is loaded
    ExcelImport.Upload workdays data                   D:\\GreytHR\\Data\\ProjectManagement\\Project Workdays.xls
    ExcelImport.Verify If Excel is uploaded
    sleep  5s
    ExcelImport.Click on Next Button in excel Import
#    ExcelImport.Verify Step 2 page is displayed
    ExcelImport.Click on Next Button in excel Import
#    ExcelImport.Verify Step 3 page is displayed
    sleep  2s
    ExcelImport.Click on Next Button in excel Import
    ExcelImport.Click on OK button in excel import

