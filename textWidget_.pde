
class TextWidget extends Widget {
  int maxlen;
  TextWidget(int x, int y, int width, int height, int cornerRadius,
    String label, color widgetColor, PFont font, int event, int maxlen) {
    super(x, y, width, height, cornerRadius, label, widgetColor, font, event);
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.cornerRadius = cornerRadius;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=font;
    labelColor=color(0);
    this.maxlen=maxlen;
  }
  void append(char s) {
    
    if (s==BACKSPACE) 
    {
      if (!label.equals(""))
      {
        label=label.substring(0, label.length()-1);
      }
    } 
    else if (label.length() <maxlen)
    {
      label=label+str(s);
    }
  }
}
