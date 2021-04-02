*** Keywords ***

Get create order response body
    [Arguments]    ${order_no}
    ${request}=    Get Kibana log filter by condition    ${order_no} AND requestRouteId:"CDS-create-order" AND logType:"INVOKING"
    ${request}=    Get Value From Json    ${request}    $.._source..body[*]
    ${len}=     Get Length    ${request}
    FOR     ${index}    IN RANGE     ${len}
        ${pk_request}=    Set Variable     ${request}[${index}]
        ${pk_request}=     Convert String To Json    ${pk_request}
        ${pk_status}=     Get Value From Json    ${pk_request}       $..sourceId
        ${status}    Run Keyword And Return Status     Should Be Equal As Strings    ${pk_status}[0]    CDS_SO_10138
        Run Keyword If    '${status}'=='${TRUE}'     Run Keywords     Set Test Variable     ${cds_request}     ${pk_request}
        ...    AND    Exit For Loop
    END
    Should Be True    ${status}    All status verify 'source_id' are not equal 'CDS_SO_10138'
    [Return]    ${cds_request}

Get total of line number    
    [Arguments]     ${order_no}     
    ${request}=    Get Kibana log filter by condition    ${order_no} AND destinationSystem:"FMS" AND requestRouteId:"CDS-create-order-sqs-v2"
    ${request}=    Get Value From Json    ${request}    $..hits.hits[0]._source.request.body[*]
    ${len}=    Get Length   ${request}
    FOR     ${index}    IN RANGE     ${len}
        ${order}=    Set Variable     ${request}[${index}]
        ${order}=    Convert String To Json    ${order}
        ${lineNumber}=    Get Value From Json    ${order}    $..lineNumber
    END
    [Return]    ${lineNumber}    
    
    

Update shipment for single sku   
    [Documentation]     Please set os environment variable for ${AWS_ACCESS_KEY_ID} and ${AWS_SECRET_ACCESS_KEY}
    [Arguments]     ${order_no}     ${sku}  
    Set Test Variable   ${lineNumber}    1  
    ${shiprequestID}=     Get shipment request id     ${order_no}  
    Set Test variable    ${shiprequestID}
    ${status}=    Update ship     ${sku}

Retry update shipment for single sku
    [Arguments]     ${order_no}     ${sku}
    Wait Until Keyword Succeeds    20 x    15 sec    Update shipment for single sku    ${order_no}     ${sku}

Update delivered for single sku   
    [Documentation]     Please set os environment variable for ${AWS_ACCESS_KEY_ID} and ${AWS_SECRET_ACCESS_KEY}
    [Arguments]     ${order_no}     ${sku} 
    Set Test Variable   ${lineNumber}    1 
    ${shiprequestID}=     Get shipment request id     ${order_no}  
    Set Test variable    ${shiprequestID}
    ${status}=    Update delivered     ${sku}
    
Update shipment status to ship for 1st item
    [Documentation]     Please set os environment variable for ${AWS_ACCESS_KEY_ID} and ${AWS_SECRET_ACCESS_KEY}
    [Arguments]     ${order_no}     ${sku}      
    ${shiprequestID}=     Get shipment request id     ${order_no}  
    Set Test variable    ${shiprequestID}    
    #${lineNumber}=    Get line number item 1    ${order_no}     ${sku} 
    Set Test variable     ${lineNumber}    1
    ${status}=    Update ship     ${sku}

Update shipment status to ship for 2nd item
    [Documentation]     Please set os environment variable for ${AWS_ACCESS_KEY_ID} and ${AWS_SECRET_ACCESS_KEY}
    [Arguments]     ${order_no}     ${sku}    
    ${shiprequestID}=     Get shipment request id     ${order_no}  
    Set Test variable    ${shiprequestID}    
    #${lineNumber}=    Get line number item 2    ${order_no}     ${sku} 
    Set Test variable     ${lineNumber}    2
    ${status}=    Update ship     ${sku}

Update shipment status to ship for 3rd item
    [Documentation]     Please set os environment variable for ${AWS_ACCESS_KEY_ID} and ${AWS_SECRET_ACCESS_KEY}
    [Arguments]     ${order_no}     ${sku}    
    ${shiprequestID}=     Get shipment request id     ${order_no}  
    Set Test variable    ${shiprequestID}    
    #${lineNumber}=    Get line number item 3    ${order_no}     ${sku} 
    Set Test variable     ${lineNumber}    3
    ${status}=    Update ship     ${sku}

