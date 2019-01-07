*** Settings ***
#Resource  ../../Resources/DataManager.robot
*** Variables ***
###Configuration###
#${Enironment} =  Task
#${Browser} =  gc
#&{URL}   Task=http://indy6staging.greythr.com/   Project=http://project8.gtproj.greytip2.in/
#&{Admin_Login_credentials}      UserName=Admin          Password=sa
#&{Majordmo_Login_credentials}   UserName=Majordomo1     Password=sa

###Input Data###
#${Create_Task_Data_CSV} =  "D:\\GreytHR\\Data\\TaskManagement\\CreateTaskData.csv"

*** Keywords ***
#Task Details
#    DataManager.Get CSV Data      ${Create_Task_Data_CSV}



