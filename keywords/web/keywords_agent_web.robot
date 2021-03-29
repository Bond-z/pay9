*** Settings ***
Resource      ../../common.robot


*** Keywords ***
Open agent browser
    Open Browser       ${pay9-agent-dev}       chrome

Minimize browser to mobile size
    Set Window Size        ${400}       ${805}