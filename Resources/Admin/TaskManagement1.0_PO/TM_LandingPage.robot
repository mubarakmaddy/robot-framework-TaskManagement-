*** Settings ***
Library  Selenium2Library
Library  Selenium2Library
*** Variables ***

${TM_All_Tasks_SubMenu} =   xpath=//span[@class='secondary-menu'][text()='All Tasks']
${TM_My_Task_BoardTitle} =  xpath=//span[@title='My Task Board']
${CT_Create_Task_Button} =  xpath=//button[@title='Create a Task']

*** Keywords ***


Wait Untill My Task Board page is loaded
     Wait Until Page Contains Element  ${TM_MyTAskBoardTitle}

Wait Untill Create Task button is loaded
     Wait Until Page Contains Element  ${CT_Create_Task_Button}

Verify Tasks page is loaded
    Element Should Be Visible  ${TM_MyTAskBoardTitle}

Click on Create Task button
    click button  ${CT_Create_Task_Button}