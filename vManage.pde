/*--------------------------------------------------------------------------------------------
vManage - Inventory management system for Pharmacy

Authors: Bhavana Singh and Jonathan Evanson

Description: This code has been written as part of CS442 (Software Engineering II) course
              taught by professor Ugo Buy at University of Illinois at Chicago.

//--------------------------------------------------------------------------------------------*/



void setup()
{
  size(sizeX * scaleFactor, sizeY * scaleFactor);
  setupBackground();
  setupItemScreen();
  setupItemComposite();
  drawMainMenu();  //Draw main menu
  currentPage = Page.HOME_PAGE; //default
}


void draw()
{   
  size(sizeX * scaleFactor, sizeY * scaleFactor);
    
  //setupBackground(); //clear back ground and draw header
  background(255);
   
    switch(currentPage) {
     
    case Page.HOME_PAGE:  
 
      drawHomePage(); 
      break; 
     case Page.RECEIVE_ITEM_PAGE:
 
      drawReceiveItemPage(); 
      break;
     case Page.SELL_ITEM_PAGE:
 
      drawSellItemPage(); 
      break;
    case Page.ADD_ITEM_PAGE:
 
      drawAddItemPage(); 
      break;
    
    case Page.EDIT_ITEM_PAGE:  
      drawEditItemPage();
       break; 
      
    case Page.REMOVE_ITEM_PAGE:
      drawRemoveItemPage();
       break;
      
    case Page.NOTIFICATIONS_PAGE:  
      drawNotificationsPage();
      break; 
    
    case Page.REPORT_PAGE:  
      drawReportsPage();
      break; 
    
    case Page.HELP_PAGE:  
      drawHelpPage();
      break; 
    
    case Page.ABOUT_PAGE:  
      drawAboutPage();
      break; 

    case Page.RULE_LIST_PAGE:  
      drawRulesPage();
      break;

    case Page.ADD_RULE_PAGE:  
      drawAddRulePage();
      break;
      
    default:
      
      drawHomePage(); 
      break; 
  }

}
