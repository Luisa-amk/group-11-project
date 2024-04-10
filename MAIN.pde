// final code with the total graphs included  //<>//
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collections;
import java.util.Comparator;
import java.io.BufferedReader;
import controlP5.*;


List<Flight> flights;
List <FlightTicket> flightTickets;
List<Flight> filteredFlights;
List<Flight> fitleredFlights1;
List<Flight> fitleredFlights2;
List<Flight> fitleredFlights3;
List<Flight> fitleredFlights4;
List<Flight> datefilteredFlights;
int rectHeight = 135;
int rectSpacing = 20;
PImage airplaneImg;
String[] lines;
ControlP5 cp5;
DoubleHandleSlider slider;

PFont stdFont;
ArrayList widgetList;
ArrayList screenWidgets;

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
static final int EVENT_DEP_AIRPORT = 11;
static final int EVENT_DEST_AIRPORT = 12;
static final int EVENT_FLIGHTS_PER_HOUR = 13;
static final int EVENT_PIE_CHART = 14;
final int FLIGHTS_BY_DATE = 1;  // 2000 
final int CANCEL_FLIGHT_GRAPH = 2; // 200000
final int FLIGHTS_BY_HOUR = 3; // 70000 or 150000
final int flightsByDateMaxH = 150000;
final int cancelledFlightsMaxH = 400;
final int flightsByHourMaxH = 15000;

Screen currentScreen, dateBarChart, homePage, cancelBarChart, dateAirport, flightInfoScreen, flightsPerHour, pieChart, otherChart;
Widget totalFlights, divertedAndCancelled, returnToHomePage, query1, query2, query3,
  home, flightInfo, showMe, availableFlights, flightsByHour, avFlights, pieChartWidget;
TextWidget date1, date2, focus, depTime1, depTime2, arrTime1, arrTime2, airport1, airport2;

int lowDistValue;
int highDistValue;
int dateLow = 1;
int dateHigh = 31;
String depTimeLow = "00.00";
String depTimeHigh = "23.59";
String arrTimeLow = "00.00";
String arrTimeHigh = "23.59";
String depAirport = "";
String destAirport = "";
boolean invalidDate;
color purple = color(185, 168, 238);
color bluegreen = color(194, 241, 244);
color lightBlue = color(172, 194, 238);
color darkPurple = color(139, 124, 207); // NEW
FlightSchedule flightSchedule;
int[] flightDates = new int[(dateHigh-dateLow)+1];
boolean filterByAirport = false;
int depHour;
DropDownMenu filterByDropDown; // NEW
boolean filterByDateOption = false; // NEW
boolean filterByDepTimeOption = false; // NEW
boolean filterByArrTimeOption = false; // NEW
boolean filterByDistOption = false;
SortByDropDownMenu sortByDropDown; // NEW
boolean sortByAirline = false; // NEW
boolean sortByAirlineZA = false; // NEW
boolean sortByFlightDistanceShortToLong = false; // NEW
boolean sortByFlightDistanceLongToShort = false;
boolean sortByFlightNumber = false; // NEW

