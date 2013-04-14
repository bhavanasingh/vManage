public class ItemComposite extends ControlGroup {
  protected Button sell_button;
  protected Button receive_button;
  protected Button edit_button;
  protected Button remove_button;
  
  protected Textlabel item_name_label;
  protected Textlabel item_brand_label;
  protected Textlabel item_qty_label;
  protected Textlabel item_description_label;
  
  protected int buttonWidth = percentX(5);
  protected int buttonHeight = percentY(3);
  protected int spacing = 5;
  protected int backgroundHeight = buttonHeight*4 + spacing*5;
  
  public ItemComposite(ControlP5 theControlP5, String theName) {
    this(theControlP5, theControlP5.getDefaultTab(), theName, 0, 0, 300, 60);
    theControlP5.register(theControlP5.papplet, theName, this);
  }

  protected ItemComposite(ControlP5 theControlP5, ControllerGroup<?> theParent, String theName, int theX, int theY, int theWidth, int theHeight) {
    super(theControlP5, theParent, theName, theX, theY, theWidth, theHeight);
    
    this.setHeight(percentY(2));
    this.disableCollapse();
    this.setBackgroundHeight(backgroundHeight);
    
   sell_button = cp5.addButton(theName + "-sell_button")
     .setPosition(getWidth() - buttonWidth - spacing, spacing)
     .setSize(buttonWidth,buttonHeight)
     .setLabel("Sell")
     .setGroup(this)
     ;
  
  receive_button = cp5.addButton(theName + "-receive_button")
     .setPosition(getWidth() - buttonWidth - spacing,buttonHeight + spacing*2)
     .setSize(buttonWidth,buttonHeight)
     .setLabel("Receive")
     .setGroup(this)
     ;
     
     edit_button = cp5.addButton(theName + "-edit_button")
     .setPosition(getWidth() - buttonWidth - spacing,buttonHeight*2 + spacing*3)
     .setSize(buttonWidth,buttonHeight)
     .setLabel("Edit")
     .setGroup(this)
     ;
     
     remove_button = cp5.addButton(theName + "-remove_button")
     .setPosition(getWidth() - buttonWidth - spacing,buttonHeight*3 + spacing*4)
     .setSize(buttonWidth,buttonHeight)
     .setLabel("Remove")
     .setGroup(this)
     ;
    
    item_name_label = cp5.addTextlabel(theName + "-item_name_label")
      .setPosition(spacing,spacing)
      .setColorValue(0xff000000)
      .setGroup(this)
      ;
    
     item_brand_label = cp5.addTextlabel(theName + "-item_brand_label")
      .setPosition(spacing,spacing*2 + item_name_label.getLineHeight())
      .setColorValue(0xff000000)
      .setGroup(this)
      ;
      
      item_qty_label  = cp5.addTextlabel(theName + "-item_qty_label")
      .setPosition(spacing,spacing*3 + item_name_label.getLineHeight()*2)
      .setColorValue(0xff000000)
      .setGroup(this)
      ;
  
  item_description_label = cp5.addTextlabel(theName + "-item_description_label")
      .setPosition(spacing,spacing*4 + item_name_label.getLineHeight()*3)
      .setColorValue(0xff000000)
      .setGroup(this)
      ;    
  }
  
  public void setItemName(String text) {
    item_name_label.setText("Name: " + text);
  }
  
  public void setItemBrand(String text) {
    item_brand_label.setText("Brand: " + text);
  }
  
  public void setItemQty(String text) {
    item_qty_label.setText("Qty: " + text);
  }
  
  public void setItemDescription(String text) {
    item_description_label.setText("Description: " + text);
  }
  
}
