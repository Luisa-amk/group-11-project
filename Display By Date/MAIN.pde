String[] flights;
String[] lines;
import java.util.ArrayList;
int result;
int query1 = 1;
int query2 = 2;
int query3 = 3;
int default_query;
int current_query;
boolean cancelled;
ArrayList<DataPoint> dataPoints;
int numDataPoints = 18;
String cancelledTime = "5";
//String cancArrTime  "0000";

// variables for button widget
PFont stdFont;
ArrayList myWidgets;
TextWidget focus;
static final int TEXT_WIDGET=1;
static final int EVENT_NULL=0;
static final int EVENT_TEXT = 1;
static final int EVENT_BUTTON1 = 2;
static final int EVENT_BUTTON2 = 3;
Screen currentScreen, screen1, screen2;

void setup() {
  stdFont=loadFont("SegoeUI-20.vlw");
  textFont(stdFont);
  TextWidget date1=new TextWidget(400, 75, 50, 40,
    "", color(0), stdFont, TEXT_WIDGET, 10);
  TextWidget date2=new TextWidget(500, 75, 50, 40,
    "", color(0), stdFont, TEXT_WIDGET, 10);
  Widget showByDate=new Widget(1000, 75, 100, 40,
    "display", color(200, 0, 0), stdFont, EVENT_BUTTON1);
  Widget returnToMainPage = new Widget(100, 75, 100, 40,
    "return to the main page", color(200, 0, 0), stdFont, EVENT_BUTTON2);
  focus=null;
  screen1 = new Screen(color(255));
  screen2 = new Screen(color(100));
  myWidgets = new ArrayList();
  myWidgets.add(date1);
  myWidgets.add(date2);
  screen1.add(showByDate);
  screen1.add(date1);
  screen1.add(date2);
  screen2.add(returnToMainPage);
  currentScreen = screen1;
  
  
  fullScreen();
  readData();
  result = default_query;        //result = default_query();
  current_query = query1;        //current_query = query3;// whatever type of query is default

  for (DataPoint dp : dataPoints )
  {

    println(dp.flDate + " " + dp.mktCarrier + " " + dp. mktCarrierFlNum + " " + dp.origin + " " + dp.originCityName + " " + dp.originStateInit + " " +
      dp.originStateAbr + " " + dp.originWac + " " + dp.dest + " " + dp.destCityName +  " " + dp.destCityInit + " " +  dp.destStateAbr + " " + dp.destWac +
      dp.crsDepTime + " " + dp.depTime + " " + dp.crsArrTime + " " + dp.arrTime + " " +  dp.cancelled + " " + dp.diverted + " " + dp.distance );

    println(dp);
  }
}
void draw() {
  background(200);
  currentScreen.draw();
  switch(current_query) {
  case 1:
    text("Enter a date range (from 1 to 31):", 100, 100);
    text("to", 470, 100);
    text("January 2022", 580, 100);
    //render_query1(results);
    break;
  case 2:
    println("Pick a city");
    //render_query2(results);
    break;
  }
  for (int i = 0; i < myWidgets.size(); i++) {
    ((Widget)myWidgets.get(i)).draw();
  }
  //render_controls();
}
void mousePressed()
{
  ////Work out which button pressed
  //switch(event)
  //{
  //case button1:
  //   current_query = query1;
  //   results=query1();
  //   break;
  //case button2:
  //   current_query = query2;
  //   results=query2();
  //   break;
  //}
  int event;
  for (int i = 0; i < myWidgets.size(); i++) {
    Widget theWidget = (Widget)myWidgets.get(i);
    event = theWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_TEXT:
      println("clicked on a text widget!");
      focus= (TextWidget)theWidget;
      return; // using return as no need to check other widgets
    case EVENT_BUTTON1:
      currentScreen = screen2;
      println("Pressed button.");
      focus=null;
      return; // using return as no need to check other widgets
    default:
      focus=null;
    }
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

void keyPressed(){
 if(focus != null) {
 focus.append(key);
 }
}

void readData() {
  String[] lines = loadStrings("flights2k.csv");

  dataPoints = new ArrayList<DataPoint>();

  // Parse each line and create DataPoint objects
  for (int i = 1; i < lines.length; i++) {

    String[] parts = split(lines[i], ",");
    DataPoint dp = new DataPoint(parts);  // problem is the parts array -> need to change the parts
    dataPoints.add(dp);
  }
}
