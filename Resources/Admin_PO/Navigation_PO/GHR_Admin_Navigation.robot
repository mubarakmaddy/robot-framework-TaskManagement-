*** Settings ***
Library   SeleniumLibrary

*** Variables ***

${GreytHRNavigation_Task&Checkslit_Menu1} =                    xpath=(//i[@class="icon-tasks"])[1]
${GreytHRNavigation_ProjectManagement_Menu1} =                 xpath=(//i[@class="icon-gt-project-management2"])[1]
${GreytHRNavigation_ProjectManagement_Menu2} =                 xpath=(//i[@class="icon-gt-project-management2"])[2]
${GreytHRNavigation_ProjectOverview_Submenu1} =                xpath=(//i[@class="icon-gt-project-management2"])[1]/../../following-sibling::ul/li/a/span[contains(text(),'Overview')]
${GreytHRNavigation_ProjectWorkdays_Submenu1} =                xpath=(//i[@class="icon-gt-project-management2"])[1]/../../following-sibling::ul/li/a/span[contains(text(),'Workdays')
${GreytHRNavigation_ProjectOverview_Submenu2} =                xpath=(//i[@class="icon-gt-project-management2"])[2]/../../following-sibling::ul/li/a/span[contains(text(),'Overview')]
${GreytHRNavigation_ProjectWorkdays_Submenu2} =                xpath=(//i[@class="icon-gt-project-management2"])[2]/../../following-sibling::ul/li/a/span[contains(text(),'Workdays')]
${GreytHRNavigation_Settings_Header_Icon} =                    xpath=//i[@class='icon-gears custom-icon']
${GreytHRNavigation_System_Settings_SuperMenu_Icon} =          xpath=(//i[@class='icon-gears'])[1]
${GreytHRNavigation_System_Settings_SuperMenu} =               xpath=//span[text()='System Settings']
${GreytHRNavigation_Checklist_Menu} =                          xpath=//span[text()='Checklist']
${GreytHRNavigation_Checklist_Dashboard_subMenu} =             xpath=//span[text()='Checklist Dashboard']


*** Keywords ***

Click on Tasks menu
    click element                  ${GreytHRNavigation_Task&Checkslit_Menu1}

Click on unexpanded ProjectManagement menu
    click element                  ${GreytHRNavigation_ProjectManagement_Menu1}

Click on expanded ProjectManagement menu
    click element                  ${GreytHRNavigation_ProjectManagement_Menu2}

Click on Project Overview page in GreytHR
    click element                  ${GreytHRNavigation_ProjectOverview_Submenu2}

Click on Project Overview page in Project
    click element                  ${GreytHRNavigation_ProjectOverview_Submenu1}

Click on Project Workdays page in GreytHR
    click element                  ${GreytHRNavigation_ProjectWorkdays_Submenu2}

Click on Project Workdays page in Project
    click element                  ${GreytHRNavigation_ProjectWorkdays_Submenu1}

Click on Settings Header Icon
    click element                  ${GreytHRNavigation_settings_header_icon}

Click on System Settings Menu Icon
    wait until element is visible  ${GreytHRNavigation_system_settings_supermenu_icon}     10s
    click element                  ${GreytHRNavigation_system_settings_supermenu_icon}

Click on System Settings Menu
    click element                  ${GreytHRNavigation_system_settings_supermenu}

Click on Checklist Menu 
    click element                  ${GreytHRNavigation_checklist_menu}
    
Click on Checklist Dashboard Sub Menu
    click element                  ${GreytHRNavigation_checklist_dashboard_submenu}





