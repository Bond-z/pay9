*** Settings ***
Library    Selenium2Library
Resource    ${CURDIR}/../../common.robot


*** Variables ***
${pay9-agent-uat}     https://agent-uat.pay9.co
${pay9-agent-dev}     https://agent-dev.pay9.co
${agent-mobile_no}    0811000001
${otp-mock}    1111
${txt-mobile_no}    //*[@class="card"]/div/div/div/input                 #//*[@class="v-form"]/div[2]/div/div/div/div/div/input      Pay9 platform
${btn-login}    //*[@class="card"]/div/div/div/button                    #//*[@class="v-form"]/div[2]/div/div/div[2]/button        Pay9 platform
${txt-otp}      //*[@class="card"]/div/div/div/input                     #//*[@class="v-form"]/div[2]/div/div/div/div/div/input   Pay9 platform
${btn-submit-otp}    //*[@class="card"]/div/div/div/button               #//*[@class="v-form"]/div[2]/div/div/div[2]/button     Pay9 platform
${uat-url}     https://uat.pay9.co
${merchant-mobile_no}   +66900000001
${select-1st-shop}    //*[@class="card position-relative"]/img[2]

${lbl-recommended}    //*[@class="container p-0"]/div[1]/h3      #//h3[contains(text(),'สินค้าแนะนำ')]
${add-to-cart}    //*[@class='container-fluid d-flex align-items-center']/div[2]/button
${checkbox-merchant}     //*[@class="text-left mt-1 p-1"]/div/div/div[1]/div/label    #//*[@id="checkboxMerchant0"]
${add-qty}    //*[@class="container-fluid mt-2 mb-2"]/div[2]/div[2]/img[2]
${btn-create-quo}    //*[@class="sum-block"]//button
${badge-icon}    //*[@class="container-fluid pr-0"]//div/div[3]/div/div[1]//span
${select-customer}    //*[@class="cardpage mb-1"]/div/div/div[2]
${save-quotation}    //*[@class="w-100 mt-2"]/div/div/div[1]  
${quotation-status}    //*[@class="container"]/span/div/div[1]/div/div/span[2]
${cancel-quotation}    //*[@class="w-100 mt-2"]/div/div/div[3]
${icon-quotation}    //*[@class="nav justify-content-center shadow-lg"]/li[2]/div
${recent-quotation}    //*[@class="container"]/span/div/div[1]/div[2]/div[1]/div/div[2]/div[1]
${btn-send-email}    //*[@class="row mb-2 mt-2"]/div[2]
${lbl-send-email}    //*[@id="SendEmailModal"]/div/div/div/div/div[1]/div[1]/span
${modal-send-email-btn}    //*[@id="SendEmailModal"]//button[2]
${setup-expire-lbl}    //*[@class="card mt-1"]/div
${select-expire-quo}    //*[@class="container-fluid mb-2"]/div/div[2]/span
${date-picker-today}    //*[@class="ant-calendar-picker-container ant-calendar-picker-container-placement-bottomLeft"]//div[3]/span      #//*[@class="ant-calendar-picker-container ant-calendar-picker-container-placement-bottomLeft"]/div/div/div[2]/div[3]/span 



&{login_page}
...    txt-mobile_no=xpath=//*[@class="card"]/div/div/div/input
...    btn-login=xpath=//*[@class="card"]/div/div/div/button
...    txt-otp=xpath=//*[@class="card"]/div/div/div/input
...    btn-submit-otp=xpath=//*[@class="card"]/div/div/div/button


# &{shop_landing_page}
# ...    mnu_hamburger=xpath=//a[@data-testid='mnu-viewMenu-hamburger']
# ...    lbl_login_register=xpath=//label[contains(text(),'${login_signup_dto.lbl_login_register}')]
# ...    lbl_account_name=xpath=//*[./following-sibling::*/*[starts-with(@data-testid, 'mnu-viewMenuOnmobile')]]//*[text()="{$account_name}"]
# ...    btn_mnu_hamburger_x=xpath=(//*[@id='layout']/div)[4]/*[@viewBox]
# ...    txt_email=xpath=//*[@name='customerEmail']
# ...    txt_password=xpath=//*[@name='customerPassword']



