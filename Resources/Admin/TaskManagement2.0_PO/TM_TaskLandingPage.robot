*** Settings ***
Library  Selenium2Library
Library  String
*** Variables ***

${TM_LandingPage_Open_Tasks_Tab} =              xpath=//div[@class='btn-group']/button[contains(text(),'open')]
${TM_LandingPage_Completed_Tasks_Tab} =         xpath=//div[@class='btn-group']/button[contains(text(),'completed')]
${TM_LandingPage_Add_A_New_Task_Button} =       xpath=(//div[@class='add-btn']/label/i)[1]
${TM_LandingPage_Loader} =                      xpath=//tm-loader/div[@class='modal fade in']/div/div
${TM_LandingPage_Task_Title} =                  xpath=(//span[@title='abc']/../..)[1]
${TM_LandingPage_Task_Complete_Checkbox} =      xpath=(//span[@title="abc"]/../../../preceding-sibling::div/ng-component/span/i)[1]
${TM_LandingPage_Task_Reopen_Checkbox} =        xpath=(//span[@title='abc']/../..)[1]/div/span[@title='Reopen the task']
${TM_LandingPage_Go_To_Chesklist_Link} =        xpath=//div[@class='checklist-route row']/a
${TM_LandingPage_Task_Search_Field} =           xpath=//input[@placeholder='Search Task']
${TM_LandingPage_Task_Filter_Icon} =            xpath=//div[@class='checklist-route row']/a


*** Keywords ***
wait until Loader is disappeared
    wait until element is visible   ${TM_LandingPage_Loader}    5s
    ${abc}=  run keyword and return status  page should contain element  ${TM_LandingPage_Loader}   20s
    run keyword if  ${abc}  wait until Loader is disappeared1


wait until Loader is disappeared1
    wait until element is not visible  ${TM_LandingPage_Loader}     20s
    sleep   1s

Wait Untill My Task Board page is loaded
     Wait Until Page Contains Element  ${TM_LandingPage_Open_Tasks_Tab}     10s

Click on Open Tasks Tab
    click element  ${tm_landingpage_open_tasks_tab}

Click on Completed Tasks Tab
    wait until element is visible  ${tm_landingpage_completed_tasks_tab}    10s
    click element  ${tm_landingpage_completed_tasks_tab}




Verify Tasks page is loaded
    Element Should Be Visible  ${TM_LandingPage_Open_Tasks_Tab}

Click on Create Task button
    wait until element is visible  ${TM_LandingPage_Add_A_New_Task_Button}      10s
    click element  ${TM_LandingPage_Add_A_New_Task_Button}

Click on Task to view
    [Arguments]  ${Task_Name}
    ${replaced_text} =  Replace String  ${TM_LandingPage_Task_Title}   abc   ${Task_Name}
    wait until element is visible  ${replaced_text}     10s
    click element  ${replaced_text}

Click on Task Complete Checkbox
     [Arguments]  ${Task_Name}
    ${replaced_text} =  Replace String  ${TM_LandingPage_Task_Complete_Checkbox}   abc   ${Task_Name}
    wait until element is visible  ${replaced_text}     10s
    click element  ${replaced_text}

Click on Task Reopen Checkbox
     [Arguments]  ${Task_Name}
    ${replaced_text} =  Replace String  ${tm_landingpage_task_reopen_checkbox}   abc   ${Task_Name}
    wait until element is visible  ${replaced_text}     10s
    click element  ${replaced_text}

Click on Go To Checklists link
    click element  ${tm_landingpage_go_to_chesklist_link}

Search for a task
    [Arguments]  ${Task_Name}
    input text  ${tm_landingpage_task_search_field}      ${Task_Name}

Click on Task Filter icon
    click element  ${tm_landingpage_task_filter_icon}