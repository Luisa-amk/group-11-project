import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

String[] flights;
String[] lines;

PFont stdFont;
ArrayList widgetList;
final int SCREENX = 1280;
final int SCREENY = 700;
static final int EVENT_NULL=0;
static final int TEXT_DATE_LOW = 1;
static final int TEXT_DATE_HIGH = 2;
static final int EVENT_HOME = 3;
static final int EVENT_TOTAL_FLIGHTS = 4;
static final int EVENT_DIVERT_CANCEL = 5;
static final int EVENT_FLIGHT_INFO = 6;
static final int EVENT_DEP_LOW = 7;
static final int EVENT_DEP_HIGH = 8;
static final int EVENT_ARR_LOW = 9;
static final int EVENT_ARR_HIGH = 10;

Screen currentScreen, dateBarChart, homePage, cancelBarChart, dateAirport, flightInfoScreen;
Widget totalFlights, divertedAndCancelled, returnToHomePage, query1, query2, query3,
  home, flightInfo, showMe;
TextWidget date1, date2, focus, depTime1, depTime2, arrTime1, arrTime2;
int dateLow = 1;
int dateHigh = 31;
String depTimeLow = "00.00";
String depTimeHigh = "23.59";
String arrTimeLow = "00.00";
String arrTimeHigh = "23.59";
boolean invalidDate;
color purple = color(185, 168, 238);
color bluegreen = color(194, 241, 244);
color lightBlue = color(172, 194, 238);
color darkPurple = color(139, 124, 207);
FlightSchedule flightSchedule;
int[] flightDates = new int[(dateHigh-dateLow)+1];
DropDownMenu dropdown; // NEW
boolean showByDateOption = false; // NEW
boolean showByDepTimeOption = false; // NEW
boolean showByArrTimeOption = false; // NEW
boolean dateLowFirstClick = false;
boolean dateHighFirstClick = false;
boolean depTimeLowFirstClick = false;
boolean depTimeHighFirstClick = false;
boolean arrTimeLowFirstClick = false;
boolean arrTimeHighFirstClick = false;


void settings()
{
  size(SCREENX, SCREENY);
}

void setup() {
  stdFont=loadFont("UDDigiKyokashoN-R-20.vlw");
  textFont(stdFont);
  dropdown = new DropDownMenu(); // NEW
  widgetList = new ArrayList();
  date1 = new TextWidget(width/2 - 120, 250, 70, 40, 5, "", purple, stdFont, TEXT_DATE_LOW, 10);
  date2 = new TextWidget(width/2 + 50, 250, 70, 40, 5, "", purple, stdFont, TEXT_DATE_HIGH, 10);

  // NEW
  totalFlights=new Widget(100, 600, 270, 40, 5, "Total Flights", purple, stdFont, EVENT_TOTAL_FLIGHTS);
  divertedAndCancelled = new Widget(500, 600, 270, 40, 5, "Diverted/Cancelled Flights",
    purple, stdFont, EVENT_DIVERT_CANCEL);
  flightInfo = new Widget(900, 600, 270, 40, 5, "Flight Information", purple, stdFont, EVENT_FLIGHT_INFO);
  depTime1 = new TextWidget(width/2 - 120, 250, 70, 40, 5, "", purple, stdFont, EVENT_DEP_LOW, 10);
  depTime2 = new TextWidget(width/2 + 50, 250, 70, 40, 5, "", purple, stdFont, EVENT_DEP_HIGH, 10);
  arrTime1 = new TextWidget(width/2 - 120, 250, 70, 40, 5, "", purple, stdFont, EVENT_ARR_LOW, 10);
  arrTime2 = new TextWidget(width/2 + 50, 250, 70, 40, 5, "", purple, stdFont, EVENT_ARR_HIGH, 10);
  // NEW

  returnToHomePage = new Widget(990, 20, 250, 40, 5, "return to the home page",
    purple, stdFont, EVENT_HOME);
  home = new Widget(30, 20, 130, 40, 5, "HOME", darkPurple, stdFont, EVENT_NULL);
  showMe = new Widget(SCREENX/2 - 65, 500, 130, 40, 5, "SHOW ME", darkPurple, stdFont, EVENT_NULL);

  focus = null;
  invalidDate = false;
  homePage = new Screen();
  dateBarChart = new Screen();

  dateAirport = new Screen();
  cancelBarChart = new Screen();
  flightInfoScreen = new Screen();

  currentScreen = homePage;

  homePage.add(home);
  homePage.add(totalFlights);
  homePage.add(divertedAndCancelled);
  homePage.add(flightInfo);
  homePage.add(showMe);

  dateBarChart.add(returnToHomePage);
  cancelBarChart.add(returnToHomePage);
  //dateAirport.add(returnToHomePage);
  flightInfoScreen.add(returnToHomePage);

  flightSchedule = new FlightSchedule();
  readData("flights_full.csv");
  //printFlightsPerDay();
  //printFlightsForAirport();
}

