*** Settings ***
Documentation     Automated Tests for adding products to shopping cart
Library    SeleniumLibrary
Test Setup    Set Selenium Speed    1 

*** Variables ***
${WEBSITE}    https://www.coffeedesk.pl/
${COOKIES_BUTTON}    //button[@id='CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll']
${SUBPAGE}    //div[@class='main-navigation-link-text']//span[@itemprop='name'][contains(text(),'Kawa')]
${COFFEE}    //a[contains(text(),'Johan & Nyström - Brazil Fortaleza')]
${PRODUCT_AMOUNT}    //*[@id="productDetailPageBuyProductForm"]/div/div[1]/div/select
${ADD_TO_CART}    //button[@class='btn btn-primary btn-block btn-buy']
${CONFIRM_BUTTON}    //button[@class='btn offcanvas-close js-offcanvas-close']
${PRODUCT_IN_CART}    //span[@class='badge badge-primary header-cart-badge']
${CART_ICON}    //a[@id='cartWidget']
${PRODUCT_CLASS}    //div[@class='col-6 cart-header-info']
${GO_TO_CHECKOUT}    //a[@class='btn btn-primary btn-block btn-lg begin-checkout-btn']
${IM_NEW}    //button[@class='btn btn-link btn-toggle-register']
${FIRST_NAME}	//input[@id='personalFirstName']
${SURNAME}	//input[@id='personalLastName']	
${EMAIL}	//input[@id='personalMail']
${W_EMAIL}	//input[@id='personalMail']
${PASSWORD}	//input[@id='personalPassword']
${PASSWORD2}	//input[@id='personalPasswordConfirmation']
${STREET}	//input[@id='billingAddressAddressStreet']
${HOUSE_NR}	//input[@id='billingAddressAddressStreetNumber']
${ZIP_CODE}	//input[@id='billingAddressAddressZipcode']
${CITY}	    //input[@id='billingAddressAddressCity']
${COUNTRY}	//select[@id='billingAddressAddressCountry']	
${PHONE}	//input[@id='billingAddressAddressPhoneNumber']	
${GDPR}    //label[@for='acceptedDataProtection']
${PROCEED}    //div[@class='register-submit']

*** Test Cases ***
First Test - Adding Product To Shopping Cart
    Open Browser on Shop's Website
    Accept Coookies and Go to Coffee Subpage
    Go to Product's View
    Choose Amount - 3 packages
    Add Products to Shopping Cart
    Confirm And Continue
    Check If Shopping Cart has 3 products
Second Test - Registration With No Data Input    
    Go To checkout and to register page
    Without Filling Form Check General Data Protection Regulation Checkbox 
    Proceed With Registration With No First Name And Surname
Third Test - Registration Form With No First Name And Surname            
    Fill out all required information except First Name and Surname
    Check GDPR Checkbox
    Proceed With Registration With No First Name And Surname      
Forth Test - Register Form With Wrong Email
    Fill Out All Required Information Except Email
    Fill Out Mail With Wrong Email 
    Check General Data Protection Regulation 
    Proceed With Registration With No Email
Fifth Test - Register Form With Too Short Pasword
    Fill Out All Required Informations
    Fill Out Password and Confirm Password With Too Short Password
    Check General Data Protection Regulation - GDPR - Checkbox 
    Proceed With Registration With Too Short Password
Sixth Test - Register Form With Two Diffrent Passwords
    Fill Out All Other Required Information
    Fill Out Password and Confirm Password With Two Diffrent Passwords
    Click General Data Protection Regulation Checkbox 
    Proceed With Registration With Two Diffrent Passwords

Seventh Test - Browser Saved Amount Of Products In Shopping Cart 
    Close Browser and Open Again Browser on Shop's Website
    Check If There Are Products In Cart

*** Keywords ***
First Test - Adding Product To Shopping Cart
Open Browser on Shop's Website
    Open Browser      ${WEBSITE}           firefox    
    Maximize Browser Window
Accept Coookies And Go to Coffee Subpage
    Click Element     ${COOKIES_BUTTON}
    Click Element    ${SUBPAGE}
Go to Product's View
    Click Element     ${COFFEE}
Choose Amount - 3 packages
    Select From List By Value    ${PRODUCT_AMOUNT}    3
Add Products to Shopping Cart
    Click Element    ${ADD_TO_CART} 
Confirm And Continue
    Click Button    ${CONFIRM_BUTTON} 
