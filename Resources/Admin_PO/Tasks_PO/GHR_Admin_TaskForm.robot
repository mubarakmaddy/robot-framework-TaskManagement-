*** Settings ***
Library  SeleniumLibrary        # timeout=20.0, implicit_wait=20.0, run_on_failure=Capture Page Screenshot, screenshot_root_directory=None
Library  String

*** Variables ***

${GHR_Admin_TaskForm_Header_Title} =               xpath=//h4/span[@title='abc']
${GHR_Admin_TaskForm_Add_Assignee_Icon} =          xpath=(//p[text()='Assignee'])[2]
${GHR_Admin_TaskForm_Remove_Assignee_link} =       xpath=//p[@title='Assignee']/../../Following-Sibling::div/div[@class="remove-selected ng-star-inserted"]/a
${GHR_Admin_TaskForm_Assignee_Search_Field} =      xpath=//input[@placeholder='Search Assignee']
${GHR_Admin_TaskForm_Assignee_List} =              xpath=//div/p[text()='#abc']
${GHR_Admin_TaskForm_Task_Name_TextBox} =          xpath=//input[@name="name"]
${GHR_Admin_TaskForm_Add_Checklist_Link} =         xpath=//div[@class='task-instance']/tm-tags/div/ul/li/tm-search/div/a/div
${GHR_Admin_TaskForm_Checklist_Search_Field} =     xpath=//input[@placeholder='Search Checklist']
${GHR_Admin_TaskForm_Checklist_Search_Result} =    xpath=(//div[@class='checklist-label ng-star-inserted']/../following-sibling::div[@role="menu"]/div/ul/li/a[text()="abc"]/..)[1]
${GHR_Admin_TaskForm_Checklist_Remove_Icon} =      xpath=//li[@class='tag-list checklist-list ng-star-inserted']/span/i
${GHR_Admin_TaskForm_DueDate_InputField} =         xpath=//div[@class='due-date']/div/gt-date-picker/div/div/div
${GHR_Admin_TaskForm_Month_Lable} =                xpath=//button[contains(@class,'headerlabelbtn monthlabel')]
${GHR_Admin_TaskForm_Today_Lable} =                xpath=//button[@class='headertodaybtn headertodaybtnenabled']
${GHR_Admin_TaskForm_Year_Lable} =                 xpath=//button[contains(@class,'headerlabelbtn yearlabel')]
${GHR_Admin_TaskForm_Date_Lable} =                 xpath=//td/div [@class='currmonth' or @class='currmonth sunday']/span[text()='1']
${GHR_Admin_TaskForm_Next_Month_Button} =          xpath=//button[@aria-label='Next Month']
${GHR_Admin_TaskForm_Previous_Month_Button} =      xpath=//button[@aria-label='Previous Month']
${GHR_Admin_TaskForm_Next_Year_Button} =           xpath=//button[@aria-label='Next Year']
${GHR_Admin_TaskForm_Previous_Year_Button} =       xpath=//button[@aria-label='Previous Year']
${GHR_Admin_TaskForm_Priority_Low_CheckBox} =      xpath=//small[contains(text(),'Low')]/../preceding-sibling::span/i
${GHR_Admin_TaskForm_Priority_Medium_CheckBox} =   xpath=//small[contains(text(),'Medium')]/../preceding-sibling::span/i
${GHR_Admin_TaskForm_Priority_High_CheckBox} =     xpath=//small[contains(text(),'High')]/../preceding-sibling::span/i
${GHR_Admin_TaskForm_Description_TextArea} =       xpath=//textarea[@placeholder='Write a description']
${GHR_Admin_TaskForm_Description_TextArea1} =      xpath=//div[@class='form-group']/div
${GHR_Admin_TaskForm_Description_TextArea_More} =  xpath=//div[@class='form-group']/div/a
${GHR_Admin_TaskForm_Comments_Tab} =               xpath=//a[contains(@class, 'nav-link')]/span[text()='Comments']
${GHR_Admin_TaskForm_Comment_Textarea} =           xpath=//textarea[@placeholder='Comment here']
${GHR_Admin_TaskForm_Comment_Post_Button} =        xpath=//button[@type='submit'][contains(text(),'Post')]
${GHR_Admin_TaskForm_Comment_Cancel_Button} =      xpath=///button[@type='submit'][contains(text(),'Cancel')]
${GHR_Admin_TaskForm_Comment_Edit_icon} =          xpath=(//p[text()='abc'])[1]/../preceding-sibling::div/div/span[@class='icons-edit']
${GHR_Admin_TaskForm_Comment_Delete_icon} =        xpath=(//p[text()='abc'])[1]/../preceding-sibling::div/div/span[@class='icons-delete']
${GHR_Admin_TaskForm_Tags_Tab} =                   xpath=//a[contains(@class, 'nav-link')]/span[text()='Tags']
${GHR_Admin_TaskForm_Add_Tags_Button} =            xpath=//tab[@heading="Tags"]/tm-tags/div/ul/li/tm-search/div
${GHR_Admin_TaskForm_Add_Tags_Search_Field} =      xpath=//input[@placeholder='Search Tags']
${GHR_Admin_TaskForm_Tag_Label} =                  xpath=//div[@class='tag-list-container']/span[@title='abc']
${GHR_Admin_TaskForm_Tag_in_dropdown} =            xpath=//li[@class='menu-list-item']/a[text()='abc']
${GHR_Admin_TaskForm_Delete_Tag_Icon} =            xpath=//div[@class='tag-list-container']/span[@title='abc']/../following-sibling::i
${GHR_Admin_TaskForm_Followers_Tab} =              xpath=//a[contains(@class, 'nav-link')]/span[text()='Followers']
${GHR_Admin_TaskForm_Add_Followers_Button} =       xpath=//div[@class='follower ng-star-inserted']
${GHR_Admin_TaskForm_Follower_Search_Field} =      xpath=//input[@placeholder='Search Follower']
${GHR_Admin_TaskForm_Follower_Search_Result} =     xpath=//div[@class='follower ng-star-inserted']/../../div/div/ul/li/a/div/p[text()='#abc']
${GHR_Admin_TaskForm_Follower_Initial} =           xpath=//li[@class='initial-list ng-star-inserted']/div/span[text()='abc']
${GHR_Admin_TaskForm_Remove_Follower_Icon} =       xpath=//li[@class='initial-list ng-star-inserted']/div/span/div/i
${GHR_Admin_TaskForm_Follower_Tool_Tip} =          xpath=//div[@class="popover-content popover-body"][contains(text(),'abc')]
${GHR_Admin_TaskForm_Save_Task_Button} =           xpath=//button[@class='btn btn-primary btn-md']
${GHR_Admin_TaskForm_Close_Icon} =                 xpath=//div[@class='task-form-header']/span/i
${GHR_Admin_TaskForm_Task_Options} =               xpath=//span[@title='More options']
${GHR_Admin_TaskForm_Task_Delete_Options} =        xpath=//a[@class='dropdown-item'][text()='Delete']
${GHR_Admin_TaskForm_Task_Duplicate_Options} =     xpath=//a[@class='dropdown-item'][text()='duplicate']
${GHR_Admin_TaskForm_Popup_Yes_Button} =           xpath=//button[@class='btn btn-primary save-btn']
${GHR_Admin_TaskForm_Popup_No_Button} =            xpath=//button[@class='btn btn-primary'][@type='reset']
${GHR_Admin_TaskForm_Actions_Popup} =              xpath=(//div[@class='modal-content'])[2]



*** Keywords ***

Verify selected Task is Previewed
    [Arguments]  ${Task_Name}
    ${Replaced_String} =  Replace String    ${GHR_Admin_TaskForm_Header_Title}          abc                 ${Task_Name}
    wait until element is visible           ${Replaced_String}                        10s
    element should be visible               ${Replaced_String}

Click on Add Assignee Icon
    click element                           ${GHR_Admin_TaskForm_Add_Assignee_Icon}

Search and select Assignee
    [Arguments]  ${Assignee_Number}
    wait until element is visible           ${GHR_Admin_TaskForm_Assignee_Search_Field}
    click element                           ${GHR_Admin_TaskForm_Assignee_Search_Field}
    input text                              ${GHR_Admin_TaskForm_Assignee_Search_Field}                        ${Assignee_Number}
    SLEEP  1s
    ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_Assignee_List}            abc                 ${Assignee_Number}
    wait until element is visible           ${Replaced_String}
    click element                           ${Replaced_String}

Click on Remove Assignee Link
    click element                           ${GHR_Admin_TaskForm_Remove_Assignee_link}

Enter Task Name
    [Arguments]  ${TaskName}
    input text                              ${GHR_Admin_TaskForm_Task_Name_TextBox}                            ${TaskName}

Clear Task Name
    clear element text                      ${GHR_Admin_TaskForm_task_name_textbox}

Click on Add Checklist link
    click element                           ${GHR_Admin_TaskForm_Add_Checklist_Link}

Search and select for a checklist
    [Arguments]  ${Checklist_Name}
    click element                           ${GHR_Admin_TaskForm_Checklist_Search_Field}
    input text                              ${GHR_Admin_TaskForm_Checklist_Search_Field}                       ${Checklist_Name}
    ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_Checklist_Search_Result}  abc                 ${Checklist_Name}
    wait until element is visible           ${Replaced_String}                      10s
    sleep  1s
    click element                           ${Replaced_String}

#    @{Checklist_Name}   Create List             ${Checklist_Name}
#    :For  ${i}   IN                             @{Checklist_Name}
#    \   click element   //div[@class='checklist-label ng-star-inserted']
#    \   input text                              ${GHR_Admin_TaskForm_Checklist_Search_Field}               ${i}
#    \   ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_Checklist_Search_Result}      abc     ${i}
#    \   wait until element is visible           ${Replaced_String}                          5s
#    \   click element                           ${Replaced_String}

Click on cross icon of the checklist instance
    click element                           ${GHR_Admin_TaskForm_Checklist_Remove_Icon}

Click on Due Date input field
    click element                           ${GHR_Admin_TaskForm_DueDate_InputField}

Set Month
    [Arguments]  ${Given_Month}
    :For   ${i}  IN RANGE   0   12
    \   ${Present_Month} =  get text        ${GHR_Admin_TaskForm_Month_Lable}
    \   Exit For Loop If	                '${Present_Month}'=='${Given_Month}'
    \   click element                       ${GHR_Admin_TaskForm_Next_Month_Button}

Set Year
    [Arguments]  ${Given_Year}
    ${Present_Year} =   get text            ${GHR_Admin_TaskForm_year_lable}
    ${Result} =         Evaluate            ${Present_Year}- ${Given_Year}
    run keyword if                          ${Result}>0                             Past Year           ${Result}
    run keyword if                          ${Result}<0                             Future Year         ${Result}
Past Year
    [Arguments]  ${Result}
    :For   ${i}  IN RANGE   0               ${Result}
    \   click element                       ${GHR_Admin_TaskForm_Previous_Year_Button}
Future Year
    [Arguments]  ${Result}
    :For   ${i}  IN RANGE                   ${Result}                               -1
    \   click element                       ${GHR_Admin_TaskForm_Next_Year_Button}

Set Day
    [Arguments]  ${Day}
    ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_Date_Lable}               1                   ${Day}
    click element                           ${Replaced_String}

Set Due Date
    [Arguments]  ${Date}    ${Month}    ${Year}
    run keyword  Set Month                  ${Month}
    run keyword  Set Year                   ${Year}
    run keyword  Set Day                    ${Date}

Enter Description
    [Arguments]  ${Description}
    input text                              ${GHR_Admin_TaskForm_Description_TextArea}                         ${Description}

Click on Description More link
    click element                           ${GHR_Admin_TaskForm_description_textarea_more}

Clear Description
    ${DescriptionMoreLinkVisible} =  Run Keyword And Return Status  page should contain element         ${GHR_Admin_TaskForm_description_textarea_more}
    run keyword if                          ${DescriptionMoreLinkVisible}                               Click on Description More link
    click element                           ${GHR_Admin_TaskForm_description_textarea1}
    clear element text                      ${GHR_Admin_TaskForm_description_textarea}

Set Priority Low
    click element                           ${GHR_Admin_TaskForm_priority_low_checkbox}

Set Priority Medium
    click element                           ${GHR_Admin_TaskForm_priority_medium_checkbox}

Set Priority High
    click element                           ${GHR_Admin_TaskForm_priority_high_checkbox}

Click on Comments tab
    click element                           ${GHR_Admin_TaskForm_comments_tab}

Enter comment data
    [Arguments]  ${Comment}
    wait until element is enabled           ${GHR_Admin_TaskForm_comment_textarea}
    click element                           ${GHR_Admin_TaskForm_comment_textarea}
    input text                              ${GHR_Admin_TaskForm_comment_textarea}                             ${Comment}

Click on Comment Post button
    wait until element is enabled           ${GHR_Admin_TaskForm_comment_post_button}
    click button                            ${GHR_Admin_TaskForm_comment_post_button}

Click on Comment Cancel button
    click button                            ${GHR_Admin_TaskForm_comment_cancel_button}

Click on Comment Edit icon of selected comment
    [Arguments]  ${Comment}
    ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_comment_edit_icon}        abc                 ${Comment}
    click element                           ${Replaced_String}

Clear Comment Data
    clear element text                      ${GHR_Admin_TaskForm_comment_textarea}

Click on Comment Delete icon of selected comment
    [Arguments]  ${Comment}
    ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_comment_delete_icon}      abc                 ${Comment}
    wait until element is visible           ${Replaced_String}
    click element                           ${Replaced_String}

