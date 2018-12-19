*** Settings ***
Library  Selenium2Library
*** Variables ***
${LoginPage_UserName_TextField} =    name=j_username
${LoginPage_Password_TextField} =    name=j_password
${LoginPage_Login_Button} =          id=login-button

*** Keywords ***
Load GreytHR
    go to  ${URL.${Enironment}}

Enter User Name
    [Arguments]  ${Login_credentials}
    wait until element is visible   ${LoginPage_UserName_TextField}  5s
    input text                      ${LoginPage_UserName_TextField}  ${Login_credentials.UserName}

Enter Password
    [Arguments]  ${Login_credentials}
    input password                  ${LoginPage_Password_TextField}  ${Login_credentials.Password}

Click on Login button
    click button                    ${LoginPage_Login_Button}

Login to GreytHR
    [Arguments]  ${Login_credentials}
    wait until element is visible   ${LoginPage_UserName_TextField}  5s
    input text                      ${LoginPage_UserName_TextField}  ${Login_credentials.UserName}
    input password                  ${LoginPage_Password_TextField}  ${Login_credentials.Password}
    click button                    ${LoginPage_Login_Button}