Check If Shopping Cart has 3 products
    Element Should Contain    ${PRODUCT_IN_CART}         3  

Second Test - Registration With No Data Input    
Go To checkout and to register page
    Click Element    ${CART_ICON}
    Click Element    ${GO_TO_CHECKOUT}
    Click Button    ${IM_NEW}
Without Filling Form Check General Data Protection Regulation Checkbox 
    Click Element    ${GDPR} 
Proceed With Registration Empty Form
    Click Element    ${PROCEED}

Third Test - Registration Form With No First Name And Surname  
Fill Out All Required Information Except First Name And Surname 
    Input Text    ${EMAIL}    shfirhcfn@pl.pl
    Input Text    ${PASSWORD}    123456789
    Input Text    ${PASSWORD2}    123456789
    Input Text    ${STREET}    Fiołkowa
    Input Text    ${HOUSE_NR}    13
    Input Text    ${ZIP_CODE}    99-999
    Input Text    ${CITY}    Warszawa
    Select From List By Value     ${COUNTRY}    e95f50f4f02e482db8e7f2cca0931d91
    Input Text    ${PHONE}    123456789
Check GDPR Checkbox
    Click Element    ${GDPR}
Proceed With Registration With No First Name And Surname
    Click Element    ${PROCEED}

Forth Test - Register Form With Wrong Email
Fill Out All Required Information Except Email
    Input Text    ${FIRST_NAME}    Anna
    Input Text    ${SURNAME}    Nowak
    Input Text    ${PASSWORD}    123456789
    Input Text    ${PASSWORD2}    123456789
    Input Text    ${STREET}    Fiołkowa
    Input Text    ${HOUSE_NR}    13
    Input Text    ${ZIP_CODE}    99-999
    Input Text    ${CITY}    Warszawa
    Select From List By Value     ${COUNTRY}    e95f50f4f02e482db8e7f2cca0931d91
    Input Text    ${PHONE}    123456789
Fill Out Mail With Wrong Email 
    Input Text    ${EMAIL}    herknchue.pl
Check General Data Protection Regulation
    Click Element    ${GDPR}
Proceed With Registration With No Email
    Click Element    ${PROCEED}

Fifth Test - Register Form With Too Short Pasword
Fill Out All Required Informations
    Input Text    ${FIRST_NAME}    Anna
    Input Text    ${SURNAME}    Nowak
    Input Text    ${EMAIL}    shfirhcfn@pl.pl
    Input Text    ${STREET}    Fiołkowa
    Input Text    ${HOUSE_NR}    13
    Input Text    ${ZIP_CODE}    99-999
    Input Text    ${CITY}    Warszawa
    Select From List By Value     ${COUNTRY}    e95f50f4f02e482db8e7f2cca0931d91
    Input Text    ${PHONE}    123456789
Fill Out Password and Confirm Password With Too Short Password
    Input Text    ${PASSWORD}    12345
    Input Text    ${PASSWORD2}    12345
Check General Data Protection Regulation - GDPR - Checkbox
    Click Element    ${GDPR}
Proceed With Registration With Too Short Password
    Click Element    ${PROCEED}

Sixth Test - Register Form With Two Diffrent Passwords
Fill Out All Other Required Information
    Input Text    ${FIRST_NAME}    Anna
    Input Text    ${SURNAME}    Nowak
    Input Text    ${EMAIL}    shfirhcfn@pl.pl
    Input Text    ${STREET}    Fiołkowa
    Input Text    ${HOUSE_NR}    13
    Input Text    ${ZIP_CODE}    99-999
    Input Text    ${CITY}    Warszawa
    Select From List By Value     ${COUNTRY}    e95f50f4f02e482db8e7f2cca0931d91
    Input Text    ${PHONE}    123456789
Fill Out Password and Confirm Password With Two Diffrent Passwords
    Input Text    ${PASSWORD}    123456789
    Input Text    ${PASSWORD2}    123456999
Click General Data Protection Regulation Checkbox
    Click Element    ${GDPR} 
Proceed With Registration With Two Diffrent Passwords
    Click Element    ${PROCEED}

Seventh Test - Browser Saved Amount Of Products In Shopping Cart 
Close Browser and Open Again Browser on Shop's Website
    Close Browser
    Open Browser    ${WEBSITE}           firefox    
Check If There Are Products In Cart
    Page Should Contain    ${PRODUCT_CLASS}
    
Teardown    Close All Browsers