void draw() {
  currentScreen.draw();
  textFont(stdFont); // Set the font before drawing text
  textAlign(CENTER, CENTER); // Set text alignment
  textSize(20);
  if (currentScreen == homePage) //<>//
  {
    if (invalidDate)
    {
      text("Invalid Date", width/2, 400);
    }
    text("Filter By: ", 90, 165);
    dropdown.draw();
    widgetList.clear();  // NEW
    widgetList.add(home);
    widgetList.add(showMe);
    widgetList.add(totalFlights);
    widgetList.add(divertedAndCancelled);
    widgetList.add(flightInfo);

    if (showByDateOption)
    {
      widgetList.clear();  // NEW
      text("to", width/2, 270);
      homePage.add(date1);
      homePage.add(date2);
      widgetList.add(date1);
      widgetList.add(date2);
      widgetList.add(totalFlights);
      widgetList.add(divertedAndCancelled);
      widgetList.add(flightInfo);
    }
    else if (showByDepTimeOption)
    {
      widgetList.clear();  // NEW
      text("to", width/2, 270);
      homePage.add(depTime1);
      homePage.add(depTime2);
      widgetList.add(depTime1);
      widgetList.add(depTime2);
      widgetList.add(totalFlights);
      widgetList.add(divertedAndCancelled);
      widgetList.add(flightInfo);
    } 
    else if (showByArrTimeOption)
    {
      widgetList.clear();  // NEW
      text("to", width/2, 270);
      homePage.add(arrTime1);
      homePage.add(arrTime2);
      widgetList.add(arrTime1);
      widgetList.add(arrTime2);
      widgetList.add(totalFlights);
      widgetList.add(divertedAndCancelled);
      widgetList.add(flightInfo);
    }
  } 
  else if (currentScreen == dateBarChart)
  {
    drawBarChart();
    widgetList.clear();
    widgetList.add(returnToHomePage);
  } 
  else if (currentScreen == dateAirport)
  {
    drawAirportGraph(flightSchedule);
    widgetList.clear();
    widgetList.add(returnToHomePage);
  } 
  else if (currentScreen == cancelBarChart)
  {
    drawCanGr();
    widgetList.clear();
    widgetList.add(returnToHomePage);
  } 
  else if (currentScreen == flightInfoScreen)
  {
    widgetList.clear();
    widgetList.add(returnToHomePage);
  }
  // add else-if statements to switch to add widgets on that screen to ArrayList of
  for (int i = 0; i < widgetList.size(); i++) {
    ((Widget)widgetList.get(i)).draw();              //depending on screen widgets get printed.
  }
  // add else-if statements to switch to add widgets on that screen to ArrayList of
  for (int i = 0; i < widgetList.size(); i++) {
    ((Widget)widgetList.get(i)).draw();              //depending on screen widgets get printed.
  }
}

