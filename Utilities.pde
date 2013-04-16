import controlP5.*;
import de.bezier.data.sql.*;
import processing.core.PApplet;
import java.util.List;

ControlP5 cp5;
Textarea helpText;
Textarea aboutText;

//DBHelper db = new DBHelper();

//Help Strings
String[] eHelp, fHelp;
MySQL msql;
String mysqlUser = "root";
String mysqlPwd = "bs140209";
String mysqlServer = "";
String mysqlDatabase = "inventory";
int sizeX = 1500;
int sizeY = 1000;
int scaleFactor = 1; //5 for wall

int currentPage = 1; //1 home screen by default
String currentLanguage = "fr";

String font = "SansSerif";
ArrayList<ItemComposite> items = new ArrayList<ItemComposite>();//Declaring the list of composite items
ArrayList<RuleComposite> rItems = new ArrayList<RuleComposite>();//Declaring the list of rule composite items
ArrayList<NotificationComposite> notifications = new ArrayList<NotificationComposite>();//Declaring the list of composite items
int pageNum = 1; //current page being displayed on the table. This can be used while the scrolling action
int dataSet = 0;

//Screen declarations
ItemScreen addItem_screen;
ItemScreen editItem_screen;
ItemScreen removeItem_screen;
ItemScreen addRule_screen;


ScrollableList inventory;
ScrollableList notifications_list;
ScrollableList rule_list;

//Item size declaration
int item_width;
int item_height;
int notif_width;
int notif_height;

/*----------------Common Utilites--------------------------*/

