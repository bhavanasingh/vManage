//List of buttons declared 
Button notifications_button;
Button addItem_button;
Button report_button;
Button help_button;
Button about_button;
Button exit_button;
Button home_button;
Button sell_button;
Button buy_button;
Button ack_button;
Button rules_button;
Button add_rule_button;
ListBox listboxProf;

int buttonWidth;
int buttonHeight;

int sidebar_buttonX;
int sidebar_buttonY;
int sidebar_buttonWidth;
int sidebar_buttonHeight;
int sidebar_space;

void setupItemScreen(){
  
  buttonWidth = percentX(8);
  buttonHeight = percentY(6);

  sidebar_buttonX = percentX(2);
  sidebar_buttonY = percentY(20);
  sidebar_buttonWidth = percentX(8);
  sidebar_buttonHeight = percentY(8);
  sidebar_space = percentX(1);

  addItem_screen = new ItemScreen(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "Add Item", sidebar_buttonX + sidebar_buttonWidth + percentX(2), percentY(5), percentX(40), percentY(50));
  addItem_screen.addTextfield("Item Id");
  addItem_screen.addTextfield("Name");
  addItem_screen.addTextfield("Brand");
  addItem_screen.addTextfield("Description");
  addItem_screen.addTextfield("Cost Price");
  addItem_screen.addButton("Submit");
  addItem_screen.addButton("Cancel");
     
  editItem_screen = new ItemScreen(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "editItem_screen", sidebar_buttonX + sidebar_buttonWidth + 10, 15, 300, 10);
  editItem_screen.addTextfield("Item Id");
  editItem_screen.addTextfield("Name");
  editItem_screen.addTextfield("Brand");
  editItem_screen.addTextfield("Description");
  editItem_screen.addTextfield("Cost Price");
  editItem_screen.addButton("Submit");
  editItem_screen.addButton("Cancel");
     
  removeItem_screen = new ItemScreen(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "removeItem_screen", sidebar_buttonX + sidebar_buttonWidth + 10, 15, 300, 10);
  removeItem_screen.addTextfield("Item Id");
  removeItem_screen.addTextfield("Name");
  removeItem_screen.addTextfield("Brand");
  removeItem_screen.addTextfield("Description");
  removeItem_screen.addTextfield("Cost Price");
  removeItem_screen.addButton("Submit");
  removeItem_screen.addButton("Cancel");    
  addItem_screen.hide();
  editItem_screen.hide();
  removeItem_screen.hide();
     
}

