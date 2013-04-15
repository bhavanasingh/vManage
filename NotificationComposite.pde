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
    
   text = cp5.addTextarea(theName + "-text")
                .setPosition(30,5)
                .setSize(percentX(45),theHeight - 5)
                .setLineHeight(14)
                .setColor(#000000)
                .setColorBackground(#A8A8C0)
                .setColorForeground(#A8A8C0)
                .setGroup(this)
                ;
    
    checkbox = cp5.addCheckBox(theName + "-checkBox")
                .setPosition(5, theHeight/2 - percentX(1))
                .setColorForeground(120)
                .setColorActive(255)
                .setColorLabel(255)
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