void setupBackground(){
  
  background(240, 240, 240);
  
  cp5 = new ControlP5(this);
  cp5.setControlFont(createFont(font,15 * scaleFactor));
  item_width = percentX(50);
  item_height = percentY(17);
  notif_width = percentX(50);
  notif_height = percentY(10);
  PApplet applet = this;
// setupItemComposite();//Start with the initial page. After this, pagees will be set in controlEvent function

  msql = new MySQL( this, "localhost", mysqlDatabase, mysqlUser, mysqlPwd);

  //Initializing about and Help Screen  
  helpText = cp5.addTextarea("helpText")
                .setPosition(percentX(15),percentY(10))
                .setSize(percentX(40),percentY(60))
                .setLineHeight(14)
                .setColor(#000000)
                .setColorBackground(#A8A8C0)
                .setColorForeground(#A8A8C0)
                ;

    String hText1 = "\n V-Manage Help Contents\n 1. Add Item\n 2. Edit Item\n 3. Remove Item\n 4. Receive Item\n 5. Sell Item\n 6. Notifications\n 7. Report";
   // String hText2 = "the box of the item to be removed you need to hit the ‘Remove’ \n button. A screen will be displayed with the input fields pre-populated with that \n item’s information. This is a verification screen to ensure that you want to \n remove the item from the inventory. Press ‘Submit’ and the item will be removed \n and the home screen will be displayed. You cannot use this feature to edit an \n item’s information as the fields will be read-onlyn \n 4. Receive Item Help\n \n To receive an order into inventory, first find the item to be updated in the \n inventory list. On the right side of the box of the item to be received you need \n to hit the ‘Receive’ button. A screen will be displayed with input fields for you \n to fill in which includes the quantity to be received along with the expiration \n date of this new shipment. Fill in the respective fields and press ‘Submit’. The \n home screen will then be displayed with the new quantity and expiration date visible.\n \n 5. Sell Item Help\n \n To sell a quantity of an item, first find the item that you have sold in the \n inventory list. On the right side of the box of the item to be sold you need \n to hit the ‘Sell’ button. A screen will be displayed with one input field to enter \n the quantity that you have sold. Enter the quantity you have sold and press ‘Submit’. \n Once back at the home screen the item’s quantity will now be updated.\n \n 6. Notifications Help\n \n To see current notifications of items that are close to running out of stock or close \n to ";
   // String hText3 = "expiring press the ‘Notifications’ button on the left side of the screen. A list \n of notifications will be displayed on the right. To acknowledge that you have read a \n notification select the check box next to that specific notification and then press \n ‘Acknowledge’. That notification will be removed from the current notifications list.\n \n 7. Report Generator Help\n \n To create a report of the current inventory details for use outside of the application \n all you need to do is press the ‘Report’ button on the left side of the screen. A report \n will automatically be generated and saved to your pc for offline use.\n \n 8. Rules Help\n \n To create a new rule press the ‘Add Rule’ button on the left side of the screen. Enter \n in the input fields the desired rule to be created and press ‘Submit’.\n \n To see the current rules press the ‘Rules’ button on the left side of the screen. \n A listing of all user created rules will be shown. To delete a rule press the ‘Delete’ \n button on the right side of the box of the rule to be deleted or press ‘Home’ to be \n returned to the inventory list.\n \n \n"; 


    helpText.setText("V-Manage Help Contents\n 1. Add Item\n 2. Edit Item\n 3. Remove Item\n 4. Receive Item\n 5. Sell Item\n 6. Notifications\n 7. Report Generator\n 8. Rules");
    helpText.hide();
    
    aboutText = cp5.addTextarea("aboutText")
                    .setPosition(percentX(15),percentY(10))
                    .setSize(percentX(40),percentY(60))
                    .setLineHeight(14)
                    .setColor(#000000)
                    .setColorBackground(#A8A8C0)
                    .setColorForeground(#A8A8C0)
                    ;
    
    aboutText.setText("About Text\n\nV-Manage (Pharmacy Inventory Management and Alert System)\nVersion 1.0 (lastupdated 4/15/2013)\n\nProject Team:\nAbhiram Kadiyala\nAndrew Brady\nBhavana Singh\nJonathan Evanson\nPrammodh Vijayakumar\n");
    
    
    aboutText.hide();
      smooth();
}

//setupItemComposite function performs all the setup activities for creating composites representing screens
void setupItemComposite(){
  System.out.println("Inside setupItemComposite");
  
  inventory = new ScrollableList(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "Inventory", sidebar_buttonX + sidebar_buttonWidth + percentX(2), percentY(5), item_width + 20, 20);
  inventory.setGroupHeight(item_height);
    inventory.setGroupDisplay(5);
  
   for(int i = 0; i < 12; i++) {
       ItemComposite item = new ItemComposite(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "Item" + i, 0, 0, item_width, item_height);
      cp5.register(cp5, "item" + i, item);
      item.setBackgroundColor(color(168, 168, 192));
      item.setLabel("Item" + i);
   // item.setGroup(group);
      item.setItemName("Ibuprofen" + i);
      item.setItemBrand("Fizer" + 1);
      item.setItemQty("100" + i);
      item.setItemDescription("Sample description of an Item");
      
      items.add(item);
      inventory.addGroup(item);
     }
     
     rule_list = new ScrollableList(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "rule_list", sidebar_buttonX + sidebar_buttonWidth + percentX(2), percentY(5), item_width + 20, 20);
  inventory.setGroupHeight(item_height);
    inventory.setGroupDisplay(4);
    

     
     notifications_list = new ScrollableList(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "Notifications", sidebar_buttonX + sidebar_buttonWidth + percentX(2), percentY(5), item_width + 20, 20);
  notifications_list.setGroupHeight(notif_height);
    notifications_list.setGroupDisplay(8);
    
    for(int i = 0; i < 10; i++) {
       NotificationComposite msg = new NotificationComposite(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "Msg" + i, 0, 0, notif_width, notif_height);
      cp5.register(cp5, "msg" + i, msg);
      msg.setBackgroundColor(color(168, 168, 192));
      msg.setLabel("Msg" + i);
      msg.setText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lectus risus, placerat eget lobortis nec, lacinia ac neque. Integer laoreet gravida lectus quis convallis. Aliquam ac placerat leo. Nam a arcu augue, sit amet feugiat augue. Phasellus vulputate quam eu tortor lobortis venenatis.");
      notifications.add(msg);
      notifications_list.addGroup(msg);
    }
}

//percent screen width height utilites
int percentX(int value){
  return (value * width)/100;
}

int percentY(int value){
  return (value * height)/100;
}


public void controlEvent(ControlEvent theEvent) {
  
  if(theEvent.isController())
  if(theEvent.getController().getParent() instanceof ControlGroup) {
      String parent = theEvent.getController().getParent().getName();
      if( theEvent.getController().getName().equals(parent + "-Cancel")) {
          theEvent.getController().getParent().hide();
          // inventory.show();
      }
      else if (theEvent.getController().getName().equals(parent + "-Submit")){
          Integer t_id = 0, t_q = 0;
          t_id = parseInt(cp5.get(Textfield.class,"Add Rule-Item Id").getText());
          t_q = parseInt(cp5.get(Textfield.class,"Add Rule-Quantity / month").getText());
          Rule t_rule = new Rule((int)t_id,(int)t_q, msql);
      }
  }
  
  switch(theEvent.getId()) {
    case(1)://Home page with list of items
    currentPage = Page.HOME_PAGE;
    break;
    case(2)://Notifications list
    currentPage = Page.NOTIFICATIONS_PAGE;
    break;
    case(3)://Add item
    currentPage = Page.ADD_ITEM_PAGE;
    break;
    case(4)://Generate Report
    currentPage = Page.REPORT_PAGE;
    break;
    case(5)://Help Screen
    currentPage = Page.HELP_PAGE;
    break;
    case(6)://About Screen
    currentPage = Page.ABOUT_PAGE;
    break;
    case(8)://Rule list screen
    currentPage = Page.RULE_LIST_PAGE;
    Rule t_rule = new Rule();
  
  ArrayList<Rule> rl = t_rule.getRules(msql) ;
  
      for(int i = 0; i < rl.size(); i++) {
           RuleComposite item = new RuleComposite(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "Rule" + i, 0, 0, item_width, item_height);
          cp5.register(cp5, "item" + i, item);
          item.setBackgroundColor(color(168, 168, 192));
          item.setLabel("Rule" + rl.get(i).Item_id);
          item.setItem(Integer.toString(rl.get(i).Item_id));
          item.setItemQty(Integer.toString(rl.get(i).qty));
          println (rl.get(i).Item_id);
          println (rl.get(i).qty);
          rItems.add(item);
          rule_list.addGroup(item);
       }
    break;
    case(9)://Add rule Screen
    currentPage = Page.ADD_RULE_PAGE;
    break;
    case(7)://Exit
    exit();
    break;
  }
  
}

/*------------------Enumeration---------------------------------------*/
static class Page{

  final static int HOME_PAGE = 1;
  final static int ADD_ITEM_PAGE = 2;
  final static int EDIT_ITEM_PAGE = 3;
  final static int REMOVE_ITEM_PAGE = 4;
  final static int NOTIFICATIONS_PAGE = 5;
  final static int REPORT_PAGE = 6;
  final static int HELP_PAGE = 7;
  final static int ABOUT_PAGE = 8;
  final static int RULE_LIST_PAGE = 9;
  final static int ADD_RULE_PAGE = 10;

}
