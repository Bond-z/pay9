*** Settings ***
Library     SeleniumLibrary      timeout=10
Library     RequestsLibrary
Library     HttpLibrary.HTTP
Library     Collections
Library     String
Library     OperatingSystem
Library     JSONLibrary
Library     REST

Resource    keywords/api/authen.robot
Resource    keywords/web/keywords_agent_web.robot
Resource    keywords/web/keywords_merchant.robot
Resource    resources/variables/web_import.robot
