*** Variables ***
#@{auth}     nathakrit@central.tech     esb@CTO12345
${alias}     PIM
${Authorization}     Basic MV8yZDNjbXBudGJoajRzbzRjY2s4czBrNGs0a2tnd28wNGdnNDg0NGs4YzBnczA0d2NzNDptcm4wbWxjdzFua2t3OGcwazg0bzRrY2NvNHcwa2djb28wOGc0NGd3OHc4c3dnYzB3
${username_pim}     eai_postman_test_7656
${password_pim}     4fedbf65a   
${pim_sit_url}     https://cto-pim-sit.cloud.akeneo.com

*** Keywords ***
Get login token pim-sit
    [Documentation]    Declare project variable ${pim_access_token}, ${pim_sit_url}, ${api_login}
    [Arguments]    ${status_code}=200       
    &{header}=    Create Dictionary
    ...    Authorization=${Authorization}
    ...    Content-Type=${api_contentType_json}
    &{body}=    Create Dictionary
    ...    username=${username_pim}
    ...    password=${password_pim}
    ...    grant_type=password
    ${end_point}=   Set Variable    ${pim_sit_url}/api/oauth/v1/token
    ${end_point}=   Remove Redundant characters From URL    ${end_point}
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=&{body}
    REST.Integer    response status    ${status_code}
    ${user_token}=    REST.Output    response body
    ${token}=     Get Value From Json    ${user_token}    $..access_token
    [Return]    ${token}[0]

Get product sku from PIM
    [Documentation]     Prepare Kibana variables to env configs project level
    ...     ${pim_url} staging : https://cto-pim-uat.cloud.akeneo.com, sit : https://cto-pim-sit.cloud.akeneo.com
    [Arguments]    ${sku}    ${token}
    &{header}=    Create Dictionary
    ...    Authorization=Bearer ${token}
    ...    Content-Type=application/json
    
    ${end_point}=   Set Variable    ${pim_sit_url}/api/rest/v1/products/${sku}
    ${end_point}=   Remove Redundant characters From URL    ${end_point}
    ${response}=    REST.GET    endpoint=${end_point}    headers=&{header}    
    REST.Integer    response status    200
    ${product}=    REST.Output    response body
    [Return]    ${product}

Verify sku create on PIM
    [Arguments]    ${sku}    
    ${token}=    Get login token pim-sit   
    ${product}=    Get product sku from PIM    ${sku}    ${token}
    ${product_sku}=    Get Value From Json    ${product}    $..identifier
    Should Be Equal As Strings    ${product_sku}[0]     ${sku} 


    git config --global user.email "nathakrit.p@gmail.com"
  git config --global user.name "Bond-z"