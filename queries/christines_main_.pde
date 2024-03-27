import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

String[] flights;
String[] lines;
int result;
final int QUERY_1 = 1;
final int QUERY_2 = 2;
final int QUERY_3 = 3;



// variables for button widget
PFont stdFont;
ArrayList widgetList;
TextWidget focus;
static final int TEXT_WIDGET=4;
static final int EVENT_NULL=0;
static final int EVENT_FORWARD = 5;
static final int EVENT_HOME = 6;
Screen currentScreen, dateInputScreen, dateBarChart, homePage;
int dateLow = 0;
int dateHigh = 0;
TextWidget date1, date2;
Widget showByDate, returnToHomePage, query1, query2, query3;
boolean invalidInput;
FlightSchedule flightSchedule;
int[] flightDates = new int[(dateHigh-dateLow)+1];

void setup() {
  
  stdFont=loadFont("AndaleMono-17.vlw");
  textFont(stdFont);
  date1=new TextWidget(400, 75, 50, 40, 5, "", color(185, 168, 238), stdFont, TEXT_WIDGET, 10);
  date2=new TextWidget(500, 75, 50, 40, 5, "", color(185, 168, 238), stdFont, TEXT_WIDGET, 10);
  showByDate=new Widget(1000, 75, 100, 40, 5, "display", color(185, 168, 238), stdFont, EVENT_FORWARD);
  returnToHomePage = new Widget(990, 600, 250, 40, 5, 
    "return to the home page", color(185, 168, 238), stdFont, EVENT_HOME);
  query1 = new Widget(550, 150, 100, 40, 5, "query 1", color(185, 168, 238), stdFont, QUERY_1);
  query2 = new Widget(550, 250, 100, 40, 5, "query 2", color(185, 168, 238), stdFont, QUERY_2);
  query3 = new Widget(550, 350, 100, 40, 5, "query 3", color(185, 168, 238), stdFont, QUERY_3);
  focus=null;
  invalidInput = false;
  homePage = new Screen(color(255));
  dateInputScreen = new Screen(color(255));
  dateBarChart = new Screen(color(255));
  currentScreen = homePage;

  homePage.add(query1);
  homePage.add(query2);
  homePage.add(query3);

  dateInputScreen.add(date1);
  dateInputScreen.add(date2);
  dateInputScreen.add(showByDate);
  dateInputScreen.add(returnToHomePage);
  dateBarChart.add(returnToHomePage);

  size(1280,700);
  flightSchedule = new FlightSchedule();
  readData("flights-fullmonth");
   //printFlightsPerDay();
  //printFlightsForAirport();

  
}
void draw() {
  currentScreen.draw();
  //draw airport graph in new screen for query 2 
   drawAirportGraph(flightSchedule);
 
    textFont(stdFont); // Set the font before drawing text
    textAlign(LEFT, BASELINE); // Set text alignment
    textSize(18); // 
    
  widgetList = new ArrayList();
  if(currentScreen == homePage)
  {
    
    fill(255);
    rect(540,70, 120, 60);
    textSize(30);
    fill(0);
    text("HOME",565,110);
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
      text("Invalid Input", 990, 150);
    }
    widgetList.add(date1);
    widgetList.add(date2);             
    widgetList.add(showByDate);        
    widgetList.add(returnToHomePage);
  }
  else if (currentScreen == dateBarChart)
  {
    drawBarChart();
    widgetList.add(returnToHomePage);
  }
  for (int i = 0; i < widgetList.size(); i++) {
    ((Widget)widgetList.get(i)).draw();              //depedning on screen widgets get printed. 
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
      currentScreen = dateInputScreen;
      break;
    case QUERY_3:
      currentScreen = dateInputScreen;
      break;
    case TEXT_WIDGET:
      println("clicked a text widget");
      focus = (TextWidget) theWidget;
      return;
    case EVENT_FORWARD:
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
        printFlightsPerDay();
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


void readData(String fileName) {
  String[] lines = loadStrings(fileName);
  if (lines != null) {
    processData(lines);
  }
}

void processData(String[] lines) {
  boolean firstLine = true;
  for (String line : lines) {
    if(firstLine){
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
      } 
      else if (withinQuotes) {
        jointPart +=  part;
        if (part.endsWith("\"")) {
          withinQuotes = false;
          processedParts.add(jointPart.replaceAll("\"", ""));
        }
      } 
      else {
        if (part.isEmpty()) {
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
      
      String airport = processedParts.get(7);
      if(airport.equalsIgnoreCase("LAX")){        //hard coded 'LAX'- will have to be swapped with userinput variable 
        flightSchedule.addAirportFlights(day, city);
      }
      
      
    }
    //for (String processedPart : processedParts) {          //uncomment if you need to check array contents 
    //  println(processedParts + "\n");
    //}
  }
}
void printFlightsPerDay() {
  
  for (int i = dateLow; i <= dateHigh; i++) {
    String date = String.format("01/%02d/2022", i);
    int numFlights = flightSchedule.countFlightsForDate(i);
    println("Number of flights on " + date + ": " + numFlights);
  }
  
}
void printFlightsForAirport(){
  for (int i = dateLow; i <= dateHigh; i++) {
    String airport = "LAX";            // will change according to user input 
    String date = String.format("01/%02d/2022", i);
    int numFlights = flightSchedule.countFLightsToAirport(i);
    println("Number of flights from "+ airport+ " on " + date + ": " + numFlights);
    
  }
}

void drawBarChart() {
  println("drawing bar chart");
  int xpos = 65; 
  
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
    PFont labelFont = loadFont("AndaleMono-10.vlw");    // change font 
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