Click on Tags tab
    click element                           ${GHR_Admin_TaskForm_Tags_Tab}

Click on Add Tags Button
    click element                           ${GHR_Admin_TaskForm_add_tags_button}

Enter New Tag Name
    [Arguments]  ${Tag_Name}
    click element                           ${GHR_Admin_TaskForm_add_tags_search_field}
    input text                              ${GHR_Admin_TaskForm_add_tags_search_field}                        ${Tag_Name}

Click Enter to create the tag
    press key                               ${GHR_Admin_TaskForm_add_tags_search_field}    \\13

Verify Tag is created
    [Arguments]  ${Tag_Name}
    ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_tag_label}                abc                 ${Tag_Name}
    wait until element is visible           ${Replaced_String}
    element should be visible               ${Replaced_String}

Enter New Tag and Verify tag is created
    [Arguments]  ${Tag_Name}
    click element                           ${GHR_Admin_TaskForm_add_tags_search_field}
    input text                              ${GHR_Admin_TaskForm_add_tags_search_field}                        ${Tag_Name}
    press key                               ${GHR_Admin_TaskForm_add_tags_search_field}    \\13
    ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_tag_label}                abc                 ${Tag_Name}
    wait until element is visible           ${Replaced_String}
    element should be visible               ${Replaced_String}