void mousePressed()
{
  int event;
  for (int i = 0; i < widgetList.size(); i++) {
    Widget theWidget = (Widget)widgetList.get(i);
    event = theWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case TEXT_DATE_LOW:
      println("clicked a date low");
      focus = (TextWidget) theWidget;
      if(!dateLowFirstClick)
      {
        dateLow = 0;
      }
      dateLowFirstClick = true;
      break;
    case TEXT_DATE_HIGH:
      println("clicked a date high");
      focus = (TextWidget) theWidget;
      if(!dateHighFirstClick)
      {
        dateHigh = 0;
      }
      dateHighFirstClick = true;
      break;
    case EVENT_TOTAL_FLIGHTS:
      println("forward");
      if (dateLow <=0 || dateLow > 31 || dateHigh <=0 || dateHigh > 31
        || dateLow > dateHigh || dateHigh < dateLow)
      {
        println("invalid date");
        invalidDate = true;
      } else
      {
        currentScreen = dateBarChart;
        printFlightsPerDay();
        invalidDate = false;
      }
      focus = null;
      break;
    case EVENT_HOME:
      println("home");
      currentScreen = homePage;
      focus = null;
      break;
    case EVENT_DIVERT_CANCEL:
      println("forward cancel chart");
      if (dateLow <=0 || dateLow > 31 || dateHigh <=0 || dateHigh > 31
        || dateLow > dateHigh || dateHigh < dateLow)
      {
        println("invalid date");
        invalidDate = true;
      } else
      {
        currentScreen = cancelBarChart;
        invalidDate = false;
      }
      focus = null;
      break;
    case EVENT_FLIGHT_INFO:
      if (dateLow <=0 || dateLow > 31 || dateHigh <=0 || dateHigh > 31
          || dateLow > dateHigh || dateHigh < dateLow)
      {
        println("invalid date");
        invalidDate = true;
      } else
      {
        currentScreen = flightInfoScreen;
        invalidDate = false;
      }
      focus = null;
      break;
    case EVENT_DEP_LOW:
      if(!depTimeLowFirstClick)
      {
        depTimeLow = "";
      }
      depTimeLowFirstClick = true;
      focus = (TextWidget) theWidget;      
      break;
    case EVENT_DEP_HIGH:
      if(!depTimeHighFirstClick)
      {
        depTimeHigh = "";
      }
      depTimeHighFirstClick = true;
      focus = (TextWidget) theWidget;
      break;
    case EVENT_ARR_LOW:
      if(!arrTimeLowFirstClick)
      {
        arrTimeLow = "";
      }
      arrTimeLowFirstClick = true;
      focus = (TextWidget) theWidget;
      break;  
    case EVENT_ARR_HIGH:
      if(!arrTimeHighFirstClick)
      {
        arrTimeHigh = "";
      }
      arrTimeHighFirstClick = true;
      focus = (TextWidget) theWidget;
      break;
    default:
      event = EVENT_NULL;
      break;
    }
  }
  if (currentScreen == homePage)
  {
    dropdown.mousePressed(); // NEW
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
  if (showByDateOption)
  {
    if (Character.isDigit(key))
    {
      int keyValue = Character.getNumericValue(key);
      if (focus == date1)
      {
        if (dateLow == 0)
        {
          dateLow = keyValue;
        } else
        {
          dateLow = dateLow*10 + keyValue;
        }
      } else if (focus == date2)
      {
        if (dateHigh == 0)
        {
          dateHigh = keyValue;
        } else if (key == BACKSPACE)
        {
          dateHigh = dateHigh / 10;
        } else
        {
          dateHigh = dateHigh*10 + keyValue;
        }
      }
    } else if (key == BACKSPACE)
    {
      if (focus == date1)
      {
        dateLow = dateLow / 10; // Remove last digit
      } else if (focus == date2)
      {
        dateHigh = dateHigh / 10; // Remove last digit
      }
    }
    println("dateLow: " + dateLow + ", dateHigh: " + dateHigh);
  }
  else if (showByDepTimeOption)
  {
    if (key == BACKSPACE) {
      if (focus == depTime1 && depTimeLow.length() > 0) {
        depTimeLow = depTimeLow.substring(0, depTimeLow.length() - 1);
      } else if (focus == depTime2 && depTimeHigh.length() > 0) {
        depTimeHigh = depTimeHigh.substring(0, depTimeHigh.length() - 1);
      }
    } else {
      String keyString = String.valueOf(key);
      
      if(focus == depTime1)
      {
        depTimeLow = depTimeLow + keyString;
      }
      else if (focus == depTime2)
      {
        depTimeHigh = depTimeHigh + keyString;
      } 
      println("depTimeLow: " + depTimeLow + ", depTimeHigh: " + depTimeHigh);
    }
  }
  else if(showByArrTimeOption)
  {
    if (key == BACKSPACE) {
      if (focus == arrTime1 && arrTimeLow.length() > 0) {
        arrTimeLow = arrTimeLow.substring(0, arrTimeLow.length() - 1);
      } else if (focus == arrTime2 && arrTimeHigh.length() > 0) {
        arrTimeHigh = arrTimeHigh.substring(0, arrTimeHigh.length() - 1);
      }
    } else {
      String keyString = String.valueOf(key);
      
      if(focus == arrTime1)
      {
        arrTimeLow = arrTimeLow + keyString;
      }
      else if (focus == arrTime2)
      {
        arrTimeHigh = arrTimeHigh + keyString;
      } 
      println("arrTimeLow: " + arrTimeLow + ", arrTimeHigh: " + arrTimeHigh);
    }
  }
}