#---------------------Merchant ----------------#
${url_merchant_dev}      https://merchant-dev.pay9.co/merchant/5435f6a8-1f83-442c-b787-38762f82e7cd/product
${url_merchant_uat}      https://merchant-uat.pay9.co/merchant/7f2036e6-1420-4282-9ff7-c6a4accb0498/category
${xpath_product_menu}    //*[@id="app"]/div/nav/div[1]/div/div[2]/div/div[1]/div[2]/div
${xpath_product_list}    //*[@id="app"]/div/nav/div[1]/div/div[2]/div/div[2]/a[1]/div[2]/div
${xpath_category}        //*[@id="app"]/div/nav/div[1]/div/div[2]/div/div[2]/a[2]/div[2]/div
${save_cat_btn}      //*[@class="d-flex"]/button[1]
${create_cat_btn}      //*[@class="d-flex"]/button[2]
${xpath_cat_list1}     //*[@class="px-10 py-10"]/div/div/div/div[1]
${txt_cat_name}          //*[@class="v-card v-sheet theme--light"]/div[2]/div/span/div/div/span/div/div/div/div/input
${xpath_tags}            //*[@id="app"]/div/nav/div[1]/div/div[2]/div/div[2]/a[3]/div[2]/div
${xpath_add_product}     //*[@id="app"]/div/main/div/div/div/div/div/div[2]/div/div[2]/a/span
${txt_product_name}      //*[@class="pt-0 col col-6"]/span[1]/div
${txt_brandname}         //*[@class="pt-0 col col-6"]/span[2]/div
${txt_description}       //*[@id="input-85"]
${txt_dropdown_cat}      //*[@id="app"]/div[1]/main/div/div/div/div/span/div/div[2]/div[1]/div[2]/div[2]/span[4]/div/div/div[1]/div[1]/div[2]
${category_1}            //*[@id="list-item-272-0"]/div/div
${txt_sku}               //*[@id="input-202"]
${txt_tags}              //*[@id="app"]/div[1]/main/div/div/div/div/span/div/div[2]/div[1]/div[2]/div[2]/div[7]/div/ul/li/input
${txt_retail_price}      //*[@id="input_retail_price"]
${txt_wholesale_price}    //*[@id="input_wholesale_price"]
${txt_commission}        //*[@id="input_commisison_price"]
${txt_stock_amount}      //*[@id="input_stock_amount"]
${txt_vdo_link}          //*[@id="input-269"]
${btn_add_vdo}           //*[@id="app"]/div[1]/main/div/div/div/div/span/div/div[2]/div[3]/div[4]/button/span
${txt_item_width}        //*[@id="input_logistic_width"]
${btn_create_product}    //*[@id="app"]/div[1]/main/div/div/div/div/span/div/div[2]/div[5]/div[2]/button/span


${product_name}     Macbook air M1
${brandname}        Macbook
${description}      Review | MacBook Air M1 เทียบกับ MacBook Pro M1 แรงต่างกันมากไหม ซื้อรุ่นไหนดี
${sku}              MAC1001
${tag}              MacbookAir
${retail_price}     30000
${wholesale_price}     15000
${stock_amount}     9
${youtube_link}     https://www.youtube.com/watch?v=ZXFll99nPMg

#----------------- Agent --------------------#
${img-1}    //*[@class="table-responsive"]/table/tr/td[1]/div/div[1]/div[1]/img[1]
${img-2}    //*[@class="table-responsive"]/table/tr/td[2]/div/div[1]/div[1]/img[1]
${add-qty}    //*[@class="col-6 d-flex justify-content-around align-items-center"]/i[2]
${add-to-cart-btn}    //*[@class="page-main container pb-5"]/div/div[2]/div/div/div[4]/div/button
${cart-icon}    //*[@class="container-fluid row pt-0 pr-0 pl-0"]/div[3]/div/div[1]
${select-shop}    //*[@id="__layout"]/div/div[2]/div[2]/div/span/div/div/div/img[2]
${create-quo}    //*[@class="sum-block"]/div[1]/div[2]/div/button
${ok-btn}    //*[@class="swal2-container swal2-center swal2-backdrop-show"]/div/div[3]/button[3]



${product-1}    //*[@class="table-responsive"]/table/tr/td[1]/div/div


