*** Settings ***
Library     SeleniumLibrary      timeout=20
Library     RequestsLibrary
Library     HttpLibrary.HTTP
Library     Collections
Library     String
Library     OperatingSystem
Library     JSONLibrary
Library     REST
Library     yaml

Resource    ${CURDIR}/keywords/api/authen.robot
Resource    ${CURDIR}/keywords/api/merchant_keyword.robot
Resource    ${CURDIR}/keywords/web/keywords_agent_web.robot
Resource    ${CURDIR}/keywords/web/keywords_merchant.robot
Resource    ${CURDIR}/resources/variables/web_import.robot

Resource    ${CURDIR}/resources/variables/test_configs.yaml

