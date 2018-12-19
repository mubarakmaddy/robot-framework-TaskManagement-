*** Settings ***
Library  Selenium2Library
Library  String

*** Variables ***
${TM_ChecklistForm_Blank_Tab} =                         xpath=(//span[text()='Blank'])[2]
${TM_ChecklistForm_Templates_Tab} =                     xpath=//span[text()='Templates']
${TM_ChecklistForm_Checklist_Name_Text_Field} =         xpath=(//input[@name='checklistName'])[2]
${TM_ChecklistForm_Priority_Dropdown} =                 xpath=(//div[@class='checklist-form'])[2]//gt-select-box[@name='priority']/div/button
${TM_ChecklistForm_Priority_Options} =                  xpath=(//div[@class='checklist-form'])[2]//a[@title='abc']

${TM_ChecklistForm_Description_Text_Area} =             xpath=(//textarea[@name='description'][@rows='3'])[2]

${TM_ChecklistForm_Map_To_Event_Category_Dropdown} =    xpath=(//gt-select-box[@name='eventModule'])[2]/div/button
${TM_ChecklistForm_Map_To_Event_Category_options} =     xpath=(//gt-select-box[@name='eventModule'])[2]//a[@title="abc"]

${TM_ChecklistForm_Select_Event_for_Dropdown} =         xpath=(//gt-select-box[@name='eventType'])[2]/div/button
${TM_ChecklistForm_Select_Event_for_options} =          xpath=(//gt-select-box[@name='eventType'])[2]//a[@title="abc"]

${TM_ChecklistForm_Before_Radio_Button} =               xpath=//span[text()='Before']
${TM_ChecklistForm_Same_Day_Radio_Button} =             xpath=//span[text()='Same Day']
${TM_ChecklistForm_After_Radio_Button} =                xpath=//span[text()='After']
${TM_ChecklistForm_Trigger_On_Days_Text_Box} =          xpath=//div[@class='day-field']/div/input

${TM_ChecklistForm_Owner_Drop_Down} =                   xpath=(//gt-select-box[@name='listenerType'])/div/button
${TM_ChecklistForm_Owner_options} =                     xpath=(//gt-select-box[@name='listenerType'])//a[@title="abc"]


${TM_ChecklistForm_User_Drop_Down} =                    xpath=//div[@class='checklist-user']/tm-search/div/a/div
${TM_ChecklistForm_User_Search} =                       xpath=//div[@class='checklist-user']/tm-search/div/div/div/form/input
${TM_ChecklistForm_User_List} =                         xpath=//div[@class='checklist-user']/tm-search/div/div/div/ul/li/a/div/p[text()='abc']

${TM_ChecklistForm_Save_Button} =                       xpath=(//div[@class='checklist-form'])[2]/div/div/div/button[@type='submit']
${TM_ChecklistForm_Cancel_Button} =                     xpath=(//div[@class='checklist-form'])[2]/div/div/div/button[@type='reset']
${TM_ChecklistForm_Close_Button} =                      xpath=//h4[contains(text(),'Create Checklist')]/../button[@class='close pull-right']

*** Keywords ***
Click on Blank Tab
    wait until element is visible   ${TM_ChecklistForm_Blank_Tab}       10s
    click element  ${TM_ChecklistForm_Blank_Tab}

Click on Templated Tab
    click element  ${TM_ChecklistForm_Templates_Tab}

Enter Checklist Name
    [Arguments]  ${Checklist_Name}
    input text  ${TM_ChecklistForm_Checklist_Name_Text_Field}   ${Checklist_Name}

Set Checklist Proirity
    [Arguments]  ${Checklist_Priority}
    #Low
    #Medium
    #High
    click element  ${TM_ChecklistForm_Priority_Dropdown}
    ${Replaced_String} =  replace string    ${TM_ChecklistForm_Priority_Options}      abc      ${Checklist_Priority}
    click element  ${Replaced_String}

Enter Checklist Description
    [Arguments]  ${Checklist_Description}
    input text  ${tm_checklistform_description_text_area}   ${Checklist_Description}

Set Checklist Event Category
    [Arguments]  ${Event_Category}
    #Core HR
    #Payroll
    click element  ${TM_ChecklistForm_Map_To_Event_Category_Dropdown}
    ${Replaced_String} =  replace string    ${TM_ChecklistForm_Map_To_Event_Category_options}      abc      ${Event_Category}
    click element  ${Replaced_String}

Set Checklist Event Type
    [Arguments]  ${Event_Type}
    #Add Employee
    #Employee Birth Day
    #Employee Joining Anniversary
    #Employees Confirm Date
    #Employees Last Working Day
    #Payroll Cutoff
    #Payroll Input Lock
    #Payroll Process
    #Post Payroll
    click element  ${TM_ChecklistForm_Select_Event_for_Dropdown}
    ${Replaced_String} =  replace string    ${TM_ChecklistForm_Select_Event_for_options}     abc      ${Event_Type}
    click element  ${Replaced_String}

Click on Triggers On Before Radio Button and enter no. of days
    [Arguments]  ${Number_Of_Days}
    wait until element is visible   ${tm_checklistform_before_radio_button}     10s
    click element      ${tm_checklistform_before_radio_button}
    input text  ${tm_checklistform_trigger_on_days_text_box}    ${Number_Of_Days}

Click on Triggers On Same Day Radio Button
    wait until element is visible   ${tm_checklistform_same_day_radio_button}     10s
    click element  ${tm_checklistform_same_day_radio_button}

Click on Triggers On After Radio Button and enter no. of days
    [Arguments]  ${Number_Of_Days}
    wait until element is visible   ${tm_checklistform_after_radio_button}     10s
    click button  ${tm_checklistform_after_radio_button}
    input text  ${tm_checklistform_trigger_on_days_text_box}    ${Number_Of_Days}

Enter number of days for Before/After
    [Arguments]  ${Number_Of_Days}
    input text  ${tm_checklistform_trigger_on_days_text_box}    ${Number_Of_Days}

Set Checklist Owner
    [Arguments]  ${Checklist_Owner}

#    CoreHR::Employee
#            Employee User
#            Manager
#            Manager'S Manager
#            Named User
#
#    Payroll::Employee User
#             Named User
    click element  ${TM_ChecklistForm_Owner_Drop_Down}
    ${Replaced_String} =  replace string    ${TM_ChecklistForm_Owner_options}      abc      ${Checklist_Owner}
    click element  ${Replaced_String}

Set Checklist User
    [Arguments]  ${Checklist_User}
    click element  ${TM_ChecklistForm_User_Drop_Down}
    click element  ${TM_ChecklistForm_User_Search}
    input text     ${TM_ChecklistForm_User_Search}      ${Checklist_User}
    ${Replaced_String} =  replace string    ${TM_ChecklistForm_User_List}      abc      ${Checklist_User}
    wait until element is visible  ${Replaced_String}       15s
    click element  ${Replaced_String}


Click on Checklist Save Button
    click button  ${tm_checklistform_save_button}

Click on Checklist Cancel Button
    click button  ${tm_checklistform_cancel_button}



