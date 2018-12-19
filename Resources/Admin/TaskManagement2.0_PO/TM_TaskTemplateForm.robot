*** Settings ***
Library  Selenium2Library
Library  String
*** Variables ***
${TM_TaskTemplateForm_Task_Template_Name} =               xpath=//input[@name='taskTemplateName']
${TM_TaskTemplateForm_Task_Template_Priority_Dropdown} =  xpath=//div[@class='task-template-form']//gt-select-box[@name='priority']//button
${TM_TaskTemplateForm_Task_Template_Priority_Options} =   xpath=//gt-select-box[@name='priority']//a[@title='abc']
${TM_TaskTemplateForm_Task_Template_Description} =        xpath=//div[@class='task-template-form']//textarea[@name='description']
${TM_TaskTemplateForm_Task_Template_Complete_By} =        xpath=//input[@name='completionDays']
${TM_TaskTemplateForm_Task_Template_Owner_Dropdown} =     xpath=//gt-select-box[@name='owner']
${TM_TaskTemplateForm_Task_Template_Owner_Options} =      xpath=//gt-select-box[@name='owner']//a[@title="abc"]
${TM_TaskTemplateForm_Task_Template_Save_Button} =        xpath=//div[@class='task-template-form']//button[@type='submit']
${TM_TaskTemplateForm_Task_Template_Cancel_Button} =      xpath=//div[@class='task-template-form']//button[text()='Cancel']


*** Keywords ***
Enter Task Template Name
    [Arguments]  ${Task_Template_Name}
    wait until element is visible  ${TM_TaskTemplateForm_Task_Template_Name}    10s
    click element  ${TM_TaskTemplateForm_Task_Template_Name}
    input text  ${TM_TaskTemplateForm_Task_Template_Name}      ${Task_Template_Name}

Set Task Template Proirity
    [Arguments]  ${Task_Template_Priority}
    #Low
    #Medium
    #High
    click element  ${TM_TaskTemplateForm_Task_Template_Priority_Dropdown}
    ${Replaced_String} =  replace string    ${TM_TaskTemplateForm_Task_Template_Priority_Options}      abc      ${Task_Template_Priority}
    click element  ${Replaced_String}

Enter Task Template Description
    [Arguments]  ${Task_Template_Description}
    input text  ${tm_TaskTemplateForm_task_template_description}      ${Task_Template_Description}

Enter Complete By Days
    [Arguments]  ${Compate_By_Days}
    input text  ${TM_TaskTemplateForm_Task_Template_Complete_By}    ${Compate_By_Days}

Set Task Template Owner
    [Arguments]  ${Task_Template_Owner}
    click element  ${TM_TaskTemplateForm_Task_Template_Owner_Dropdown}
    ${Replaced_String} =  replace string    ${TM_TaskTemplateForm_Task_Template_Owner_Options}      abc      ${Task_Template_Owner}
    click element  ${Replaced_String}
    
Click on Save Button of Task templaten form
    click element  ${tm_TaskTemplateForm_task_template_save_button}
    
Click on Cancel button of task template form   
    click element  ${tm_TaskTemplateForm_task_template_cancel_button} 