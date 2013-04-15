public class NotificationComposite extends ControlGroup {
  protected CheckBox checkbox;
  protected Textarea text;
  
  public NotificationComposite(ControlP5 theControlP5, String theName) {
    this(theControlP5, theControlP5.getDefaultTab(), theName, 0, 0, 300, 60);
    theControlP5.register(theControlP5.papplet, theName, this);
  }

  protected NotificationComposite(ControlP5 theControlP5, ControllerGroup<?> theParent, String theName, int theX, int theY, int theWidth, int theHeight) {
    super(theControlP5, theParent, theName, theX, theY, theWidth, theHeight);
    
    this.setHeight(percentY(2));
    this.disableCollapse();
    this.setBackgroundHeight(theHeight);
    
      this.setBackgroundColor(#E9E9E9);
    this.setColorBackground(#BCBCBC);
    this.setColorForeground(#BCBCBC);
    this.setColorActive(#BCBCBC);
    
   text = cp5.addTextarea(theName + "-text")
                .setPosition(30,5)
                .setSize(percentX(45),theHeight - 10)
                .setLineHeight(14)
                .setColor(#000000)
                .setColorBackground(#E9E9E9)
                .setColorForeground(#E9E9E9)
                .setGroup(this)
                ;
    
    checkbox = cp5.addCheckBox(theName + "-checkBox")
                .setPosition(5, theHeight/2 - percentX(1))
                .setColorBackground(#4DBCE9)
                .setColorForeground(#424242)
                .setColorActive(#000000)
                .setSize(percentX(1), percentX(1))
                .addItem(theName + "-checkBox0", 0)
                .hideLabels()
                .setGroup(this)
                ;
  }
  
  public void setText(String value) {
    text.setText(value);
  }
  
}