boolean dateLowFirstClick = false; // NEW
boolean dateHighFirstClick = false; // NEW
boolean depTimeLowFirstClick = false; // NEW
boolean depTimeHighFirstClick = false; // NEW
boolean arrTimeLowFirstClick = false; // NEW
boolean arrTimeHighFirstClick = false; // NEW
PFont ticketFont;
boolean sliderAdded = false;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup() {
  stdFont=loadFont("UDDigiKyokashoN-R-20.vlw");
  ticketFont = loadFont("UDDigiKyokashoN-R-14.vlw");
  textFont(stdFont);
  
  flightSchedule = new FlightSchedule();
  flights = new ArrayList<>();
  filteredFlights = new ArrayList<>();
  flightTickets = new ArrayList<FlightTicket>();
  readData("flights_full.csv");
  
  filterByDropDown = new DropDownMenu(); // NEW
  sortByDropDown = new SortByDropDownMenu(); // NEW
  cp5 = new ControlP5(this);
  slider = new DoubleHandleSlider(cp5);

  widgetList = new ArrayList();
  date1 = new TextWidget(720, 40, 70, 40, 5, "", purple, stdFont, TEXT_DATE_LOW, 10);
  date2 = new TextWidget(720, 100, 70, 40, 5, "", purple, stdFont, TEXT_DATE_HIGH, 10);

  // NEW
  totalFlights = new Widget(970, 280, 270, 40, 5, "Total Flights", purple, stdFont, EVENT_TOTAL_FLIGHTS);
  divertedAndCancelled = new Widget(970, 340, 270, 40, 5, "Cancelled Flights",
    purple, stdFont, EVENT_DIVERT_CANCEL);
  flightInfo = new Widget(970, 400, 270, 40, 5, "Flight Information", purple, stdFont, EVENT_FLIGHT_INFO);

  flightsByHour = new Widget(970, 460, 270, 40, 5, "Flights per Hour", purple, stdFont, EVENT_FLIGHTS_PER_HOUR);     //for flights by hour graph - rwan
  pieChartWidget = new Widget(970, 520, 270, 40, 5, "Pie Chart", purple, stdFont, EVENT_PIE_CHART);

  depTime1 = new TextWidget(width/2 - 120, 400, 70, 40, 5, "", purple, stdFont, EVENT_DEP_LOW, 10);
  depTime2 = new TextWidget(width/2 + 50, 400, 70, 40, 5, "", purple, stdFont, EVENT_DEP_HIGH, 10);
  arrTime1 = new TextWidget(width/2 - 120, 400, 70, 40, 5, "", purple, stdFont, EVENT_ARR_LOW, 10);
  arrTime2 = new TextWidget(width/2 + 50, 400, 70, 40, 5, "", purple, stdFont, EVENT_ARR_HIGH, 10);
  airport1 = new TextWidget(width/2, 330, 150, 40, 5, "", purple, stdFont, EVENT_DEP_AIRPORT, 10);
  airport2 = new TextWidget(width/2, 400, 150, 40, 5, "", purple, stdFont, EVENT_DEST_AIRPORT, 10);
  // NEW

  returnToHomePage = new Widget(990, 40, 250, 40, 5, "return to the home page",
    purple, stdFont, EVENT_HOME);
  home = new Widget(40, 40, 230, 40, 5, "FLIGHTS HOME", darkPurple, stdFont, EVENT_NULL);
  showMe = new Widget(1040, 230, 130, 35, 5, "SHOW ME", darkPurple, stdFont, EVENT_NULL);

  focus = null;
  invalidDate = false;
  homePage = new Screen();
  dateBarChart = new Screen();
  dateAirport = new Screen();
  cancelBarChart = new Screen();
  flightInfoScreen = new Screen();
  flightsPerHour = new Screen();
  pieChart = new Screen();
  otherChart = new Screen();

  currentScreen = homePage;

  homePage.add(home);
  homePage.add(airport1);
  homePage.add(airport2);
  homePage.add(totalFlights);
  homePage.add(divertedAndCancelled);
  homePage.add(flightInfo);
  homePage.add(showMe);
  homePage.add(flightsByHour);

  dateBarChart.add(returnToHomePage);
  cancelBarChart.add(returnToHomePage);
  flightInfoScreen.add(returnToHomePage);

  //printTimeTotal(flightSchedule);
  //printFlightsPerDay();
  //printFlightsForAirport();
}

void draw() {
  currentScreen.draw();
}

