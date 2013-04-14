public class ItemScreen extends ControlGroup {
  protected ArrayList<Textfield> textfields;
  protected ArrayList<Button> buttons;
  
  protected int buttonWidth = percentX(5);
  protected int buttonHeight = percentY(5);
    
  protected int spacing = percentY(5);
  protected int field_height = percentY(5);
  protected int field_width = percentX(30);
  
   public ItemScreen(ControlP5 theControlP5, String theName) {
    //this(theControlP5, theControlP5.getDefaultTab(), theName, 0, 0, 300, 60);
    //theControlP5.register(theControlP5.papplet, theName, this);
    this(theControlP5, theControlP5.getDefaultTab(), theName, percentX(5), percentY(5), percentX(10), percentY(10));
    theControlP5.register(theControlP5.papplet, theName, this);
  }

  protected ItemScreen(ControlP5 theControlP5, ControllerGroup<?> theParent, String theName, int theX, int theY, int theWidth, int theHeight) {
    super(theControlP5, theParent, theName, theX, theY, theWidth, theHeight);
    
    this.setHeight(percentY(10));
    this.setBackgroundHeight(theHeight);
    this.disableCollapse();
    
    textfields = new ArrayList<Textfield>();
    buttons = new ArrayList<Button>();
  }
  
  public void addTextfield(String name) {
    int index = textfields.size();
    Textfield field = cp5.addTextfield(getName() + "-" + name)
     .setPosition(spacing,spacing + field_height*index*2)
     .setSize(field_width,field_height)
     .setGroup(this)
     .setColorBackground(#A8A8C0);
     ;
     
      Label label = field.captionLabel();
     label.setColor(0);
     label.setText(name);
     label.toUpperCase(false);
     
     textfields.add(field);  
  }
  
  public void addButton(String name) {
    int index = buttons.size();
    Button button = cp5.addButton(getName() + "-" + name)
     .setPosition(spacing*2 + field_width, spacing + spacing*index + buttonHeight*index)
     .setSize(buttonWidth,buttonHeight)
     .setLabel(name)
     .setColorBackground(#181860).setColorLabel(#FFFFFF).setColorValue(#000000).setColorForeground(#D1C4D9).setColorActive(#E0E7F0)
     .setGroup(this)
     ;
     
     buttons.add(button);
    
  }
}
