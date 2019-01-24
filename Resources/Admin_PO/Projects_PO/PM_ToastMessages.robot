*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${PM_ToastMessage_Duplicate_Project_Name_Message} =     xpath=//div[@class='alert alert-danger']/p[contains(text(),'again with new project name')]
${PM_ToastMessage_Duplicate_Project_Code_Message} =     xpath=//div[@class='alert alert-danger']/p[contains(text(),'again with new project code')]
${PM_ToastMessage_Project_Delete_Success_Message} =     xpath=//div[@class='alert alert-success']/p[contains(text(),'deleted successfully')]
${PM_ToastMessage_Project_Delete_Failure_Message} =     xpath=//div[@class='alert alert-danger']/p[contains(text(),'Unable to delete')]
${PM_ToastMessage_Update_Project_Success_Message} =     xpath=//div[@class='alert alert-success']/p[contains(text(),'updated successfully')]


*** Keywords ***


Duplicate Project Name Alert Message
    wait until page contains element  ${PM_ToastMessage_Duplicate_Project_Name_Message}    10s
#    SLEEP    1S
    element should be visible  ${PM_ToastMessage_Duplicate_Project_Name_Message}

Duplicate Project Code Alert Message
    wait until page contains element  ${PM_ToastMessage_Duplicate_Project_Code_Message}    10s
#    SLEEP  1S
    element should be visible  ${PM_ToastMessage_Duplicate_Project_Code_Message}

Verify Project Delete Success Message is displayed
    wait until element is visible   ${PM_ToastMessage_Project_Delete_Success_Message}  10s
    element should be visible       ${PM_ToastMessage_Project_Delete_Success_Message}

Verify Project Delete Failure Message is displayed
    wait until element is visible   ${PM_ToastMessage_Project_Delete_Failure_Message}  10s
    element should be visible       ${PM_ToastMessage_Project_Delete_Failure_Message}

Verify Project Updated Success message is displayed
    wait until element is visible   ${PM_ToastMessage_Update_Project_Success_Message}       10s
    element should be visible       ${PM_ToastMessage_Update_Project_Success_Message}