Retry update shipment status to ship for 1st item
    [Arguments]     ${order_no}     ${sku}
    Wait Until Keyword Succeeds    20 x    15 sec    Update shipment status to ship for 1st item    ${order_no}     ${sku}

Retry update shipment status to ship for 2nd item
    [Arguments]     ${order_no}     ${sku}
    Wait Until Keyword Succeeds    10 x    15 sec    Update shipment status to ship for 2nd item    ${order_no}     ${sku}

Retry update shipment status to ship for 3rd item
    [Arguments]     ${order_no}     ${sku}
    Wait Until Keyword Succeeds    10 x    15 sec    Update shipment status to ship for 3rd item    ${order_no}     ${sku}
    

Get shipment request id
    [Arguments]    ${order_no}
    ${request}=    Get create order response body     ${order_no}
    ${shiprequestID}=    Get Value From Json    ${request}    $..shipRequestId
    ${shiprequestID}=    Set Variable    ${shiprequestID}[0]
    [Return]    ${shiprequestID}

Retry Get shipment request id
    [Arguments]     ${order_no}     ${sku}    ${qty}=1     ${source}=wms
    Wait Until Keyword Succeeds    10 x    5 sec    Get shipment request id    ${order_no}   

Get line number item 1
    [Arguments]    ${order_no}     ${sku}
    ${request}=    Request line number for 1st item    ${order_no}     ${sku}
    ${lineNumber}=   Get Value From Json    ${request}    $..lineNumber
    ${lineNumber}=    Set Variable     ${lineNumber}[0]
    [Return]    ${lineNumber}

Get line number item 2
    [Arguments]    ${order_no}     ${sku}
    ${request}=    Request line number for 2nd item    ${order_no}     ${sku}
    ${lineNumber}=   Get Value From Json    ${request}    $..lineNumber
    ${lineNumber}=    Set Variable     ${lineNumber}[1]
    [Return]    ${lineNumber} 

Get line number item 3
    [Arguments]    ${order_no}     ${sku}
    ${request}=    Request line number for 3rd item    ${order_no}     ${sku}
    ${lineNumber}=   Get Value From Json    ${request}    $..lineNumber
    ${lineNumber}=    Set Variable     ${lineNumber}[1]
    [Return]    ${lineNumber} 
    
Request line number for 1st item
    [Arguments]     ${order_no}     ${sku}    
    ${request}=    Get Kibana log filter by condition    ${order_no} AND requestRouteId:"CDS-create-order"
    ${request}=    Get Value From Json    ${request}    $..hits.hits[0]._source.response.body[*]
    ${len}=     Get Length    ${request}
    FOR     ${index}    IN RANGE     ${len}
        ${order_lineNumber}=    Set Variable     ${request}[${index}]
        ${order_lineNumber}=     Convert String To Json    ${order_lineNumber}
        ${lineNumber}=     Get Value From Json    ${order_lineNumber}       $..sku
        ${status}    Run Keyword And Return Status     Should Be Equal As Strings    ${lineNumber}[0]     ${sku}    
        Run Keyword If    '${status}'=='${TRUE}'     Run Keywords     Get Value From Json       ${order_lineNumber}    $..lineNumber   
        ...    AND    Exit For Loop
    END
    Should Not Be Empty    ${order_lineNumber}
    [Return]    ${order_lineNumber}

Request line number for 2nd item
    [Arguments]     ${order_no}     ${sku}    
    ${request}=    Get Kibana log filter by condition    ${order_no} AND requestRouteId:"CDS-create-order" AND logType:"INVOKING"
    ${request}=    Get Value From Json    ${request}    $..hits.hits[3]._source..body[*]
    ${len}=     Get Length    ${request}
    FOR     ${index}    IN RANGE     ${len}
        ${order_lineNumber}=    Set Variable     ${request}[${index}]
        ${order_lineNumber}=     Convert String To Json    ${order_lineNumber}
        ${lineNumber}=     Get Value From Json    ${order_lineNumber}       $..sku
        ${status}    Run Keyword And Return Status     Should Be Equal As Strings    ${lineNumber}[1]     ${sku}    
        Run Keyword If    '${status}'=='${TRUE}'     Run Keywords     Get Value From Json       ${order_lineNumber}    $..lineNumber   
        ...    AND    Exit For Loop
    END
    Should Not Be Empty    ${order_lineNumber}
    [Return]    ${order_lineNumber}

