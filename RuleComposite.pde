public class RuleComposite extends ControlGroup {
  protected Button delete_button;
  
  protected Textlabel item_name_label;
  protected Textlabel item_brand_label;
  protected Textlabel item_qty_label;//This label represents quantity expected to be sold in next one month
  protected Textlabel item_description_label;
  
  protected int buttonWidth = 60;
  protected int buttonHeight = 20;
  protected int spacing = 5;
  protected int backgroundHeight = buttonHeight*4 + spacing*5;
  
  public RuleComposite(ControlP5 theControlP5, String theName) {
    this(theControlP5, theControlP5.getDefaultTab(), theName, 0, 0, 300, 60);
    theControlP5.register(theControlP5.papplet, theName, this);
  }

  protected RuleComposite(ControlP5 theControlP5, ControllerGroup<?> theParent, String theName, int theX, int theY, int theWidth, int theHeight) {
    super(theControlP5, theParent, theName, theX, theY, theWidth, theHeight);
    
    this.setHeight(15);
    this.disableCollapse();
    this.setBackgroundHeight(backgroundHeight);
    
   delete_button = cp5.addButton(theName + "-delete_button")
     .setPosition(getWidth() - buttonWidth - spacing, spacing)
     .setSize(buttonWidth,buttonHeight)
     .setLabel("Delete")
     .setGroup(this)
     ;
  
   item_name_label = cp5.addTextlabel(theName + "-item_name_label")
      .setPosition(spacing,spacing)
      .setColorValue(0xff000000)
      .setGroup(this)
      ;
    
     item_brand_label = cp5.addTextlabel(theName + "-item_brand_label")
 //     .setPosition(spacing,spacing*2 + item_name_label.getLineHeight())
      .setColorValue(0xff000000)
      .setGroup(this)
      ;
      
      item_qty_label  = cp5.addTextlabel(theName + "-item_qty_label")
//      .setPosition(spacing,spacing*3 + item_name_label.getLineHeight()*2)
      .setColorValue(0xff000000)
      .setGroup(this)
      ;
  
  item_description_label = cp5.addTextlabel(theName + "-item_description_label")
 //     .setPosition(spacing,spacing*4 + item_name_label.getLineHeight()*3)
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