void mousePressed()
{
  int event;
  for (int i = 0; i < screenWidgets.size(); i++) {
    Widget theWidget = (Widget)screenWidgets.get(i);
    event = theWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case TEXT_DATE_LOW:
      println("clicked a date low");
      filterByDateOption = true;
      focus = (TextWidget) theWidget;
      if (!dateLowFirstClick)
      {
        dateLow = 0;
      }
      dateLowFirstClick = true;
      break;
    case TEXT_DATE_HIGH:
      println("clicked a date high");
      filterByDateOption = true;
      focus = (TextWidget) theWidget;
      if (!dateHighFirstClick)
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
      filterByDateOption = false;
      currentScreen = homePage;
      focus = null;
      break;
    case EVENT_DIVERT_CANCEL:
      println("forward cancel chart");
      filterByDateOption = false;
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
      filterByDateOption = false;
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
      filterByDateOption = false;
      if (!depTimeLowFirstClick)
      {
        depTimeLow = "";
      }
      depTimeLowFirstClick = true;
      focus = (TextWidget) theWidget;
      break;
    case EVENT_DEP_HIGH:
      filterByDateOption = false;
      if (!depTimeHighFirstClick)
      {
        depTimeHigh = "";
      }
      depTimeHighFirstClick = true;
      focus = (TextWidget) theWidget;
      break;
    case EVENT_ARR_LOW:
      filterByDateOption = false;
      if (!arrTimeLowFirstClick)
      {
        arrTimeLow = "";
      }
      arrTimeLowFirstClick = true;
      focus = (TextWidget) theWidget;
      break;
    case EVENT_ARR_HIGH:
      filterByDateOption = false;
      if (!arrTimeHighFirstClick)
      {
        arrTimeHigh = "";
      }
      arrTimeHighFirstClick = true;
      focus = (TextWidget) theWidget;
      break;
    case EVENT_DEP_AIRPORT:
      filterByDateOption = false;
      focus = (TextWidget) theWidget;
      filterByAirport = true;
      break;
    case EVENT_DEST_AIRPORT:
      filterByDateOption = false;
      focus = (TextWidget) theWidget;
      filterByAirport = true;
      break;
    case EVENT_FLIGHTS_PER_HOUR:
      filterByDateOption = false;
      currentScreen = flightsPerHour;
      focus = null;
      break;
    case EVENT_PIE_CHART:
      filterByDateOption = false;
      currentScreen = pieChart;
      focus = null;
      break;
    default:
      event = EVENT_NULL;
      break;
    }
  }
  if (currentScreen == homePage)
  {
    flightTickets.clear();
    filteredFlights.clear();
    filterByDropDown.mousePressed(); // NEW
  }
  if (currentScreen == flightInfoScreen)                  // christine moved everything to the class
  {
    sortByDropDown.mousePressed();
    //filteredFlights = filterFlightsByDate(flights, dateLow, dateHigh);
  }
//  if ( currentScreen == dateBarChart)
//  {
 //  getFilteredMap(filteredFlights);
       
 // }
 
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
  if (filterByDateOption)
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
  } else if (filterByDepTimeOption)
  {
    if (key == BACKSPACE) {
      if (focus == depTime1 && depTimeLow.length() > 0) {
        depTimeLow = depTimeLow.substring(0, depTimeLow.length() - 1);
      } else if (focus == depTime2 && depTimeHigh.length() > 0) {
        depTimeHigh = depTimeHigh.substring(0, depTimeHigh.length() - 1);
      }
    } else {
      String keyString = String.valueOf(key);

      if (focus == depTime1)
      {
        depTimeLow = depTimeLow + keyString;
      } else if (focus == depTime2)
      {
        depTimeHigh = depTimeHigh + keyString;
      }
      println("depTimeLow: " + depTimeLow + ", depTimeHigh: " + depTimeHigh);
    }
  } else if (filterByArrTimeOption)
  {
    if (key == BACKSPACE) {
      if (focus == arrTime1 && arrTimeLow.length() > 0) {
        arrTimeLow = arrTimeLow.substring(0, arrTimeLow.length() - 1);
      } else if (focus == arrTime2 && arrTimeHigh.length() > 0) {
        arrTimeHigh = arrTimeHigh.substring(0, arrTimeHigh.length() - 1);
      }
    } else {
      String keyString = String.valueOf(key);

      if (focus == arrTime1)
      {
        arrTimeLow = arrTimeLow + keyString;
      } else if (focus == arrTime2)
      {
        arrTimeHigh = arrTimeHigh + keyString;
      }
      println("arrTimeLow: " + arrTimeLow + ", arrTimeHigh: " + arrTimeHigh);
    }
  } else if (filterByAirport)
  {
    if (key == BACKSPACE) {
      if (focus == airport1 && depAirport.length() > 0) {
        depAirport = depAirport.substring(0, depAirport.length() - 1);
      } else if (focus == airport2 && destAirport.length() > 0) {
        destAirport = destAirport.substring(0, destAirport.length() - 1);
      }
    } else {
      String keyString = String.valueOf(key);

      if (focus == airport1)
      {
        depAirport = depAirport + keyString;
      } else if (focus == airport2)
      {
        destAirport = destAirport + keyString;
      }
      println("depAirport: " + depAirport + ", destAirport: " + destAirport);
    }
  }
}

void readData(String fileName) {
  BufferedReader reader = createReader(fileName);

  if (reader != null) {
    processData(reader);
  }
}

