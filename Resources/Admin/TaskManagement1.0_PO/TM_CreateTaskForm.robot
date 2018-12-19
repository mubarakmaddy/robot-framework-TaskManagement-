*** Settings ***
Library  Selenium2Library

*** Variables ***

${CT_Cancel_Task_Button} =         className=cancel-task
${CT_Save_Task_Button} =           xpath=//button[@type='submit']
${CT_Task_Name_TextBox} =          name=taskName
${CT_Description_TextArea} =       xpath=//textarea[@placeholder='Description']
${CT_Priority_Low_CheckBox} =      xpath=//div[@class='col-md-3 col-sm-3']/div[contains(text(),'Low')]/preceding-sibling::i
${CT_Priority_Medium_CheckBox} =   xpath=//div[@class='col-md-3 col-sm-3']/div[contains(text(),'Medium')]/preceding-sibling::i
${CT_Priority_High_CheckBox} =     xpath=//div[@class='col-md-3 col-sm-3']/div[contains(text(),'High')]/preceding-sibling::i
${CT_Task_Status} =                name=taskStatus
${CT_Checklist_RadioButton} =      xpath=//input[@id='checklist']
${CT_Task_RadioButton} =           xpath=//input [@id='task']
${CT_DueDate_InputField} =         xpath=//span [@class='gtdpicon icon-gtdpcalendar']
${CT_Month_Lable} =                xpath=//button [@class='headerlabelbtn monthlabel']
${CT_Today_Lable} =                xpath=//button[@class='headertodaybtn headertodaybtnenabled']
${$CT_Year_Lable} =                xpath=//button [@class='headerlabelbtn yearlabel']
${CT_Date_Lable} =                 xpath=//td/div [@class='currmonth' or @class='currmonth sunday']
${CT_Next_Month_Button} =          xpath=//button[@aria-label='Next Month']
${CT_Previous_Month_Button} =      xpath=//button[@aria-label='Previous Month']
${CT_Next_Year_Button} =           xpath=//button[@aria-label='Next Year']
${CT_Previous_Year_Button} =       xpath=//button[@aria-label='Previous Year']
${CT_Assignee_Search_Field} =      xpath=//input [@class='owner-name ng-untouched ng-pristine ng-valid'])[1]
${CT_Assignee_Dropdown} =          xpath=//div [@class='drop']
${CT_Add_tags_SearchField} =       xpath=//input[@placeholder='Add Tags']
${CT_Add_More_Tags_SearchField} =  xpath=//input[@placeholder='Add More Tags']
${CT_Tags_Dropdown} =              xpath=
${CT_Comment_Textarea} =           xpath=//textarea [@placeholder='Write a comment.....']
${CT_Followers_Icon} =             xpath=//span [@class='circle icon']
${CT_Followers_Search_Field} =     xpath=//input[@placeholder='Search for employee'])[2]
${CT_Followers_Dropdown} =         xpath=//div[@class='drop']
${CT_Checklist_inputField} =       xpath=//input[@placeholder='Search a Checklist']

*** Keywords ***

Enter Task Name
    [Arguments]  ${TaskName}
    input text  ${CT_Task_Name_TextBox}  ${TaskName}

Enter Description
    [Arguments]  ${Description}
    click element  ${CT_Description_TextArea}
    input text  ${CT_Description_TextArea}  ${Description}

Set Priority Low
    click element  ${ct_priority_low_checkbox}

Set Priority Medium
    click element  ${ct_priority_medium_checkbox}

Set Priority High
    click element  ${ct_priority_high_checkbox}

Set Task Status
    [Arguments]  ${Ststus}
    Select From List By Label   ${CT_Task_Status}  ${Ststus}

Map Task to None
    click element  ${CT_Task_RadioButton}

Map Task to Checklist
    click element  ${ct_checklist_radiobutton}

Click on Save button to save the task
    click button  ${CT_Save_Task_Button}

Verify Task is created





