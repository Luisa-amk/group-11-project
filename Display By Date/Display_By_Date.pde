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
ArrayList widgetList;
TextWidget focus;
static final int TEXT_WIDGET=1;
static final int EVENT_NULL=0;
static final int EVENT_TEXT = 1;
static final int EVENT_FORWARD = 2;
static final int EVENT_BACKWARD = 3;
Screen currentScreen, screen1, screen2;
int dateLow = 0;
int dateHigh = 0;
TextWidget date1;
TextWidget date2;
Widget showByDate;
Widget returnToMainPage;
boolean invalidInput = false;

void setup() {
  stdFont=loadFont("UDDigiKyokashoN-R-20.vlw");
  textFont(stdFont);
  date1=new TextWidget(400, 75, 50, 40, 5,
    "", color(0), stdFont, TEXT_WIDGET, 10);
  date2=new TextWidget(500, 75, 50, 40, 5,
    "", color(0), stdFont, TEXT_WIDGET, 10);
  showByDate=new Widget(1000, 75, 100, 40, 5,
    "display", color(185, 168, 238), stdFont, EVENT_FORWARD);
  returnToMainPage = new Widget(1000, 75, 250, 40, 5,
    "return to the main page", color(185, 168, 238), stdFont, EVENT_BACKWARD);
  focus=null;
  screen1 = new Screen(color(255));
  screen2 = new Screen(color(255));
  currentScreen = screen1;

  screen1.add(date1);
  screen1.add(date2);
  screen1.add(showByDate);
  screen2.add(returnToMainPage);

  current_query = query1;

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
  currentScreen.draw();
  //switch(current_query) {
  //case 1:
    
    //render_query1(results);
   // break;
    //case 2:
    // println("Pick a city");
    //render_query2(results);
    // break;
 // }
  widgetList = new ArrayList();
  if(currentScreen == screen1)
  {
    text("Enter a date from 1 to 31:", 100, 100);
    text("to", 470, 100);
    text("January 2022", 580, 100);
    if(invalidInput)
    {
      text("Invalid Input", 990, 150);
    }
    widgetList.add(date1);
    widgetList.add(date2);
    widgetList.add(showByDate);
  }
  else if (currentScreen == screen2)
  {
    widgetList.add(returnToMainPage);
  }
  for (int i = 0; i < widgetList.size(); i++) {
    ((Widget)widgetList.get(i)).draw();
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

  //BUTTON FORWARD AND BACKWARD WORK BUT NOT THE TEXT WIDGETS ANYMORE
  //switch(currentScreen.getEvent(mouseX, mouseY)) {
  //case TEXT_WIDGET:
  //  println("text widget");
  //  break;
  //case EVENT_FORWARD:
  //  println("forward");
  //  currentScreen = screen2;
  //  break;
  //case EVENT_BACKWARD:
  //  println("backward");
  //  currentScreen = screen1;
  //  break;
  //}
  
  
  
  int event;
  for (int i = 0; i < widgetList.size(); i++) {
    Widget theWidget = (Widget)widgetList.get(i);
    event = theWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case TEXT_WIDGET:
      println("clicked a text widget");
      focus = (TextWidget) theWidget;
      return;
    case EVENT_FORWARD:
      println("forward");
      if(dateLow <=0 || dateLow > 31 || dateHigh <=0 || dateHigh > 31)
      {
        println("invalid input");
        invalidInput = true;
        dateLow = 0;
        dateHigh = 0;
      }
      else
      {
        currentScreen = screen2;
        invalidInput = false;
      }
      focus = null;
      break;
    case EVENT_BACKWARD:
      println("backward");
      currentScreen = screen1;
      focus = null;
      break;
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

void keyPressed() {
  if (focus != null) {
    focus.append(key);
  }
  if(Character.isDigit(key))
  {
    int keyValue = Character.getNumericValue(key);
    if(focus == date1)
    {
      if(dateLow == 0)
      {
        dateLow = keyValue;
      }
      else
      {
        dateLow = dateLow*10 + keyValue;
      }
    }
    else if (focus == date2)
    {
      if(dateHigh == 0)
      {
        dateHigh = keyValue;
      }
      else
      {
        dateHigh = dateHigh*10 + keyValue;
      }
    }
    println("dateLow: " + dateLow + ", dateHigh: " + dateHigh);
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
