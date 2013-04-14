public class ScrollableList extends ControlGroup<ScrollableList> {
  protected int _myGroupHeight = 125;
  protected ArrayList<ControlGroup> groups;
  
  protected Slider _myScrollbar;
  protected float _myScrollValue = 0;
  protected boolean isScrollbarVisible = true;
  protected int _myScrollbarWidth = 6;
  
  protected int groupOffset = 0;
  protected int groupDisplay = 3;
    
  public ScrollableList(ControlP5 theControlP5, String theName) {
    this(theControlP5, theControlP5.getDefaultTab(), theName, 0, 0, 99, 199);
    theControlP5.register(theControlP5.papplet, theName, this);
  }

  protected ScrollableList(ControlP5 theControlP5, ControllerGroup<?> theGroup, String theName, int theX, int theY, int theW, int theH) {
    super(theControlP5, theGroup, theName, theX, theY, theW, theH);

    this.disableCollapse();
    
    groups = new ArrayList<ControlGroup>();

    _myWidth = theW;
    _myName = theName;

    // workaround fix see code.goode.com/p/controlp5 issue 7
    _myBackgroundHeight = theH < 10 ? 10 : theH;

    _myScrollbar = new Slider(cp5, _myParent, theName + "Scroller", 0, 1, 1, _myWidth - _myScrollbarWidth, 0, _myScrollbarWidth, _myBackgroundHeight);
    _myScrollbar.setBroadcast(false);
    _myScrollbar.setSliderMode(Slider.FLEXIBLE);
    _myScrollbar.setMoveable(false);
    _myScrollbar.setLabelVisible(false);
    _myScrollbar.setParent(this);
    _myScrollbar.addListener(this);
    _myScrollbar.setVisible(true);
   // _myScrollbar.hide();
    _myScrollbar.updateDisplayMode(DEFAULT);
    _myScrollbar.setWidth(10);
    _myScrollbar.setHeight(groupDisplay*_myGroupHeight);
    add(_myScrollbar);
  }

  public void setGroupDisplay(int value) {
   groupDisplay = value;
   _myScrollbar.setHeight(groupDisplay*_myGroupHeight);
  }

  public void addGroup(ControlGroup g) {
    g.setPosition(0, 20 + groups.size()*_myGroupHeight);
    g.setGroup(this);
    groups.add(g);
    updateScroll();
  }
  
  public void controlEvent(ControlEvent theEvent) {
      _myScrollValue = -(1 - theEvent.getValue());
      scroll();
  }
  
  public void scroll(float theValue) {
    _myScrollbar.setValue(1 - theValue);
  }
  
  private void scroll() {
    groupOffset = 0;
    if (groupDisplay < groups.size() && isScrollbarVisible) {
      _myScrollbar.show();
      groupOffset = (int) Math.abs(_myScrollValue * (groups.size() - groupDisplay));
      
      println(_myScrollValue);
      println(groupOffset);
      
      for(int i = 0; i < groups.size(); i++) {
        if(i < groupOffset || i > (groupOffset + groupDisplay-1)) {
          groups.get(i).hide();
        } else {
          groups.get(i).show();
        }
        
        groups.get(i).setPosition(0, 20 + (i - groupOffset)*_myGroupHeight);    
      }
    }
    else {
      _myScrollbar.hide();
    }
  }
  
 public void scrolled(int theStep) {
    if (_myScrollbar.isVisible()) {
      int lines = _myGroupHeight*groups.size();
      float step = 1.0f / lines;
      scroll((1 - getScrollPosition()) + (theStep * step));
    }
    print("hello");
  }

  public float getScrollPosition() {
    return _myScrollbar.getValue();
  }
  
  protected void updateScroll() {
    _myScrollValue = _myScrollbar.getValue();
    _myScrollbar.setValue(_myScrollValue);
    if (groupDisplay < groups.size() && isScrollbarVisible) {
      _myScrollbar.show();
    }
    scroll();
  }
}