List<Flight> processData(BufferedReader reader) {
  boolean firstLine = true;                                                        //skip the first line in the data (the variable names)
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      String[] parts = line.split(",");

      if (firstLine) {
        firstLine = false;
        continue;
      }


      ArrayList<String> processedParts = new ArrayList<String>();
      String jointPart = "";
      boolean withinQuotes = false;

      for (String part : parts) {
        if (part.contains(" ") && !part.contains("\"")) {
          part = part.split(" ")[0];                                                //split the date to only take the "day" part
        }
        if (part.startsWith("\"")) {                                                //account for quotation marks and comma in the originCityName and destCityName
          withinQuotes = true;
          jointPart = part;
        } else if (withinQuotes) {
          jointPart += "," + part ;
          if (part.endsWith("\"")) {
            withinQuotes = false;
            processedParts.add(jointPart.replaceAll("\"", ""));
          }
        } else {
          if (part.isEmpty()) {
            part = "-1";                                                            //-1 for arrTime and depTime if flight is cancelled
          }
          processedParts.add(part);
        }
      }
      if (processedParts.size() >= 18) {                                            //if 18 parts (dataPoints) have been processed into the array - assign each varibale name its coresponding index
        String date = processedParts.get(0);
        String[] dateParts = date.split("/");                                       //splitting the date to take the 'day' part as an integer
        int day = Integer.parseInt(dateParts[1]);
        String airline = processedParts.get(1);
        int flightNum = Integer.parseInt(processedParts.get(2));
        String departureAirport = processedParts.get(3);
        String originCityName = processedParts.get(4);
        String originStateAbr =  processedParts.get(5);
        int originWAC = Integer.parseInt(processedParts.get(6));
        String arrivalAirport = processedParts.get(7);
        String destCityName = processedParts.get(8);
        String destStateAbr = processedParts.get(9);
        int destWAC = Integer.parseInt(processedParts.get(10));
        int crsDepTime = Integer.parseInt(processedParts.get(11));
        // int departureTime = Integer.parseInt(processedParts.get(12));
        String departureTime = processedParts.get(12);
        int crsArrTime = Integer.parseInt(processedParts.get(13));
        // int arrivalTime = Integer.parseInt(processedParts.get(14));
        String arrivalTime = processedParts.get(14);
        String cancelled = processedParts.get(15);
        double diverted = Double.parseDouble(processedParts.get(16));
        double distance = Double.parseDouble(processedParts.get(17));

        if (airline.equals("AA")) {
          airline = "American Airlines";
        } else if (airline.equals("B6")) {
          airline = "JetBlue Airways";
        } else if (airline.equals("DL")) {
          airline = "Delta Air Lines";
        } else if (airline.equals("UA")) {
          airline = "United Airlines";
        } else if (airline.equals("WN")) {
          airline =" Southwest Airlines";
        } else if (airline.equals("F9")) {
          airline = "Frontier Airlines";
        } else if (airline.equals("NK")) {
          airline = "Spirit Airlines";
        } else if (airline.equals("AS")) {
          airline = "Alaska Airlines";
        }

   
        int depHour = Integer.parseInt(departureTime.substring(0,2)); // NEW
        int arrHour = Integer.parseInt(arrivalTime.substring(0,2));  // NEW
     
     
        flightSchedule.addFlight(day, originCityName);
        flightSchedule.addFlightByDepTime(depHour,originCityName);
        double canc = Double.parseDouble(cancelled);
        
        
        if (canc==1.00) { //change t0 1.00 for
          flightSchedule.addCancelledFlight(day, cancelled);
          
        }
        if (departureAirport.equalsIgnoreCase(depAirport)) {        //hard coded 'LAX'- will have to be swapped with userinput variable
          flightSchedule.addAirportFlights(day, originCityName);
        }
// here i could add the if statement again trying ONE more thing 
        Flight flight = new Flight(day, flightNum, departureAirport, arrivalAirport, arrivalTime, departureTime, destCityName, originCityName, canc, airline, distance, diverted);            //create a flight object out of the processed parts of each line  and add this to the flights arrayList
        //println(flight.getDate() + " ," + flight.getArrivalAirport() + " ," + flight.getDepartureAirport() + " ," + flight.getArrivalTime() + " ," + flight.getDepartureTime());
       // println(depAirport + " " + destAirport);
        flights.add(flight);
      }
    }
    reader.close();
  }
  catch (IOException e) {
    println("Error reading data: " + e.getMessage());
  }
  return flights;
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
public String formatTime(String timeString) {
  if (timeString == null || timeString.isEmpty()) {
    return "Invalid time";
  }

  // Parse the input string into hours and minutes
  int time = Integer.parseInt(timeString);
  int hours = time / 100;
  int minutes = time % 100;

  // Format the time into HH:mm format
  String formattedTime = String.format("%02d:%02d", hours, minutes);
  return formattedTime;
}