Request line number for 3rd item
    [Arguments]     ${order_no}     ${sku}    
    ${request}=    Get Kibana log filter by condition    ${order_no} AND requestRouteId:"CDS-create-order" AND logType:"INVOKING"
    ${request}=    Get Value From Json    ${request}    $..hits.hits[3]._source..body[*]
    ${len}=     Get Length    ${request}
    FOR     ${index}    IN RANGE     ${len}
        ${order_lineNumber}=    Set Variable     ${request}[${index}]
        ${order_lineNumber}=     Convert String To Json    ${order_lineNumber}
        ${lineNumber}=     Get Value From Json    ${order_lineNumber}       $..sku
        ${status}    Run Keyword And Return Status     Should Be Equal As Strings    ${lineNumber}[2]     ${sku}    
        Run Keyword If    '${status}'=='${TRUE}'     Run Keywords     Get Value From Json       ${order_lineNumber}    $..lineNumber   
        ...    AND    Exit For Loop
    END
    Should Not Be Empty    ${order_lineNumber}
    [Return]    ${order_lineNumber}

Update ship
    [Arguments]     ${sku}
    ${tracking_no}=     Generate tracking number
    &{headers}=    Create Dictionary
    ...    x-api-key=${ris_api_key}    content-type=application/json    accept-encoding=gzip, deflate    host=${apigw_url} 
    ${body}=        Set Variable    [{ "request_shipment_id": "${shiprequestID}", "line_number": ${lineNumber}, "sku": "${sku}", "tracking_number": "${tracking_no}", "shipment_provider": "bdc", "tracking_url": "AUTOMATE_ROBOT", "package_id": "", "source": "pickingtools", "line_status": "Ship" }]   
    ${body}=    Convert String To Json    ${body}
    ${response}=     AwsKeywords.Send Request With AWS Authen     PUT     ${apigw_url}    
    ...    ${apigw_endpoint_shipped}    ${body}      ${headers}
    ...    execute-api
    ...    ap-southeast-1    
    Should Be Equal As Strings     ${response.status_code}    200
    [Return]    ${response} 

Update delivered
    [Arguments]     ${sku}
    ${tracking_no}=     Generate tracking number
    &{headers}=    Create Dictionary
    ...    x-api-key=${ris_api_key}    content-type=application/json    accept-encoding=gzip, deflate    host=${apigw_url} 
    ${body}=        Set Variable    [{ "request_shipment_id": "${shiprequestID}", "line_number": ${lineNumber}, "sku": "${sku}", "tracking_number": "${tracking_no}", "shipment_provider": "bdc", "tracking_url": "AUTOMATE_ROBOT", "package_id": "", "source": "pickingtools", "line_status": "Delivered" }]   
    ${body}=    Convert String To Json    ${body}
    ${response}=     AwsKeywords.Send Request With AWS Authen     PUT     ${apigw_url}    
    ...    ${apigw_endpoint_shipped}    ${body}      ${headers}
    ...    execute-api
    ...    ap-southeast-1    
    Should Be Equal As Strings     ${response.status_code}    200
    [Return]    ${response}

Update shipment status to delivered for 1st item
    [Documentation]     Please set os environment variable for ${AWS_ACCESS_KEY_ID} and ${AWS_SECRET_ACCESS_KEY}
    [Arguments]     ${order_no}     ${sku}    
    ${shiprequestID}=     Get shipment request id     ${order_no}  
    Set Test variable    ${shiprequestID}    
    #${lineNumber}=    Get line number item 1    ${order_no}     ${sku} 
    Set Test variable     ${lineNumber}    1
    ${status}=    Update delivered     ${sku}

Retry update shipment status to delivered for 1st item
    [Arguments]     ${order_no}     ${sku}    
    Wait Until Keyword Succeeds    10 x   5 sec   Update shipment status to delivered for 1st item     ${order_no}     ${sku}

Update shipment status to delivered for 2nd item
    [Documentation]     Please set os environment variable for ${AWS_ACCESS_KEY_ID} and ${AWS_SECRET_ACCESS_KEY}
    [Arguments]     ${order_no}     ${sku}    
    ${shiprequestID}=     Get shipment request id     ${order_no}  
    Set Test variable    ${shiprequestID}    
    #${lineNumber}=    Get line number item 2    ${order_no}     ${sku} 
    Set Test variable     ${lineNumber}      2
    ${status}=    Update delivered     ${sku}

