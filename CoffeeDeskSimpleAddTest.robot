*** Settings ***
Documentation     Simple automated Tests for adding products to shopping cart
Library    SeleniumLibrary
Library    String
Test Setup    Set Selenium Speed    0.5
Test Teardown    Close Browser

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
*** Test Cases ***
First Test - Adding Product To Shopping Cart
    Open Browser on Shop's Website
    Accept Coookies and Go to Coffee Subpage
    Go to Product's View
    Choose Amount - 3 packages
    Add Products to Shopping Cart
    Confirm And Continue
    Check If Shopping Cart has 3 products
Second Test - Browser Saved Amount Of Products In Shopping Cart
    Close Browser and Open Again Browser on Shop's Website
    Click On Cart Icon 
    Page Should Contains Chosen Products 

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

Second Test - Browser Saved Amount Of Products In Shopping Cart     
Close Browser and Open Again Browser on Shop's Website
    Close Browser
    Open Browser      ${WEBSITE}           firefox   
    Click Element     ${COOKIES_BUTTON}   
Click On Cart Icon 
    Click Element    ${CART_ICON}
Page Should Contains Chosen Products
    Page Should Contain    ${PRODUCT_CLASS}