*** Settings ***
Library  SeleniumLibrary         #timeout=5.0, implicit_wait=5.0, run_on_failure=Capture Page Screenshot, screenshot_root_directory=None
Library  String
*** Variables ***

${TM_LandingPage_Tasks_Page_Title} =            xpath=//tm-header/header/label[text()='tasks']
${TM_LandingPage_Create_Task_Button} =          xpath=//div[@class='create-task-btn']/button
${TM_LandingPage_Open_Tasks_Tab} =              xpath=//button[contains(text(),'open')]
${TM_LandingPage_Completed_Tasks_Tab} =         xpath=//button[contains(text(),'completed')]
${TM_LandingPage_Task_Title} =                  xpath=(//div[@title='abc'])[1]
${TM_LandingPage_Task_Complete_Checkbox} =      xpath=(//div[@title='abc'])[1]/preceding-sibling::div//i
${TM_LandingPage_Task_Reopen_Checkbox} =        xpath=(//div[@title='abc'])[1]/preceding-sibling::div//i
${TM_LandingPage_Go_To_Chesklist_Link} =        xpath=//div[@class='checklist-route row']/a
${TM_LandingPage_Task_Search_Field} =           xpath=//input[@placeholder='Search Task(s)']
${TM_LandingPage_Task_Filter_Icon} =            xpath=//div[@class='checklist-route row']/a


*** Keywords ***

Wait Untill Tasks page is loaded
     Wait Until Page Contains Element                                               ${TM_LandingPage_Tasks_Page_Title}          10s

Verify Tasks page is loaded
    Element Should Be Visible                                                       ${TM_LandingPage_Tasks_Page_Title}

Click on Open Tasks Tab
    click element                                                                   ${tm_landingpage_open_tasks_tab}

Click on Completed Tasks Tab
    wait until element is visible                                                   ${tm_landingpage_completed_tasks_tab}       10s
    click element                                                                   ${tm_landingpage_completed_tasks_tab}


Click on Create Task button
    wait until element is visible                                                   ${TM_LandingPage_Create_Task_Button}        10s
    click element                                                                   ${TM_LandingPage_Create_Task_Button}

Click on Task to view
    [Arguments]  ${Task_Name}
    ${replaced_text} =  Replace String                                              ${TM_LandingPage_Task_Title}                abc     ${Task_Name}
    wait until loader is disappeared
    wait until element is visible                                                   ${replaced_text}                            10s
    wait until element is enabled                                                   ${replaced_text}                            10s
    click element                                                                   ${replaced_text}

Click on Task Complete Checkbox
     [Arguments]  ${Task_Name}
    ${replaced_text} =  Replace String                                              ${TM_LandingPage_Task_Complete_Checkbox}    abc     ${Task_Name}
    wait until element is visible                                                   ${replaced_text}                            10s
    click element                                                                   ${replaced_text}

Click on Task Reopen Checkbox
     [Arguments]  ${Task_Name}
    ${replaced_text} =  Replace String                                              ${tm_landingpage_task_reopen_checkbox}      abc     ${Task_Name}
    wait until element is visible                                                   ${replaced_text}                            10s
    click element                                                                   ${replaced_text}

Click on Go To Checklists link
    click element                                                                   ${tm_landingpage_go_to_chesklist_link}

Search for a task
    [Arguments]  ${Task_Name}
    input text                                                                      ${tm_landingpage_task_search_field}                 ${Task_Name}

Click on Task Filter icon
    click element                                                                   ${tm_landingpage_task_filter_icon}
