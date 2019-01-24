*** Settings ***
Library  SeleniumLibrary         #timeout=5.0, implicit_wait=5.0, run_on_failure=Capture Page Screenshot, screenshot_root_directory=None
*** Variables ***
${TM_ToastMessages_Task_Created} =              xpath=//div[@class='alert alert-success']/p[contains(text(),'You successfully created a task')]
${TM_ToastMessages_Task_Updated} =              xpath=//div[@class='alert alert-success']/p[contains(text(),'All changes are saved to your task')]
${TM_ToastMessages_Task_Completed} =            xpath=//div[@class='alert alert-success']/p[contains(text(),'Hurray! You completed a task')]
${TM_ToastMessages_Task_Reopened} =             xpath=//div[@class='alert alert-success']/p[contains(text(),'You have re-opened your task')]
${TM_ToastMessages_Task_Comment_Posted} =       xpath=//div[@class='alert alert-success']/p[contains(text(),'Comment posted')]
${TM_ToastMessages_Task_Comment_Updated} =      xpath=//div[@class='alert alert-success']/p[contains(text(),'Comment updated')]
${TM_ToastMessages_Task_Comment_Deleted} =      xpath=//div[@class='alert alert-success']/p[contains(text(),'Comment deleted')]
${TM_ToastMessages_Task_Deleted} =              xpath=//div[@class='alert alert-success']/p[contains(text(),'You have deleted your task')]
${TM_ToastMessages_Task_Duplicated} =           xpath=//div[@class='alert alert-success']/p[contains(text(),'You have created a copy of your task')]
${TM_ToastMessages_Checklist_Created} =         xpath=//div[@class='alert alert-success']/p[contains(text(),'You successfully created a checklist')]
${TM_ToastMessages_Checklist_Updated} =         xpath=//div[@class='alert alert-success']/p[contains(text(),'Checklist updated')]
${TM_ToastMessages_Checklist_Deleted} =         xpath=//div[@class='alert alert-success']/p[contains(text(),'Checklist deleted')]
${TM_ToastMessages_Checklist_Archived} =        xpath=//div[@class='alert alert-success']/p[contains(text(),'Checklist archived')]
${TM_ToastMessages_Checklist_Restored} =        xpath=//div[@class='alert alert-success']/p[contains(text(),'Checklist restored')]
${TM_ToastMessages_Task_Template_Created} =     xpath=//div[@class='alert alert-success']/p[contains(text(),'You successfully created a task template')]
${TM_ToastMessages_Task_Template_Updated} =     xpath=//div[@class='alert alert-success']/p[contains(text(),'Task template updated')]
${TM_ToastMessages_Task_Template_Duplicated} =  xpath=//div[@class='alert alert-success']/p[contains(text(),'Task template duplicated')]
${TM_ToastMessages_Task_Template_Deleted} =     xpath=//div[@class='alert alert-success']/p[contains(text(),'Task template  deleted')]

${TM_ToastMessages_Popup_Confirm_Action} =      xpath=//div[@class='row popup-btn ng-star-inserted']/div/div/button[@type='submit']
${TM_ToastMessages_Popup_Cancel_Action} =       xpath=//div[@class='row popup-btn ng-star-inserted']/div/div/button[@type='reset']


*** Keywords ***

Verify Task Created Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Created}              10s
    element should be visible       ${TM_ToastMessages_Task_Created}
    wait until element is not visible  ${TM_ToastMessages_Task_Created}

Verify Task Updated Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Updated}              10s
    element should be visible       ${TM_ToastMessages_Task_Updated}
    wait until element is not visible  ${TM_ToastMessages_Task_Updated}

Verify Task Completed Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Completed}            10s
    element should be visible       ${TM_ToastMessages_Task_Completed}
    wait until element is not visible  ${TM_ToastMessages_Task_Completed}

Verify Task Reopened Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Reopened}            10s
    element should be visible       ${TM_ToastMessages_Task_Reopened}
    wait until element is not visible  ${TM_ToastMessages_Task_Reopened}

Verify Task Comment Posted Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Comment_Posted}       10s
    element should be visible       ${TM_ToastMessages_Task_Comment_Posted}
    wait until element is not visible  ${TM_ToastMessages_Task_Comment_Posted}

Verify Task Comment Updated Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Comment_Updated}      10s
    element should be visible       ${TM_ToastMessages_Task_Comment_Updated}
    wait until element is not visible  ${TM_ToastMessages_Task_Comment_Updated}

Verify Task Comment Deleted Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Comment_Deleted}      10s
    element should be visible       ${TM_ToastMessages_Task_Comment_Deleted}
    wait until element is not visible  ${TM_ToastMessages_Task_Comment_Deleted}

Verify Task deleted Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Deleted}              10s
    element should be visible       ${TM_ToastMessages_Task_Deleted}
    wait until element is not visible  ${TM_ToastMessages_Task_Deleted}

Verify Task duplicated Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Duplicated}           10s
    element should be visible       ${TM_ToastMessages_Task_Duplicated}

Verify Checklist Created Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Checklist_Created}         10s
    element should be visible       ${TM_ToastMessages_Checklist_Created}

Verify Checklist Updated Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Checklist_Updated}         10s
    element should be visible       ${TM_ToastMessages_Checklist_Updated}

Verify Checklist Deleted Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Checklist_Deleted}         10s
    element should be visible       ${TM_ToastMessages_Checklist_Deleted}

Verify Checklist Archived Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Checklist_Archived}        10s
    element should be visible       ${TM_ToastMessages_Checklist_Archived}

Verify Checklist Restored Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Checklist_Restored}        10s
    element should be visible       ${TM_ToastMessages_Checklist_Restored}

Verify Task Template Created Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Template_Created}     10s
    element should be visible       ${TM_ToastMessages_Task_Template_Created}

Verify Task Template Updated Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Template_Updated}     10s
    element should be visible       ${TM_ToastMessages_Task_Template_Updated}

Verify Task Template Duplicated Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Template_Duplicated}  10s
    element should be visible       ${TM_ToastMessages_Task_Template_Duplicated}

Verify Task Template Deleted Success Message is displayed
    wait until element is visible   ${TM_ToastMessages_Task_Template_Deleted}     10s
    element should be visible       ${TM_ToastMessages_Task_Template_Deleted}

Confirm Popup action
    wait until element is visible   ${TM_ToastMessages_Popup_Confirm_Action}      10s
    click element       ${TM_ToastMessages_Popup_Confirm_Action}

Cancel Popup action
    wait until element is visible   ${TM_ToastMessages_Popup_Cancel_Action}      10s
    click element       ${TM_ToastMessages_Popup_Cancel_Action}