void readData(String fileName) {
  String[] lines = loadStrings(fileName);
  if (lines != null) {
    processData(lines);
  }
}

void processData(String[] lines) {
  boolean firstLine = true;
  for (String line : lines) {
    if (firstLine) {
      firstLine = false;
      continue;
    }

    String[] parts = line.split(",");

    ArrayList<String> processedParts = new ArrayList<String>();
    String jointPart = "";
    boolean withinQuotes = false;

    for (String part : parts) {
      if (part.contains(" ") && !part.contains("\"")) {
        part = part.split(" ")[0];
      }
      if (part.startsWith("\"")) {
        withinQuotes = true;
        jointPart = part;
      } else if (withinQuotes) {
        jointPart +=  part;
        if (part.endsWith("\"")) {
          withinQuotes = false;
          processedParts.add(jointPart.replaceAll("\"", ""));
        }
      } else
      {
        if (part.isEmpty())
        {
          part = "-1";
        }
        processedParts.add(part);
      }
    }
    if (processedParts.size() >= 18) {
      String date = processedParts.get(0);
      String[] dateParts = date.split("/");
      int day = Integer.parseInt(dateParts[1]);
      String city = processedParts.get(4);
      flightSchedule.addFlight(day, city);

      String cancelled = processedParts.get(15);
      if (cancelled.equals("1.00")) {
        flightSchedule.addCancelledFlight(day, cancelled);
      }

      String airport = processedParts.get(7);
      if (airport.equalsIgnoreCase("LAX")) {        //hard coded 'LAX'- will have to be swapped with userinput variable
        flightSchedule.addAirportFlights(day, city);
      }
    }
    // for (String processedPart : processedParts) {          //uncomment if you need to check array contents
    // println(processedParts + "\n");
    // }
  }
}

void printFlightsPerDay() {

  for (int i = dateLow; i <= dateHigh; i++) {
    String date = String.format("01/%02d/2022", i);
    int numFlights = flightSchedule.countFlightsForDate(i);
    println("Number of flights on " + date + ": " + numFlights);
  }
}
void printFlightsForAirport() {
  for (int i = dateLow; i <= dateHigh; i++) {
    String airport = "LAX";            // will change according to user input
    String date = String.format("01/%02d/2022", i);
    int numFlights = flightSchedule.countFLightsToAirport(i);
    println("Number of flights from "+ airport+ " on " + date + ": " + numFlights);
  }
}

//void printCancelledFlight() {
//for (int i = dateLow; i <= dateHigh; i++) {
//String date = String.format("01/%02d/2022", i);
//int c = flightSchedule.countCancelledFlight(i);
//println("Number of cancelled flights on " + date + ": " + c);
// }
//}
//}



void drawBarChart() {
  println("drawing bar chart");
  int xpos = 65;
  stroke(0);
  fill(0);
  textAlign(CENTER);
  text("Day of the Month", (width / 2), height - 5);


  textAlign(CENTER);
  pushMatrix();      //function saves coordinated
  translate(25, height / 2);
  rotate(-HALF_PI);
  text("Number of Flights", 0, 0);
  popMatrix();      //restores coordinates


  for (int day = dateLow; day <= dateHigh; day++) {
    // Count the flights for the current date
    int flightsForDate = flightSchedule.countFlightsForDate(day);


    int barWidth = 20;
    int maxBarHeight = 400;


    int barHeight = (int) map(flightsForDate, 0, 18000, 0, maxBarHeight);

    // Draw the bar
    fill(206, 212, 247);
    rect(xpos, height - barHeight - 30-20, barWidth, barHeight);


    fill(0);
    PFont labelFont = loadFont("UDDigiKyokashoN-R-20.vlw");    // change font
    textFont(labelFont);
    textAlign(CENTER);
    text(Integer.toString(day), xpos + 10, height - 10-20);

    fill(0);
    textAlign(CENTER);
    textSize(9);
    text(Integer.toString(flightsForDate), xpos + 10, height - barHeight - 40 - 20);

    xpos += 30;
  }
}

void drawCancelChart() {
}  //  cancelled fligh bar chart code here
