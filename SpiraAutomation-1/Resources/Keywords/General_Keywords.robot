*** Keywords ***


Open Browser to Login Page
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

Login to Website
    Wait Until Element Is Visible    xpath=//input[@id='login-email']    40s
    Input Text    xpath=//input[@id='login-email']     ${USERNAME}
    Input Text    xpath=//input[@id='login-pass']     ${PASSWORD}
    Click Button  xpath=//input[@id='login-button']

Select Dealer and Make Active
    Wait Until Element Is Visible    ${DEALER_LOCATION}    40s
    Scroll Element Into View         ${BUTTON_LOCATOR}
    Wait Until Element Is Visible    ${BUTTON_LOCATOR}    40s
    Wait Until Element Is Enabled    ${BUTTON_LOCATOR}    40s
    Scroll Element Into View    ${BUTTON_LOCATOR}
    Execute JavaScript    window.scrollBy(0, 100)
    sleep   5s
    Click Element   ${BUTTON_LOCATOR}


Navigate to Live App Download Counts
    Click Element    ${AUTO_DELEAR_APP}
    Click Element    ${LIVE_APP_COUNTS}

Download CSV Report
    Click Element   ${FROM}
    #Get today's date using Python's datetime module
    ${today}=    Evaluate    datetime.datetime.now().strftime('%Y-%m-%d')    modules=datetime
    # Calculate the date 7 days ago using Python's timedelta
    ${last_week}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=7)).strftime('%Y-%m-%d')    modules=datetime

    # Log the start and end dates for verification
    Log    Start Date: ${last_week}
    Log    End Date: ${today}
    Click Element   ${STARTDATE}
    Input Text  ${STARTDATE}    ${last_week}
    Click Element   ${ENDDATE}
    Input Text  ${ENDDATE}    ${today}
    Click Element   ${DOWNLOAD1}



Filter and Format Downloaded CSV
    Wait Until Element Is Visible    id=username_field    40s
    Open Csv File    ${CSV_DOWNLOAD_PATH}/download.csv
    Filter Rows    ColumnName=SomeColumn    Value=SomeFilter
    Save Csv File    ${CSV_DOWNLOAD_PATH}/formatted_download.csv

Append Data to Previous Month Report
    Open Csv File    ${PREVIOUS_MONTH_REPORT_PATH}
    Append Csv File    ${CSV_DOWNLOAD_PATH}/formatted_download.csv
    Save Csv File    ${PREVIOUS_MONTH_REPORT_PATH}

Rename and Save Report
    Rename File    ${PREVIOUS_MONTH_REPORT_PATH}    ${CSV_DOWNLOAD_PATH}/November_Report.csv

Set Date Filter
    [Arguments]    ${start_date}    ${end_date}
    Input Text    id=start_date_field    ${start_date}
    Input Text    id=end_date_field    ${end_date}