String[] flights;
String[] lines;
import java.util.ArrayList;
ArrayList<DataPoint> dataPoints;

// variables for button widget
final int SCREENX = 1280;
final int SCREENY = 700;
PFont stdFont;
ArrayList widgetList;
static final int EVENT_NULL = 0;
final int QUERY_1 = 1;
final int QUERY_2 = 2;
final int QUERY_3 = 3;
static final int TEXT_WIDGET = 4;
static final int EVENT_DATECHART = 5;
static final int EVENT_HOME = 6;
Screen currentScreen, dateInputScreen, dateBarChart, homePage;
TextWidget date1, date2, focus;
Widget showByDate, returnToHomePage, query1, query2, query3;
int dateLow = 0;
int dateHigh = 0;
boolean invalidInput;
color purple = color(185, 168, 238);

void settings()
{
  size(SCREENX, SCREENY);
}
void setup() {
  stdFont=loadFont("UDDigiKyokashoN-R-20.vlw");
  textFont(stdFont);
  date1=new TextWidget(400, 75, 50, 40, 5, "", purple, stdFont, TEXT_WIDGET, 10);
  date2=new TextWidget(500, 75, 50, 40, 5, "", purple, stdFont, TEXT_WIDGET, 10);
  showByDate=new Widget(100, 150, 100, 40, 5, "display", purple, stdFont, EVENT_DATECHART);
  returnToHomePage = new Widget(990, 10, 270, 40, 5, 
    "return to the home page", color(185, 168, 238), stdFont, EVENT_HOME);
  query1 = new Widget(SCREENX/2 - 50, 150, 100, 40, 5, "query 1", purple, stdFont, QUERY_1);
  query2 = new Widget(SCREENX/2 - 50 , 250, 100, 40, 5, "query 2", purple, stdFont, QUERY_2);
  query3 = new Widget(SCREENX/2 - 50, 350, 100, 40, 5, "query 3", purple, stdFont, QUERY_3);
  focus = null;
  invalidInput = false;
  homePage = new Screen();
  dateInputScreen = new Screen();
  dateBarChart = new Screen();
  // make 2 new screens for query 2 and 3

  currentScreen = homePage;

  homePage.add(query1);
  homePage.add(query2);
  homePage.add(query3);

  dateInputScreen.add(date1);
  dateInputScreen.add(date2);
  dateInputScreen.add(showByDate);
  dateInputScreen.add(returnToHomePage);
  dateBarChart.add(returnToHomePage);

  readData();
}
void draw() {
  currentScreen.draw();
  textFont(stdFont);
  textAlign(LEFT, BASELINE);
  textSize(20);

  widgetList = new ArrayList();
  if(currentScreen == homePage)
  {
    textAlign(CENTER, CENTER);
    text("HOME", SCREENX/2, 75);
    widgetList.add(query1);
    widgetList.add(query2);
    widgetList.add(query3);
  }
  if(currentScreen == dateInputScreen)
  {
    text("Enter a date from 1 to 31:", 100, 100);
    text("to", 470, 100);
    text("January 2022", 580, 100);
    if(invalidInput)
    {
      text("Invalid Input", 250, 175);
    }
    widgetList.add(date1);
    widgetList.add(date2);
    widgetList.add(showByDate);
    widgetList.add(returnToHomePage);
  }
  else if (currentScreen == dateBarChart)
  {
    // add widget to the arraylist for that screen
    widgetList.add(returnToHomePage);
  }
  for (int i = 0; i < widgetList.size(); i++) {
    ((Widget)widgetList.get(i)).draw();
  }
}
void mousePressed()
{ 
  int event;
  for (int i = 0; i < widgetList.size(); i++) {
    Widget theWidget = (Widget)widgetList.get(i);
    event = theWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case QUERY_1:
      currentScreen = dateInputScreen;
      break;
    case QUERY_2:
      currentScreen = dateInputScreen; // switch to new screen for total flights from LAX
      break;
    case QUERY_3:
      currentScreen = dateInputScreen; // switch to new screen for total cancelled flights
      break;
    case TEXT_WIDGET:
      println("clicked a text widget");
      focus = (TextWidget) theWidget;
      return;
    case EVENT_DATECHART:
      println("forward");
      if(dateLow <=0 || dateLow > 31 || dateHigh <=0 || dateHigh > 31 
          || dateLow > dateHigh || dateHigh < dateLow)
      {
        println("invalid input");
        invalidInput = true;
      }
      else
      {
        currentScreen = dateBarChart;
        invalidInput = false;
      }
      focus = null;
      break;
    case EVENT_HOME:
      println("home");
      currentScreen = homePage;
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
      else if(key == BACKSPACE)
      {
        dateHigh = dateHigh / 10;
      }
      else
      {
        dateHigh = dateHigh*10 + keyValue;
      }
    }
  }
  else if(key == BACKSPACE)
  {
    if (focus == date1) 
    {
      dateLow = dateLow / 10; // Remove last digit
    } 
    else if (focus == date2) 
    {
      dateHigh = dateHigh / 10; // Remove last digit
    }   
  }
  println("dateLow: " + dateLow + ", dateHigh: " + dateHigh);
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
