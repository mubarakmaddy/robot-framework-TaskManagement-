*** Settings ***
Library  SeleniumLibrary         #timeout=5.0, implicit_wait=5.0, run_on_failure=Capture Page Screenshot, screenshot_root_directory=None
Library  OperatingSystem

*** Variables ***
${Excel_Import_Upload_File_Button} =                xpath=//input[@name='file']
${Excel_Import_Header_Label} =                      xpath=//h3[@class='ng-scope ng-binding'][text()='Excel Importer']
${Excel_Import_Step1_Header} =                      xpath=//h4[@class='ng-binding'][contains(text(),'Step 1: Excel Importer')]
${Excel_Import_Step2_Header} =                      xpath=//h4[@class='ng-binding'][contains(text(),'Step 2: Excel Importer Mapping')]
${Excel_Import_Step3_Header} =                      xpath=//h4[@class='ng-binding'][contains(text(),'Step 3: Excel Importer Validate')]
${Excel_Import_Download_Sample_Excel_File_Link} =   xpath=//a[@ng-click='downloadSampleExcel()']
${Excel_Import_Imported_Excel} =                    xpath=//span[@class='ng-binding']
${Excel_Import_Previous_Button} =                   xpath=//button[contains(text(),'Previous')]
${Excel_Import_Next_Button} =                       xpath=//button[contains(text(),'Next')]
${Excel_Import_Cancel_Button} =                     xpath=(//button[contains(text(),'Cancel')])[1]
${Excel_Import_Finish_Button} =                     xpath=//button[contains(text(),'Finish')]
${Excel_Import_OK_Button} =                         xpath=//button[@ng-click="showNavPanel()"][text()='OK']
${Excel_Import_Loader} =                            xpath=//div[@class='overlay']
${Excel_Import_Step2_Table} =                       xpath=//table [@class='table table-bordered table-striped']


*** Keywords ***

Verify Excel import page is loaded
    wait until element is not visible   ${excel_import_loader}
    wait until element is visible       ${Excel_Import_Header_Label}            10s
    element should be visible           ${Excel_Import_Header_Label}

Upload workdays data
    [Arguments]  ${Excel_File_Path}
    Choose file                         ${excel_import_upload_file_button}      ${Excel_File_Path}

Verify Sample File is Downloaded
    click element                       ${Excel_Import_Download_Sample_Excel_File_Link}
    Wait Until Created  C:/Users/Mubarak/Downloads/Project Workdays[0-20].xls
    file should exist   C:/Users/Mubarak/Downloads/Project Workdays[0-20].xls

Verify If Excel is uploaded
     press key                          ${Excel_Import_next_button}             40
     wait until element is visible      ${Excel_Import_imported_excel}          10s
     element should be visible          ${Excel_Import_imported_excel}

Click on Next Button in excel Import
    wait until element is not visible   ${excel_import_loader}      20s
    wait until element is enabled       ${Excel_Import_next_button}
    click button                        ${Excel_Import_next_button}

Click on Previous button in excel import
    wait until element is visible       ${Excel_Import_previous_button}     10s
    click button                        ${Excel_Import_previous_button}

Click on cancel button in excel import
    wait until element is visible       ${Excel_Import_cancel_button}   10s
    click button                        ${Excel_Import_cancel_button}

Click on OK button in excel import
    wait until element is not visible   ${excel_import_loader}      10s
    wait until element is visible       ${excel_import_ok_button}   10s
    click button                        ${excel_import_ok_button}

Verify Step 1 page is displayed
    wait until element is visible       ${Excel_Import_step1_header}    10s
    page should contain element         ${Excel_Import_step1_header}

Verify Step 2 page is displayed
    wait until element is visible       ${Excel_Import_Step2_Table}    10s
    page should contain element         ${Excel_Import_Step2_Table}

Verify Step 3 page is displayed
    wait until element is visible       ${Excel_Import_step3_header}
    page should contain element         ${Excel_Import_step3_header}

Wait Untill Loader is disappeared
    wait until element is not visible   ${excel_import_loader}


