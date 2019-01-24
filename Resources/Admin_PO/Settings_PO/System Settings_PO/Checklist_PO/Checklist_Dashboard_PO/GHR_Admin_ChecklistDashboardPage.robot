*** Settings ***
Library  SeleniumLibrary         #timeout=5.0, implicit_wait=5.0, run_on_failure=Capture Page Screenshot, screenshot_root_directory=None
Library  String
#Resource  ../../Data/TaskManagement/TMInputData.robot

*** Variables ***
${TM_ChecklistDashboardPage_Checklist_Page_Title} =                 xpath=//p[@class='checklist-label']
${TM_ChecklistDashboardPage_Create_Checklist_Button} =              xpath=//button[contains(text(),'Create Checklist')]
${TM_ChecklistDashboardPage_Checklist_Search_field} =               xpath=//div[@class='menu-header']/div/input
${TM_ChecklistDashboardPage_Checklist_List} =                       xpath=(//p[@title="abc"])[1]
${TM_ChecklistDashboardPage_Checklist_More_Options} =               xpath=//tm-more-option/div/i[@title='More options']
${TM_ChecklistDashboardPage_Checklist_Edit_Options} =               xpath=//div[@class='dropdown show open']/ul/li/a[text()='edit']
${TM_ChecklistDashboardPage_Checklist_Delete_Options} =             xpath=//div[@class='dropdown show open']/ul/li/a[text()='Delete']
${TM_ChecklistDashboardPage_Checklist_Accordion} =                  xpath=//checklist-home/accordion/accordion-group/div/div[@class='panel-heading card-header']
${TM_ChecklistDashboardPage_Task_Template_Accordion} =              xpath=//div[@class='task-template']//div[@class='panel-heading card-header']
${TM_ChecklistDashboardPage_Add_New_Task_Template_Button} =         xpath=(//add-task-template/div)[1]
${TM_ChecklistDashboardPage_Add_New_Task_Template_Button_BSS} =     xpath=//div[@class='btn-group']/button




*** Keywords ***

Verify Checklist Dashboard page is displayed
    wait until element is visible           ${TM_ChecklistDashboardPage_Checklist_Page_Title}       10s
    element should be visible               ${TM_ChecklistDashboardPage_Checklist_Page_Title}

Click on Create Checklist Button
    wait until element is visible           ${tm_checklistdashboardpage_create_checklist_button}    10s
    sleep  1s
    click button                            ${tm_checklistdashboardpage_create_checklist_button}

Search for a checklist
    [Arguments]  ${Checklist_Name}
    wait until element is visible           ${TM_ChecklistDashboardPage_Checklist_Search_field}     10s
    input text                              ${TM_ChecklistDashboardPage_Checklist_Search_field}             ${Checklist_Name}

Select the checklist fron the list
    [Arguments]  ${Checklist_Name}
    ${Replaced_String} =    replace string  ${TM_ChecklistDashboardPage_Checklist_List}             abc     ${Checklist_Name}
    wait until element is visible           ${Replaced_String}                                      15s
    click element                           ${Replaced_String}

Click on Checklist Accordion
    click element                           ${TM_ChecklistDashboardPage_Checklist_Accordion}

Click on Checklist Options
    wait until element is visible           ${TM_ChecklistDashboardPage_Checklist_More_Options}     15s
    click element                           ${TM_ChecklistDashboardPage_Checklist_More_Options}

Click on Edit Option of the Checklit
    click element                           ${tm_checklistdashboardpage_checklist_edit_options}

Click on Delete Option of the Checklit
    click element                           ${tm_checklistdashboardpage_checklist_delete_options}

Click on Task Template Accordion
    wait until element is visible           ${TM_ChecklistDashboardPage_Task_Template_Accordion}
    click element                           ${TM_ChecklistDashboardPage_Task_Template_Accordion}

Click on Add new Task Template Button in Blank State Screen
    click element                           ${TM_ChecklistDashboardPage_Add_New_Task_Template_Button_BSS}

Click on Add new Task Template Button in Grid
    click element                           ${TM_ChecklistDashboardPage_Add_New_Task_Template_Button}
