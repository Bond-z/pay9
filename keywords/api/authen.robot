*** Variables ***
${dev-url}     https://dev.pay9.co
${uat-url}     https://uat.pay9.co
#${mobile_no}   +66900000001

*** Keywords ***
Request otp
    [Arguments]    ${mobile_no}
    &{header}=    Create Dictionary    
    ...    Accept=application/json
    ...    Content-Type=application/json
    &{body}=    Create Dictionary
    ...    fcm_instance_id=-
    ...    phone_number=${mobile_no}
    ${end_point}=   Set Variable    ${uat-url}/api/auth/v1/otp/request
    #${end_point}=   Remove Redundant characters From URL    ${end_point}
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=&{body}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    ${otp}=   Get Value From Json     ${response}     $..otp
    [Return]     ${otp}[0]

Validate otp and get token
    [Arguments]    ${mobile_no}    ${otp} 
    &{header}=    Create Dictionary    
    ...    Accept=application/json
    ...    Content-Type=application/json
    &{body}=    Create Dictionary
    ...    passcode=${otp}
    ...    phone_number=${mobile_no}
    ${end_point}=   Set Variable    ${uat-url}/api/auth/v1/otp/validate
    #${end_point}=   Remove Redundant characters From URL    ${end_point}
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=&{body}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    ${token}=   Get Value From Json     ${response}     $..access_token
    [Return]     ${token}[0]

Get token via mobile no
    ${otp}=    Agent request otp
    ${token}=    Agent validate otp and get token     ${mobile_no}    ${otp}    
    [Return]     ${token}
    
Get merchant
    [Arguments]    ${token}
    &{header}=    Create Dictionary    
    ...    Accept=application/json
    ...    Content-Type=application/json
    ...    X-Access-Token=${token}
    
    &{body}=    Create Dictionary
    ...    asc=asc
    ...    keyword=นพดลพานิช
    ...    limit=10
    ...    order_by=agent_merchant
    ...    page=1
    ...    search=string
    ...    status=all||agent
    ${end_point}=   Set Variable    ${dev-url}/api/agent/v1/list/merchant/agent
    ${response}=    REST.POST    endpoint=${end_point}    headers=&{header}    body=&{body}
    REST.Integer    response status    200
    # ${response}=    REST.Output    response body
    # ${token}=   Get Value From Json     ${response}     $..access_token
    # [Return]     ${token}[0]
