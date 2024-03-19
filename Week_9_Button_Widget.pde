ArrayList widgetList;
PFont stdFont;
final int EVENT_BUTTON1=1;
final int EVENT_FORWARD=2;
final int EVENT_BUTTON2=3;
final int EVENT_BACKWARD=4;
final int EVENT_NULL=0;
Screen currentScreen, screen1, screen2;
void setup() {
  Widget widget1, widget2, widget3, widget4;
  stdFont=loadFont("SegoeUI-20.vlw");
  textFont(stdFont);
  widget1=new Widget(100, 100, 180, 40,
    "Button 1", color(200, 0, 0), stdFont, EVENT_BUTTON1);
  widget2=new Widget(100, 200, 180, 40,
    "Forward", color(0, 200, 0), stdFont, EVENT_FORWARD);
  widget3=new Widget(100, 100, 180, 40,
    "Button 2", color(0, 0, 200), stdFont, EVENT_BUTTON2);
  widget4=new Widget(100, 200, 180, 40,
    "Backward", color(0, 200, 200), stdFont, EVENT_BACKWARD);
  size(400, 400);
  screen1 = new Screen(color(255));
  screen2 = new Screen(color(150));
  screen1.add(widget1);
  screen1.add(widget2);
  screen2.add(widget3);
  screen2.add(widget4);
  currentScreen = screen1;
}
void draw() {
  currentScreen.draw();
}
void mousePressed() {
  switch(currentScreen.getEvent(mouseX, mouseY)) {
  case EVENT_BUTTON1:
    println("button 1!");
    break;
  case EVENT_BUTTON2:
    println("button 2!");
    break;
  case EVENT_FORWARD:
    println("forward");
    currentScreen = screen2;
    break;
  case EVENT_BACKWARD:
    println("backward");
    currentScreen = screen1;
    break;
  }
}

void mouseMoved() {
  int event;
  ArrayList widgetList = currentScreen.getWidgets();
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (event != EVENT_NULL) {
      aWidget.mouseOver();
    } else
      aWidget.mouseNotOver();
  }
}
