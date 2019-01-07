*** Settings ***
Library  Selenium2Library
Library  String

*** Variables ***

${TM_TaskForm_Header_Title} =               xpath=//h4/span[@title='abc']
${TM_TaskForm_Add_Assignee_Icon} =          xpath=(//p[text()='Assignee'])[2]
${TM_TaskForm_Remove_Assignee_link} =       xpath=//p[@title='Assignee']/../../Following-Sibling::div/div[@class="remove-selected ng-star-inserted"]/a
${TM_TaskForm_Assignee_Search_Field} =      xpath=//input[@placeholder='Search Assignee']
${TM_TaskForm_Assignee_List} =              xpath=//div/p[text()='#abc']
${TM_TaskForm_Task_Name_TextBox} =          xpath=//input[@name="name"]
${TM_TaskForm_Add_Checklist_Link} =         xpath=//div[@class='task-instance']/tm-tags/div/ul/li/tm-search/div/a/div
${TM_TaskForm_Checklist_Search_Field} =     xpath=//input[@placeholder='Search Checklist']
${TM_TaskForm_Checklist_Search_Result} =    xpath=(//div[@class='checklist-label ng-star-inserted']/../following-sibling::div[@role="menu"]/div/ul/li/a[text()="abc"]/..)[1]
${TM_TaskForm_Checklist_Remove_Icon} =      xpath=//li[@class='tag-list checklist-list ng-star-inserted']/span/i
${TM_TaskForm_DueDate_InputField} =         xpath=//div[@class='due-date']/div/gt-date-picker/div/div/div
${TM_TaskForm_Month_Lable} =                xpath=//button[contains(@class,'headerlabelbtn monthlabel')]
${TM_TaskForm_Today_Lable} =                xpath=//button[@class='headertodaybtn headertodaybtnenabled']
${TM_TaskForm_Year_Lable} =                 xpath=//button[contains(@class,'headerlabelbtn yearlabel')]
${TM_TaskForm_Date_Lable} =                 xpath=//td/div [@class='currmonth' or @class='currmonth sunday']/span[text()='1']
${TM_TaskForm_Next_Month_Button} =          xpath=//button[@aria-label='Next Month']
${TM_TaskForm_Previous_Month_Button} =      xpath=//button[@aria-label='Previous Month']
${TM_TaskForm_Next_Year_Button} =           xpath=//button[@aria-label='Next Year']
${TM_TaskForm_Previous_Year_Button} =       xpath=//button[@aria-label='Previous Year']
${TM_TaskForm_Priority_Low_CheckBox} =      xpath=//small[contains(text(),'Low')]/../preceding-sibling::span/i
${TM_TaskForm_Priority_Medium_CheckBox} =   xpath=//small[contains(text(),'Medium')]/../preceding-sibling::span/i
${TM_TaskForm_Priority_High_CheckBox} =     xpath=//small[contains(text(),'High')]/../preceding-sibling::span/i
${TM_TaskForm_Description_TextArea} =       xpath=//textarea[@placeholder='Write a description']
${TM_TaskForm_Description_TextArea1} =      xpath=//div[@class='form-group']/div
${TM_TaskForm_Description_TextArea_More} =  xpath=//div[@class='form-group']/div/a
${TM_TaskForm_Comments_Tab} =               xpath=//a[contains(@class, 'nav-link')]/span[text()='Comments']
${TM_TaskForm_Comment_Textarea} =           xpath=//textarea[@placeholder='Comment here']
${TM_TaskForm_Comment_Post_Button} =        xpath=//button[@type='submit'][contains(text(),'Post')]
${TM_TaskForm_Comment_Cancel_Button} =      xpath=///button[@type='submit'][contains(text(),'Cancel')]
${TM_TaskForm_Comment_Edit_icon} =          xpath=(//p[text()='abc'])[1]/../preceding-sibling::div/div/span[@class='icons-edit']
${TM_TaskForm_Comment_Delete_icon} =        xpath=(//p[text()='abc'])[1]/../preceding-sibling::div/div/span[@class='icons-delete']
${TM_TaskForm_Tags_Tab} =                   xpath=//a[contains(@class, 'nav-link')]/span[text()='Tags']
${TM_TaskForm_Add_Tags_Button} =            xpath=//tab[@heading="Tags"]/tm-tags/div/ul/li/tm-search/div
${TM_TaskForm_Add_Tags_Search_Field} =      xpath=//input[@placeholder='Search Tags']
${TM_TaskForm_Tag_Label} =                  xpath=//div[@class='tag-list-container']/span[@title='abc']
${TM_TaskForm_Tag_in_dropdown} =            xpath=//li[@class='menu-list-item']/a[text()='abc']
${TM_TaskForm_Delete_Tag_Icon} =            xpath=//div[@class='tag-list-container']/span[@title='abc']/../following-sibling::i
${TM_TaskForm_Followers_Tab} =              xpath=//a[contains(@class, 'nav-link')]/span[text()='Followers']
${TM_TaskForm_Add_Followers_Button} =       xpath=//div[@class='follower ng-star-inserted']
${TM_TaskForm_Follower_Search_Field} =      xpath=//input[@placeholder='Search Follower']
${TM_TaskForm_Follower_Search_Result} =     xpath=//div[@class='follower ng-star-inserted']/../../div/div/ul/li/a/div/p[text()='#abc']
${TM_TaskForm_Follower_Initial} =           xpath=//li[@class='initial-list ng-star-inserted']/div/span[text()='abc']
${TM_TaskForm_Remove_Follower_Icon} =       xpath=//li[@class='initial-list ng-star-inserted']/div/span/div/i
${TM_TaskForm_Follower_Tool_Tip} =          xpath=//div[@class="popover-content popover-body"][contains(text(),'abc')]
${TM_TaskForm_Save_Task_Button} =           xpath=//button[@class='btn btn-primary btn-md']
${TM_TaskForm_Close_Icon} =                 xpath=//div[@class='task-form-header']/span/i
${TM_TaskForm_Task_Options} =               xpath=//span[@title='More options']
${TM_TaskForm_Task_Delete_Options} =        xpath=//a[@class='dropdown-item'][text()='Delete']
${TM_TaskForm_Task_Duplicate_Options} =     xpath=//a[@class='dropdown-item'][text()='duplicate']
${TM_TaskForm_Popup_Yes_Button} =           xpath=//button[@class='btn btn-primary save-btn']
${TM_TaskForm_Popup_No_Button} =            xpath=//button[@class='btn btn-primary'][@type='reset']
${TM_TaskForm_Actions_Popup} =              xpath=(//div[@class='modal-content'])[2]



*** Keywords ***

Verify selected Task is Previewed
    [Arguments]  ${Task_Name}
    ${replaced_text} =  Replace String      ${TM_TaskForm_Header_Title}             abc                 ${Task_Name}
    wait until element is visible           ${replaced_text}                        10s
    element should be visible               ${replaced_text}

Click on Add Assignee Icon
    click element                           ${TM_TaskForm_Add_Assignee_Icon}

Search and select Assignee
    [Arguments]  ${Assignee_Number}
    wait until element is visible           ${TM_TaskForm_Assignee_Search_Field}
    click element                           ${TM_TaskForm_Assignee_Search_Field}
    input text                              ${TM_TaskForm_Assignee_Search_Field}                        ${Assignee_Number}
    SLEEP  1s
    ${Replaced_String} =  replace string    ${TM_TaskForm_Assignee_List}            abc                 ${Assignee_Number}
    wait until element is visible           ${Replaced_String}
    click element                           ${Replaced_String}

Click on Remove Assignee Link
    click element                           ${TM_TaskForm_Remove_Assignee_link}

Enter Task Name
    [Arguments]  ${TaskName}
    input text                              ${TM_TaskForm_Task_Name_TextBox}                            ${TaskName}

Clear Task Name
    clear element text                      ${tm_taskform_task_name_textbox}

Click on Add Checklist link
    click element                           ${TM_TaskForm_Add_Checklist_Link}

Search and select for a checklist
    [Arguments]  ${Checklist_Name}
    click element                           ${TM_TaskForm_Checklist_Search_Field}
    input text                              ${TM_TaskForm_Checklist_Search_Field}                       ${Checklist_Name}
    ${Replaced_String} =  replace string    ${TM_TaskForm_Checklist_Search_Result}  abc                 ${Checklist_Name}
    wait until element is visible           ${Replaced_String}                      10s
    sleep  1s
    click element                           ${Replaced_String}

#    @{Checklist_Name}   Create List             ${Checklist_Name}
#    :For  ${i}   IN                             @{Checklist_Name}
#    \   click element   //div[@class='checklist-label ng-star-inserted']
#    \   input text                              ${TM_TaskForm_Checklist_Search_Field}               ${i}
#    \   ${Replaced_String} =  replace string    ${TM_TaskForm_Checklist_Search_Result}      abc     ${i}
#    \   wait until element is visible           ${Replaced_String}                          5s
#    \   click element                           ${Replaced_String}

Click on cross icon of the checklist instance
    click element                           ${TM_TaskForm_Checklist_Remove_Icon}

Click on Due Date input field
    click element                           ${TM_TaskForm_DueDate_InputField}

Set Month
    [Arguments]  ${Given_Month}
    :For   ${i}  In Range   0   12
    \   ${Present_Month} =  get text        ${TM_TaskForm_Month_Lable}
    \   Exit For Loop If	                '${Present_Month}'=='${Given_Month}'
    \   click element                       ${TM_TaskForm_Next_Month_Button}

Set Year
    [Arguments]  ${Given_Year}
    ${Present_Year} =   get text            ${tm_taskform_year_lable}
    ${Result} =         Evaluate            ${Present_Year}- ${Given_Year}
    run keyword if                          ${Result}>0                             Past Year           ${Result}
    run keyword if                          ${Result}<0                             Future Year         ${Result}
Past Year
    [Arguments]  ${Result}
    :For   ${i}  In Range   0               ${Result}
    \   click element                       ${TM_TaskForm_Previous_Year_Button}
Future Year
    [Arguments]  ${Result}
    :For   ${i}  In Range                   ${Result}                               -1
    \   click element                       ${TM_TaskForm_Next_Year_Button}

Set Day
    [Arguments]  ${Day}
    ${Replaced_String} =  replace string    ${TM_TaskForm_Date_Lable}               1                   ${Day}
    click element                           ${Replaced_String}

Set Due Date
    [Arguments]  ${Date}    ${Month}    ${Year}
    run keyword  Set Month                  ${Month}
    run keyword  Set Year                   ${Year}
    run keyword  Set Day                    ${Date}

Enter Description
    [Arguments]  ${Description}
    input text                              ${TM_TaskForm_Description_TextArea}                         ${Description}

Click on Description More link
    click element                           ${tm_taskform_description_textarea_more}

Clear Description
    ${DescriptionMoreLinkVisible} =  Run Keyword And Return Status  page should contain element         ${tm_taskform_description_textarea_more}
    run keyword if                          ${DescriptionMoreLinkVisible}                               Click on Description More link
    click element                           ${tm_taskform_description_textarea1}
    clear element text                      ${tm_taskform_description_textarea}

Set Priority Low
    click element                           ${TM_TaskForm_priority_low_checkbox}

Set Priority Medium
    click element                           ${TM_TaskForm_priority_medium_checkbox}

Set Priority High
    click element                           ${TM_TaskForm_priority_high_checkbox}

Click on Comments tab
    click element                           ${TM_TaskForm_comments_tab}

Enter comment data
    [Arguments]  ${Comment}
    wait until element is enabled           ${TM_TaskForm_comment_textarea}
    click element                           ${TM_TaskForm_comment_textarea}
    input text                              ${TM_TaskForm_comment_textarea}                             ${Comment}

Click on Comment Post button
    wait until element is enabled           ${TM_TaskForm_comment_post_button}
    click button                            ${TM_TaskForm_comment_post_button}

Click on Comment Cancel button
    click button                            ${TM_TaskForm_comment_cancel_button}

Click on Comment Edit icon of selected comment
    [Arguments]  ${Comment}
    ${Replaced_String} =  replace string    ${TM_TaskForm_comment_edit_icon}        abc                 ${Comment}
    click element                           ${Replaced_String}

Clear Comment Data
    clear element text                      ${TM_TaskForm_comment_textarea}

Click on Comment Delete icon of selected comment
    [Arguments]  ${Comment}
    ${Replaced_String} =  replace string    ${TM_TaskForm_comment_delete_icon}      abc                 ${Comment}
    wait until element is visible           ${Replaced_String}
    click element                           ${Replaced_String}

Click on Tags tab
    click element                           ${TM_TaskForm_Tags_Tab}

Click on Add Tags Button
    click element                           ${tm_taskform_add_tags_button}

Enter New Tag Name
    [Arguments]  ${Tag_Name}
    click element                           ${tm_taskform_add_tags_search_field}
    input text                              ${tm_taskform_add_tags_search_field}                        ${Tag_Name}

Click Enter to create the tag
    press key                               ${tm_taskform_add_tags_search_field}    \\13

Verify Tag is created
    [Arguments]  ${Tag_Name}
    ${Replaced_String} =  replace string    ${tm_taskform_tag_label}                abc                 ${Tag_Name}
    wait until element is visible           ${Replaced_String}
    element should be visible               ${Replaced_String}

Enter New Tag and Verify tag is created
    [Arguments]  ${Tag_Name}
    click element                           ${tm_taskform_add_tags_search_field}
    input text                              ${tm_taskform_add_tags_search_field}                        ${Tag_Name}
    press key                               ${tm_taskform_add_tags_search_field}    \\13
    ${Replaced_String} =  replace string    ${tm_taskform_tag_label}                abc                 ${Tag_Name}
    wait until element is visible           ${Replaced_String}
    element should be visible               ${Replaced_String}


#Code for entering multiple tags
#    @{Tag_Name}  create list  a   b
#    :For  ${i}  IN    @{Tag_Name}
#    \   click element                           ${tm_taskform_add_tags_search_field}
#    \   input text                              ${tm_taskform_add_tags_search_field}            ${Tag_Name}
#    \   press key                               ${tm_taskform_add_tags_search_field}    \\13
#    \   ${Replaced_String} =  replace string    ${tm_taskform_tag_label}                abc     ${i}
#    \   wait until element is visible           ${Replaced_String}
#    \   element should be visible               ${Replaced_String}

Search and Select the tag from the search results
    [Arguments]  ${Tag_Name}
    input text                              ${TM_TaskForm_Add_Tags_Search_Field}                        ${Tag_Name}
    ${Replace_String} =  replace string     ${TM_TaskForm_Tag_in_dropdown}          abc                 ${Tag_Name}
    SLEEP  1s
    wait until element is visible           ${Replace_String}
    click element                           ${Replace_String}

Verify given Tag is not present
     [Arguments]  ${Tag_Name}
    ${Replaced_String} =  replace string    ${tm_taskform_tag_label}                abc                 ${Tag_Name}
    element should not be visible               ${Replaced_String}

Click on cross icon of selected tag
    [Arguments]  ${Tag_Name}
    ${Replaced_String} =    replace string  ${TM_TaskForm_Delete_Tag_Icon}          abc                 ${Tag_Name}
    click element                           ${Replaced_String}

Click on Followers Tab
    click element                           ${tm_taskform_followers_tab}
    Press Key                               ${TM_TaskForm_Save_Task_Button}         \\40

Click on Add Followers Button
    click element                           ${TM_TaskForm_Add_Followers_Button}

Search and select the follower
    [Arguments]  ${Employee_Number}
    click element                           ${TM_TaskForm_Follower_Search_Field}
    input text                              ${TM_TaskForm_Follower_Search_Field}                        ${Employee_Number}
    ${Replaced_String} =  replace string    ${TM_TaskForm_Follower_Search_Result}   abc                 ${Employee_Number}
    wait until element is visible           ${Replaced_String}                      15s
    click element                           ${Replaced_String}

Mouse Over Follower
    [Arguments]  ${Follower_Initial}
    ${Replaced_String} =    replace string  ${TM_TaskForm_Follower_Initial}         abc                 ${Follower_Initial}
    mouse over                              ${Replaced_String}
    mouse over                              ${TM_TaskForm_Remove_Follower_Icon}

Verify Follower is present
    [Arguments]  ${Employee_Number}
    ${Replaced_String} =    replace string  ${TM_TaskForm_Follower_Tool_Tip}         abc                ${Employee_Number}
    page should contain element             ${Replaced_String}


Click on remove button of the follower
    wait until element is visible           ${TM_TaskForm_Remove_Follower_Icon}
    click element                           ${TM_TaskForm_Remove_Follower_Icon}

Click on Save button to save the task
    click button                            ${TM_TaskForm_Save_Task_Button}

Click on close task form icon
    click element                           ${TM_TaskForm_Close_Icon}

Click on task options icon
    click element                           ${TM_TaskForm_Task_Options}

Select Task Delete optiion
    click element                           ${TM_TaskForm_Task_Delete_Options}

Select Task Duplicate option
    click element                           ${TM_TaskForm_Task_Duplicate_Options}

Confirm action
    wait until element is visible           ${TM_TaskForm_Actions_Popup}
    wait until element is enabled           ${TM_TaskForm_Popup_Yes_Button}         10s
    click button                            ${TM_TaskForm_Popup_Yes_Button}

Reject Action
    wait until element is visible           ${TM_TaskForm_Actions_Popup}
    wait until element is enabled           ${TM_TaskForm_Popup_No_Button}           10s
    click button                            ${TM_TaskForm_Popup_No_Button}
