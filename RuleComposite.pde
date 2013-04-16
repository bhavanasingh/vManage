public class RuleComposite extends ControlGroup {
  protected Button delete_button;
  
  protected Textlabel item_label;
  protected Textlabel item_qty_label;//This label represents quantity expected to be sold in next one month
  
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
  
     item_label = cp5.addTextlabel(theName + "-Item_id")
      .setPosition(spacing,spacing)
      .setColorValue(0xff000000)
      .setGroup(this)
      ;
    
     item_qty_label = cp5.addTextlabel(theName + "-Quantity / month")
      .setPosition(spacing,spacing*2 + percentY(1))
      .setColorValue(0xff000000)
      .setGroup(this)
      ;
      
      
  }
  
  
  public void setItemQty(String text) {
        item_qty_label.setText("Qty: \t" + text);
      }
      
      public void setItem(String text) {
        item_label.setText("Item Id: \t" + text);
      }
}
