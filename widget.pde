class Widget {
  int x, y, width, height, cornerRadius;
  String label;
  int event;
  color widgetColor, labelColor, lineColor;
  color purpleHover = color(185, 168, 238, 100);
  color blueGreenHover = color(194, 241, 244, 100);
  color lightBlueHover = color(172, 194, 238, 100);
  PFont widgetFont;
  
  Widget(int x, int y, int width, int height, int cornerRadius, String label,
    color widgetColor, PFont widgetFont, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.cornerRadius = cornerRadius;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(0);
    lineColor= color(0);
  }
  void draw() {
  fill(widgetColor);
  stroke(lineColor);
  strokeWeight(2);
  rect(x, y, width, height, cornerRadius);
  fill(labelColor);
  textSize(17); // Adjust text size as needed
  textFont(widgetFont); // Set the font
  textAlign(CENTER, CENTER); // Align text to the center of the widget
  text(label, x + width / 2, y + height / 2); 
  }
  void mouseOver() {
    lineColor = color(255);
    if(widgetColor == purple)
    {
      widgetColor = purpleHover;
    }
    else if (widgetColor == bluegreen)
    {
      widgetColor = blueGreenHover;
    }
    else if (widgetColor == lightBlue)
    {
      widgetColor = lightBlueHover;
    }    
  }
  void mouseNotOver() {
    lineColor = color(0);
    if(widgetColor == purpleHover)
    {
      widgetColor = purple;
    }
    else if(widgetColor == blueGreenHover)
    {
      widgetColor = bluegreen;
    } 
    else if(widgetColor == lightBlueHover)
    {
      widgetColor = lightBlue;
    }    
  }
  
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
}
