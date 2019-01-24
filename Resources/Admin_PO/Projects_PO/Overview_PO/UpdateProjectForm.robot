*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${Update_Project_Form_Project_Name} =   xpath=(//input[@placeholder='Project name'])[1]
${Update_Project_Form_Project_Code} =   xpath=(//input[@id='code'])[1]
${Update_Project_Form_Priority} =       xpath=(//select[@id='priority'])[1]
${Update_Project_Form_Description} =    xpath=(//textarea[@id='description'])[1]
${Update_Project_Form_Start_Date} =     xpath=(//gt-date-picker[@id='startDate'])[1]/div/div/div
${Update_Project_Form_End_Date} =       xpath=(//gt-date-picker[@id='endDate'])[1]/div/div/div
${Update_Project_Form_Client} =         xpath=(//select[@id='client'])[1]
${Update_Project_Form_Billable_Type} =  xpath=(//select[@id='billableType'])[1]
${Update_Project_Form_Wage_Rate} =      xpath=(//input[@id='wageRate'])[1]
${Update_Project_Form_Wage_Type} =      xpath=(//select[@id='wageType'])[1]
${Update_Project_Form_OT_Rate} =        xpath=(//input[@id='otRate'])[1]
${Update_Project_Form_OT_Type} =        xpath=(//select[@id='overtimeType'])[1]
${Update_Project_Form_Status} =         xpath=(//select[@id='status'])[1]
${Update_Project_Form_Update_Button} =  xpath=(//button[@class='btn create-button save-project'])[1]


*** Keywords ***

Update Project Name
    [Arguments]  ${Project_Name}
#    wait until element is visible  ${update_project_form_project_name} 2s
    sleep  2s
    clear element text              ${update_project_form_project_name}
    input text                      ${update_project_form_project_name}     ${Project_Name}

Update Project Code
    [Arguments]  ${Project_Code}
    clear element text              ${update_project_form_project_code}
    input text                      ${update_project_form_project_code}     ${Project_Code}

Update Project Priority
    [Arguments]  ${Project_Priority}
    # 1 = Low
    # 2 = Medium
    # 3 = High
    select from list by index       ${update_project_form_priority}         ${Project_Priority}

Update Project Description
    [Arguments]  ${Project_Description}
    clear element text              ${update_project_form_description}
    input text                      ${update_project_form_description}      ${Project_Description}

Update Project Start Date
    [Arguments]   ${Project_Start_Date}
    input text                      ${update_project_form_start_date}

Update Project End Date
    [Arguments]  ${Project_End_Date}
    input text                      ${update_project_form_end_date}

Update Project Client
    [Arguments]  ${Project_Client_Name}
    select from list by label       ${update_project_form_client}           ${Project_Client_Name}

Update Project Billable Type
    [Arguments]  ${Project_Billable_Type}
    # Time and Material
    # Non Billable
    select from list by label       ${update_project_form_billable_type}    ${Project_Billable_Type}

Update Project Wage Rate
    [Arguments]  ${Wage_Rate}
    input text                      ${update_project_form_wage_rate}        ${Wage_Rate}

Update Project Wage Type
    [Arguments]  ${Wage_Type}
    # Per Day
    # Per Hour
    select from list by label       ${update_project_form_wage_type}        ${Wage_Type}

Update Project OT Rate
    [Arguments]  ${OT_Rate}
    input text                      ${update_project_form_ot_rate}          ${OT_Rate}

Update Project OT Type
    [Arguments]  ${OT_Type}
    # Per Day
    # Per Hour
    select from list by label       ${update_project_form_ot_type}          ${OT_Type}

Update Project Status
    [Arguments]  ${Status}
    # In Progress
    # Completed
    # Closed
    select from list by label       ${update_project_form_status}           ${Status}

Click on Update Project Button
    click button                    ${update_project_form_update_button}


