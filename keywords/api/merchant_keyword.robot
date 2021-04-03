*** Variables ***
${dev-url}     https://dev.pay9.co
${merchant-uat}     https://merchant-uat.pay9.co
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
    ${body}=    Set Variable     {"categories": [{"id": 0,"name": "${cat_name_create}"}],"merchant_id": "7f2036e6-1420-4282-9ff7-c6a4accb0498"}
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
    ${end_point}=   Set Variable    ${merchant-uat}/api/merchant/v2/product/create
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=${body}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]     ${response}

Get order list    
    [Arguments]    ${token}    
    &{header}=    Create Dictionary    
    ...    Accept=application/json
    ...    Content-Type=application/json
    ...    X-Access-Token=${token}
    ${body}=    Set Variable    {"created_from": "2021-03-30 10:00:00","created_to": "2021-04-30 10:00:00","filter": "string","item_per_page": 10,"keyword": "string","merchant_id": "${merchant_id}","page": 1}
    ${body}=    Convert String To Json    ${body} 
    ${end_point}=   Set Variable    ${merchant-uat}/api/merchant/v2/order/list
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=${body}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]     ${response}

Get order detail    
    [Arguments]    ${token}    
    &{header}=    Create Dictionary    
    ...    Accept=application/json
    ...    Content-Type=application/json
    ...    X-Access-Token=${token}
    ${body}=    Set Variable    {"order_id": "71d29cdd-9ef2-4aec-9012-776c1420e7b5"}
    ${body}=    Convert String To Json    ${body} 
    ${end_point}=   Set Variable    ${merchant-uat}/api/merchant/v2/order/detail
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=${body}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]     ${response}

    

    