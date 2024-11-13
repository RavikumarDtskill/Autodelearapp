*** Settings ***
Resource    ../Settings/settings.robot

*** Test Cases ***
Login And Download Count Report
    Open Browser to Login Page
    Login to Website
    Select Dealer and Make Active
    Navigate to Live App Download Counts
    Download CSV Report
    Filter and Format Downloaded CSV
    Append Data to Previous Month Report
    Rename and Save Report
