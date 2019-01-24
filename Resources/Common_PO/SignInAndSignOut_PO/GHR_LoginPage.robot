*** Settings ***
Library  SeleniumLibrary         #timeout=5.0, implicit_wait=5.0, run_on_failure=Capture Page Screenshot, screenshot_root_directory=None

*** Variables ***
${LoginPage_UserName_TextField} =    name=j_username
${LoginPage_Password_TextField} =    name=j_password
${LoginPage_Login_Button} =          id=login-button

*** Keywords ***
Load GreytHR
    [Arguments]  ${URL}
    go to  ${URL}

Enter User Name
    [Arguments]  ${User_Name}
    wait until element is visible   ${LoginPage_UserName_TextField}  5s
    input text                      ${LoginPage_UserName_TextField}  ${User_Name}

Enter Password
    [Arguments]  ${Password}
    input password                  ${LoginPage_Password_TextField}  ${Password}

Click on Login button
    click button                    ${LoginPage_Login_Button}

Login to GreytHR
    [Arguments]  ${Login_credentials}
    wait until element is visible   ${LoginPage_UserName_TextField}  5s
    input text                      ${LoginPage_UserName_TextField}  ${Login_credentials.UserName}
    input password                  ${LoginPage_Password_TextField}  ${Login_credentials.Password}
    click button                    ${LoginPage_Login_Button}