void mouseWheel(MouseEvent event) {
  // Scroll through flight rectangles when mouse wheel is moved
  float e = event.getCount();
  for (FlightTicket ft : flightTickets) {
    ft.scroll(e);
  }
}


void drawFlightTickets(List<Flight> filteredFlights) {



  for (Flight flight : filteredFlights) {
    int x = 20;
    int y = flightTickets.size() * (rectHeight + rectSpacing) + 50;

    // Extract flight information
    int flightNumber = flight.getFlightNumber();
    String arrivalTime = flight.getArrivalTime();
    String departureTime = flight.getDepartureTime();
    String originCityName = flight.getOriginCityName();
    String destinationCityName = flight.getDestCityName();
    double cancelled = flight.getCancelled();
    String airline = flight.getAirline();

    flightTickets.add(new FlightTicket(x, y, width - 400, rectHeight, flightNumber, arrivalTime, departureTime, originCityName, destinationCityName, cancelled, airline));
  }
  for (int i = 0; i < filteredFlights.size(); i++) {
    FlightTicket ft = flightTickets.get(i);
    ft.display();
  }
}

void getFilteredMap ( List<Flight> filteredFlights){ // if this doesn't work try to return the hashmap -> i think the draw method is affecting the filtered flights
//int i = 0;
//while(i<1){
  for ( Flight flight : filteredFlights)
  {
    int date = flight.getDate();
    String originCity = flight.getOriginCityName();
    flightSchedule.addFlight(date, originCity);
    int hour = flight.getConvertedDeptHour();
    flightSchedule.addFlightByDepTime(hour, originCity);
  }
//}
}

void getFilteredFlights (List<Flight> flights)
{
String depTimeLow = "00.00";
String depTimeHigh = "23.59";
String arrTimeLow = "00.00";
String arrTimeHigh = "23.59";

int depTimeLowHour = Integer.parseInt(depTimeLow.substring(0,2)); // NEW
int depTimeHighHour = Integer.parseInt(depTimeHigh.substring(0,2)); //NEW
int arrTimeLowHour = Integer.parseInt(arrTimeLow.substring(0,2)); // NEW
int arrTimeHighHour = Integer.parseInt(arrTimeHigh.substring(0,2));// NEW
 
 //println(flights.size());
 for ( Flight flight : flights )
  {
    
   //println(dateLow + " " + dateHigh + " " + depAirport + " " + destAirport + " " + depTimeLowHour + " " + depTimeHighHour );
   int day = flight.getDate();
   //println(day);
   String depAir = flight.getDepartureAirport();
   String arrAir = flight.getArrivalAirport();
   int flightDepHour = flight.getConvertedDeptHour();
   int flightArrHour = flight.getConvertedArrHour();
  
   //&& flightDepHour >= depTimeLowHour && flightDepHour < depTimeHighHour
   // && flightArrHour >= arrTimeLowHour && flightArrHour < arrTimeHighHour
    if ( day >= dateLow && day <= dateHigh && depAirport == depAir && destAirport == arrAir )
    {
      flightSchedule.addFlight(day, depAir);
      flightSchedule.addFlightByDepTime(flightDepHour, depAir);
    }
  }
  printTimeTotal(flightSchedule);
}


void printTimeTotal(FlightSchedule sampleFs)  
{
  for ( Map.Entry<Integer, List<String>> entry : sampleFs.schedule.entrySet())
  {
            int keyIs = entry.getKey();
            List<String> value = entry.getValue();
            
            println("Key: " + keyIs + ", Value: " + value.size());
  }
}

//void printDepAndDest()
//{
//  println(depAirport + " and " + destAirport );
//}

// for each flight in the flights array list 
//Tget the departure time, arrial time, departure airport, arrival airport , etc...
