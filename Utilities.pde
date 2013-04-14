import controlP5.*;
//import de.bezier.data.sql.*;
import processing.core.PApplet;
import java.util.List;

PApplet applet;
ControlP5 cp5;
Textarea helpText;
Textarea aboutText;    

//DBHelper db = new DBHelper();

//Help Strings
String[] eHelp, fHelp;

String mysqlUser = "root";
String mysqlPwd = "bs140209";
String mysqlServer = "";
String mysqlDatabase = "monstermash"; 
int sizeX = 1500; 
int sizeY = 1000; 
int scaleFactor = 1; //5 for wall 

int currentPage = 1; //1 home screen by default
String currentLanguage = "fr";

String font = "SansSerif";
ArrayList<ItemComposite> items = new ArrayList<ItemComposite>();//Declaring the list of composite items
int pageNum = 1; //current page being displayed on the table. This can be used while the scrolling action
int dataSet = 0;

//Screen declarations
ItemScreen addItem_screen;
ItemScreen editItem_screen;
ItemScreen removeItem_screen;

ScrollableList inventory;

//Item size declaration
int item_width;
int item_height;

/*----------------Common Utilites--------------------------*/

void setupBackground(){
  
  background(240, 240, 240);
  
  cp5 = new ControlP5(this);
  cp5.setControlFont(createFont(font,15 * scaleFactor));
  item_width = percentX(50);
  item_height = percentY(10);
//  setupItemComposite();//Start with the initial page. After this, pagees will be set in controlEvent function

//Initializing about and Help Screen
helpText = cp5.addTextarea("helpText")
                .setPosition(percentX(15),percentY(10))
                .setSize(percentX(40),percentY(60))
                .setLineHeight(14)
                .setColor(#000000)
                .setColorBackground(#A8A8C0)
                .setColorForeground(#A8A8C0)
                ;

helpText.setText("Hello! This is a help page");
helpText.hide();

aboutText = cp5.addTextarea("aboutText")
                .setPosition(percentX(15),percentY(10))
                .setSize(percentX(40),percentY(60))
                .setLineHeight(14)
                .setColor(#000000)
                .setColorBackground(#A8A8C0)
                .setColorForeground(#A8A8C0)
                ;

aboutText.setText("Hello! This is a about page");
aboutText.hide();
  smooth();
}

//setupItemComposite function performs all the setup activities for creating composites representing screens
void setupItemComposite(){
  System.out.println("Inside setupItemComposite");
  
  inventory = new ScrollableList(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "inventory", sidebar_buttonX + sidebar_buttonWidth + 10, 25, item_width + 10, 20);
  inventory.setGroupDisplay(6);
  
   for(int i = 0; i < 12; i++) {
       ItemComposite item = new ItemComposite(cp5, (ControllerGroup<?>) cp5.controlWindow.getTabs().get(1), "Item" + i, 0, 0, item_width, item_height);
      cp5.register(cp5, "item" + i, item);
      item.setBackgroundColor(color(168, 168, 192));
      item.setLabel("Item" + i);
   //   item.setGroup(group);
      item.setItemName("Example Name");
      item.setItemBrand("Example Brand");
      item.setItemQty("1234");
      item.setItemDescription("Sample description of an Item");
      
      items.add(item);
      inventory.addGroup(item);
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
  println(theEvent.getController().getName());
  
  if(theEvent.getController().getParent() instanceof ControlGroup) {
    String parent = theEvent.getController().getParent().getName();
    if( theEvent.getController().getName().equals(parent + "-Cancel")) {
      theEvent.getController().getParent().hide();
//      inventory.show();
    }
    println("Parent: " + theEvent.getController().getParent().getName());
  }
  
  switch(theEvent.getId()) {
    case(1)://Home page with list of items
    currentPage = Page.HOME_PAGE;  
    setupItemComposite();
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

}