void drawMainMenu() {
  System.out.println("Inside drawMenu ");
  PFont pfont = createFont(font, 15 * scaleFactor, true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont, 15 * scaleFactor);  

// .setColorBackground(#26ADE4).setColorLabel(#000000).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#D1E751)

     home_button = cp5.addButton("home_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Home")
     .setId(1)
     .setColorBackground(#424242).setColorLabel(#ffffff).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#26ADE4)
     ;
     
     notifications_button = cp5.addButton("notifications_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight + sidebar_space)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Notifications")
     .setId(2)
     .setColorBackground(#424242).setColorLabel(#ffffff).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#26ADE4)
     ;
     
     addItem_button  = cp5.addButton("addItem_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 2 + sidebar_space * 2)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Add Item")
     .setId(3)
     .setColorBackground(#424242).setColorLabel(#ffffff).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#26ADE4)
     ;
    
     report_button  = cp5.addButton("report_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 3 + sidebar_space * 3)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Report")
     .setId(4)
     .setColorBackground(#424242).setColorLabel(#ffffff).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#26ADE4)
     ;
     
     help_button  = cp5.addButton("help_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 4 + sidebar_space * 4)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Help")
     .setId(5)
     .setColorBackground(#424242).setColorLabel(#ffffff).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#26ADE4)
     ;
     
     about_button  = cp5.addButton("about_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 5 + sidebar_space * 5)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("About")
     .setId(6)
     .setColorBackground(#424242).setColorLabel(#ffffff).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#26ADE4)
     ;
     
     exit_button  = cp5.addButton("exit_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 8 + sidebar_space * 8)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Exit")
     .setId(7)
     .setColorBackground(#424242).setColorLabel(#ffffff).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#26ADE4)
     ;

      rules_button = cp5.addButton("rules_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 6 + sidebar_space * 6)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Rules")
     .setId(8)
     .setColorBackground(#424242).setColorLabel(#ffffff).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#26ADE4)
     ;
     
     add_rule_button = cp5.addButton("add_rule_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 7 + sidebar_space * 7)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Add Rule")
     .setId(9)
     .setColorBackground(#424242).setColorLabel(#ffffff).setColorValue(#000000).setColorForeground(#4DBCE9).setColorActive(#26ADE4)
     ;
//Below buttons are commented because these buttons will be moved to a different page. They are not a part of main menu
    /*sell_button  = cp5.addButton("sell_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 9 + sidebar_space * 9)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Sell")
     ..setColorBackground(#D1C4D9).setColorLabel(#000000).setColorValue(#000000).setColorForeground(#D1C4D9).setColorActive(#E0E7F0)
     .setId(10)
     ;
     
    buy_button  = cp5.addButton("buy_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 10 + sidebar_space * 10)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Buy")
     .setId(11)
     .setColorBackground(#D1C4D9).setColorLabel(#000000).setColorValue(#000000).setColorForeground(#D1C4D9).setColorActive(#E0E7F0)
     ;
     
    ack_button  = cp5.addButton("ack_button")
     .setPosition(sidebar_buttonX, sidebar_buttonY + sidebar_buttonHeight * 11 + sidebar_space * 11)
     .setSize(sidebar_buttonWidth, sidebar_buttonHeight)
     .setLabel("Acknowledge")
     .setId(12)
     .setColorBackground(#D1C4D9).setColorLabel(#000000).setColorValue(#000000).setColorForeground(#D1C4D9).setColorActive(#E0E7F0)
     ;*/
     
}

//Below functions define what components will be drawn based on the page selection in the control events. They are called from vManage.pde
void drawRulesPage(){
  notifications_list.hide();
  inventory.hide();
  addItem_screen.hide();
  editItem_screen.hide();
  removeItem_screen.hide();
  helpText.hide();
  aboutText.hide();
  //addRule_screen.hide();
  rule_list.show();
}

void drawAddRulePage(){
  notifications_list.hide();
  inventory.hide();
  addItem_screen.hide();
  editItem_screen.hide();
  removeItem_screen.hide();
  helpText.hide();
  aboutText.hide();
  //addRule_screen.show();
  rule_list.hide();
}

void drawHomePage(){
  notifications_list.hide();
  inventory.show();
  addItem_screen.hide();
  editItem_screen.hide();
  removeItem_screen.hide();
  helpText.hide();
  aboutText.hide();
  //addRule_screen.hide();
  rule_list.hide();
}
void drawAddItemPage(){
  notifications_list.hide();
  inventory.hide();
  addItem_screen.show();
  editItem_screen.hide();
  removeItem_screen.hide();
  helpText.hide();
  aboutText.hide();
  //addRule_screen.hide();
  rule_list.hide();
}
void drawEditItemPage(){
  notifications_list.hide();
  inventory.hide();
  addItem_screen.hide();
  editItem_screen.show();
  removeItem_screen.hide();
  helpText.hide();
  aboutText.hide();
  //addRule_screen.hide();
  rule_list.hide();
}
void drawRemoveItemPage(){
  notifications_list.hide();
  inventory.hide();
  addItem_screen.hide();
  editItem_screen.hide();
  removeItem_screen.show();
  helpText.hide();
  aboutText.hide();
  //addRule_screen.hide();
  rule_list.hide();
}

void drawNotificationsPage(){
  notifications_list.show();
  inventory.hide();
  addItem_screen.hide();
  editItem_screen.hide();
  removeItem_screen.hide();
  helpText.hide();
  aboutText.hide();
  //addRule_screen.hide();
  rule_list.hide();
}

void drawReportsPage(){
  notifications_list.hide();
  inventory.hide();
  addItem_screen.hide();
  editItem_screen.hide();
  removeItem_screen.hide();
  helpText.hide();
  aboutText.hide();
  //addRule_screen.hide();
  rule_list.hide();
}

void drawHelpPage(){
  notifications_list.hide();
  inventory.hide();
  addItem_screen.hide();
  editItem_screen.hide();
  removeItem_screen.hide();
  helpText.show();
  aboutText.hide();
  //addRule_screen.hide();
  rule_list.hide();
}

void drawAboutPage(){
  notifications_list.hide();
  inventory.hide();
  helpText.hide();
  aboutText.show();
  //addRule_screen.hide();
  rule_list.hide();
}
