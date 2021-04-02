*** Variables ***
${dev-url}     https://dev.pay9.co
${uat-url}     https://uat.pay9.co
${mobile_no}   +66643659596
${merchant_id}    7f2036e6-1420-4282-9ff7-c6a4accb0498   

*** Keywords ***
Get category list
    [Arguments]    ${token}    
    &{header}=    Create Dictionary    
    ...    Accept=application/json
    ...    Content-Type=application/json
    ...    X-Access-Token=${token}
    &{body}=    Create Dictionary
    ...    merchant_id=${merchant_id}
    ${end_point}=   Set Variable    ${uat-url}/api/merchant/v2/category/list
    #${end_point}=   Remove Redundant characters From URL    ${end_point}
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=&{body}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    ${cat_name}=   Get Value From Json     ${response}     $..categories[*].name
    [Return]     ${cat_name}[0]

Add category
    [Arguments]    ${token}     ${cat_name_create}
    &{header}=    Create Dictionary    
    ...    Accept=application/json
    ...    Content-Type=application/json
    ...    X-Access-Token=${token}
    #${body}=    JSONLibrary.Load JSON From File    add_category.json
    ${body}=    Set Variable     {"categories": [{"id": 0,"name": "${cat_name_create}","sub_categories": [null]}],"merchant_id": "7f2036e6-1420-4282-9ff7-c6a4accb0498"}
    ${body}=    Convert String To Json    ${body}
    # ${body_request}=    JSONLibrary.Update Value To Json    ${body}    $..categories.id    555
    # ${body_request}=    JSONLibrary.Update Value To Json    ${body}    $..categories.name    Candy222
    # Log    ${body_request}    
   
    ${end_point}=   Set Variable    ${uat-url}/api/merchant/v2/category/save
    #${end_point}=   Remove Redundant characters From URL    ${end_point}
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=${body}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]     ${response}

Delete category
    [Arguments]    ${token}     ${cat_id}
    &{header}=    Create Dictionary    
    ...    Accept=application/json
    ...    Content-Type=application/json
    ...    X-Access-Token=${token}
    ${body}=    Set Variable     {"category_id": ${cat_id},"merchant_id": "7f2036e6-1420-4282-9ff7-c6a4accb0498"}
    ${body}=    Convert String To Json    ${body} 
    ${end_point}=   Set Variable    ${uat-url}/api/merchant/v2/category/delete
    #${end_point}=   Remove Redundant characters From URL    ${end_point}
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=${body}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]     ${response}
    

Create product
    [Arguments]    ${token}    
    &{header}=    Create Dictionary    
    ...    Accept=application/json
    ...    Content-Type=application/json
    ...    X-Access-Token=${token}
    ${body}=    JSONLibrary.Load JSON From File    ${CURDIR}/add_product.json
    # ${body}=    Set Variable     {"category_id": ${cat_id},"merchant_id": "7f2036e6-1420-4282-9ff7-c6a4accb0498"}
    # ${body}=    Convert String To Json    ${body} 
    # ${end_point}=   Set Variable    ${uat-url}/api/merchant/v2/product/create
    # #${end_point}=   Remove Redundant characters From URL    ${end_point}
    # ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=${body}
    # REST.Integer    response status    200
    # ${response}=    REST.Output    response body
    # [Return]     ${response}
    

    