*** Settings ***
Resource    ../../common.robot


*** Variables ***
${pay9-agent-dev}     https://agent-dev.pay9.co



#---------------------Merchant ----------------#
${url_merchant_dev}      https://merchant-dev.pay9.co/merchant/5435f6a8-1f83-442c-b787-38762f82e7cd/product
${xpath_product_menu}    //*[@id="app"]/div/nav/div[1]/div/div[2]/div/div[1]/div[2]/div
${xpath_product_list}    //*[@id="app"]/div/nav/div[1]/div/div[2]/div/div[2]/a[1]/div[2]/div
${xpath_category}        //*[@id="app"]/div/nav/div[1]/div/div[2]/div/div[2]/a[2]/div[2]/div
${xpath_tags}            //*[@id="app"]/div/nav/div[1]/div/div[2]/div/div[2]/a[3]/div[2]/div
# ${xpath_add_product}     //*[@id="app"]/div/main/div/div/div/div/div/div[2]/div/div[2]/a/span
# ${txt_product_name}      //*[@class="pt-0 col col-6"]/span[1]/div
# ${txt_brandname}         //*[@class="pt-0 col col-6"]/span[2]/div
${txt_description}       //*[@id="input-189"]
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


#${product_name}     Macbook air M1
${brandname}        Macbook
${description}      Review | MacBook Air M1 เทียบกับ MacBook Pro M1 แรงต่างกันมากไหม ซื้อรุ่นไหนดี
${sku}              MAC1001
${tag}              MacbookAir
${retail_price}     30000
${wholesale_price}     15000
${stock_amount}     9
${youtube_link}     https://www.youtube.com/watch?v=ZXFll99nPMg