#Code for entering multiple tags
#    @{Tag_Name}  create list  a   b
#    :For  ${i}  IN    @{Tag_Name}
#    \   click element                           ${GHR_Admin_TaskForm_add_tags_search_field}
#    \   input text                              ${GHR_Admin_TaskForm_add_tags_search_field}                     ${Tag_Name}
#    \   press key                               ${GHR_Admin_TaskForm_add_tags_search_field}    \\13
#    \   ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_tag_label}                abc              ${i}
#    \   wait until element is visible           ${Replaced_String}
#    \   element should be visible               ${Replaced_String}

Search and Select the tag from the search results
    [Arguments]  ${Tag_Name}
    input text                              ${GHR_Admin_TaskForm_Add_Tags_Search_Field}                        ${Tag_Name}
    ${Replace_String} =  replace string     ${GHR_Admin_TaskForm_Tag_in_dropdown}          abc                 ${Tag_Name}
    SLEEP  1s
    wait until element is visible           ${Replace_String}
    click element                           ${Replace_String}

Verify given Tag is not present
     [Arguments]  ${Tag_Name}
    ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_tag_label}                abc                 ${Tag_Name}
    element should not be visible               ${Replaced_String}

Click on cross icon of selected tag
    [Arguments]  ${Tag_Name}
    ${Replaced_String} =    replace string  ${GHR_Admin_TaskForm_Delete_Tag_Icon}          abc                 ${Tag_Name}
    click element                           ${Replaced_String}