Retry update shipment status to delivered for 2nd item
    [Arguments]     ${order_no}     ${sku}    
    Wait Until Keyword Succeeds    30 x   5 sec   Update shipment status to delivered for 2nd item     ${order_no}     ${sku}

Update shipment status to delivered for 3rd item
    [Documentation]     Please set os environment variable for ${AWS_ACCESS_KEY_ID} and ${AWS_SECRET_ACCESS_KEY}
    [Arguments]     ${order_no}     ${sku}    
    ${shiprequestID}=     Get shipment request id     ${order_no}  
    Set Test variable    ${shiprequestID}    
    #${lineNumber}=    Get line number item 3    ${order_no}     ${sku} 
    Set Test variable     ${lineNumber}      3
    ${status}=    Update delivered     ${sku}

Retry update shipment status to delivered for 3rd item
    [Arguments]     ${order_no}     ${sku}    
    Wait Until Keyword Succeeds    30 x   5 sec   Update shipment status to delivered for 2nd item     ${order_no}     ${sku}

Get return object after create order
    ${request}=        JSONLibrary.Load JSON From File      ${CURDIR}/test.json
    ${line_number}=    JSONLibrary.Update Value To Json     ${request}    $..firstname    bond
    [Return]   ${line_number}

Call payment service api order paid full payment
    [Documentation]    This keyword calls the payment service api to pay for the order placed user with no saved card or guest
    ...               ${entityId} e.g. 46655
    ...               
    [Arguments]    ${entityId}    ${customerId}    ${encryptCardData}
    ${body}=    JSONLibrary.Load JSON From File    ${CURDIR}/payment_service_payload.json
    ${body_request}=    JSONLibrary.Update Value To Json    ${body}    $.orderEntityId    ${entityId}
    ${body_request}=    JSONLibrary.Update Value To Json    ${body}    $.customerId    ${customerId}
    ${body_request}=    JSONLibrary.Update Value To Json    ${body}    $.encryptCardData    ${encryptCardData}
    ${body_request}=    JSONLibrary.Update Value To Json    ${body}    $.cardId    ${EMPTY}        
    ${body_request}=    JSONLibrary.Update Value To Json    ${body}    $.is3ds    ${false}
    ${body_request}=    JSONLibrary.Update Value To Json    ${body}    $.isStoreCard    ${false}
    ${body_request}=    Delete Object From Json    ${body}    $.storeKeyId
    Log    ${body_request}    
    ${amxkey}=    Get tokenization amx header     ${payment_token_public_key}    ${payment_token_secret_key}
    &{header}=    Create paymentservice header    ${amxkey}
    ${response}=    REST.POST    allow_redirects=false    endpoint=${payment_service_url}/payment/token    headers=&{header}    body=${body_request}
    REST.Integer    response status    409
    ${response}=    REST.Output    response body
    [Return]    ${response}



# Request order line id 
#     [Arguments]    ${order_no}    ${sku}
#     ${request}=    Get Kibana log filter by condition    ${order_no} AND request.headers.CamelHttpPath:"/api/orders"
#     ${request}=    Get Value From Json    ${request}    $..hits.hits[1]._source..body[*]
#     ${len}=     Get Length    ${request}
#     FOR     ${index}    IN RANGE     ${len}
#         ${order_lineId}=    Set Variable     ${request}[${index}]
#         ${order_lineId}=     Convert String To Json    ${order_lineId}
#         ${lineId}=     Get Value From Json    ${order_lineId}       $..sku
#         ${status}    Run Keyword And Return Status     Should Be Equal As Strings    ${lineId}[0]     ${sku}    
#         Run Keyword If    '${status}'=='${TRUE}'     Run Keywords     Get Value From Json      ${order_lineId}   $..lineId
#         ...    AND    Exit For Loop
#     END
#     Should Not Be Empty    ${order_lineId}
#     [Return]    ${order_lineId}

# Get order line id
#     [Arguments]    ${order_no}     ${sku}
#     ${request}=    Request order line id   ${order_no}     ${sku}
#     ${lineId}=   Get Value From Json    ${request}    $..lineId
#     ${lineId}=    Set Variable     ${lineId}[0]
#     [Return]    ${lineId}