Click on Followers Tab
    click element                           ${GHR_Admin_TaskForm_followers_tab}
    Press Key                               ${GHR_Admin_TaskForm_Save_Task_Button}         \\40

Click on Add Followers Button
    click element                           ${GHR_Admin_TaskForm_Add_Followers_Button}

Search and select the follower
    [Arguments]  ${Employee_Number}
    click element                           ${GHR_Admin_TaskForm_Follower_Search_Field}
    input text                              ${GHR_Admin_TaskForm_Follower_Search_Field}                        ${Employee_Number}
    ${Replaced_String} =  replace string    ${GHR_Admin_TaskForm_Follower_Search_Result}   abc                 ${Employee_Number}
    wait until element is visible           ${Replaced_String}                      15s
    click element                           ${Replaced_String}

Mouse Over Follower
    [Arguments]  ${Follower_Initial}
    ${Replaced_String} =    replace string  ${GHR_Admin_TaskForm_Follower_Initial}         abc                 ${Follower_Initial}
    mouse over                              ${Replaced_String}
    mouse over                              ${GHR_Admin_TaskForm_Remove_Follower_Icon}

Verify Follower is present
    [Arguments]  ${Employee_Number}
    ${Replaced_String} =    replace string  ${GHR_Admin_TaskForm_Follower_Tool_Tip}         abc                ${Employee_Number}
    page should contain element             ${Replaced_String}


Click on remove button of the follower
    wait until element is visible           ${GHR_Admin_TaskForm_Remove_Follower_Icon}
    click element                           ${GHR_Admin_TaskForm_Remove_Follower_Icon}

Click on Save button to save the task
    click button                            ${GHR_Admin_TaskForm_Save_Task_Button}

Click on close task form icon
    click element                           ${GHR_Admin_TaskForm_Close_Icon}

Click on task options icon
    click element                           ${GHR_Admin_TaskForm_Task_Options}

Select Task Delete optiion
    click element                           ${GHR_Admin_TaskForm_Task_Delete_Options}

Select Task Duplicate option
    click element                           ${GHR_Admin_TaskForm_Task_Duplicate_Options}

Confirm action
    wait until element is visible           ${GHR_Admin_TaskForm_Actions_Popup}
    wait until element is enabled           ${GHR_Admin_TaskForm_Popup_Yes_Button}         10s
    click button                            ${GHR_Admin_TaskForm_Popup_Yes_Button}

Reject Action
    wait until element is visible           ${GHR_Admin_TaskForm_Actions_Popup}
    wait until element is enabled           ${GHR_Admin_TaskForm_Popup_No_Button}           10s
    click button                            ${GHR_Admin_TaskForm_Popup_No_Button}
