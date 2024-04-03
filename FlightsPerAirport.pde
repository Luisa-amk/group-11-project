import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
int screenx ;

FlightSchedule flightSchedule;
int count = 0;

//hardcoded date variables
int low = 1;  // hardcoded date
int high = 31; // hardcoded date
String inputLowArr = "00:00";  // hardcoded userinput -> lower arrival range                  //change according to userinput 
String inputHighArr = "23:00"; // hardcoded userinput -> lower arrival range 
String inputLowDept  = "00:00"; // hardcoded userinput -> lower departure range
String inputHighDept = "23:00";  // hardcoded userinput -> higher departure range
String inputDepAirport = "JFK"; // hardcoded userinput -> departureAirport
String inputArrAirport = "LAX"; // hardcoded userinput -> arrivalAirport



void setup() {
  fullScreen();
  //size ( 200, 200);
  background(255);
  flightSchedule = new FlightSchedule();
  readData("flights-full.csv");
  printFlightsPerDay();  // == printFilteredFlights
  drawFilteredGraph(flightSchedule);
  // printFlightsForAirport();
 // printFlightsByDepTime();
 // printFilteredFlights();
  
 
}

void draw() {
  //UI design code 
  
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
    int i = 0;
    if ( i >=5)
    break;
    
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
      
      
      // variables needed for filtering 
      String city = processedParts.get(4); // origin city 
      String originAirport = processedParts.get(3); // e.g JFK
      String arrAirport = processedParts.get(7); // .e.g. LAX      
      String depTime = processedParts.get(12);  // e.g. actual dept Time
      String arrTime = processedParts.get(14);  // e.g. actual arrival Time
      //println( depTime + " "+ arrTime);
      int lowDep = Integer.parseInt(inputLowDept.substring(0,2)); // low end of user input range for departures
      int highDep = Integer.parseInt(inputHighDept.substring(0,2)); // high end of use input range for departures 
      int lowArr = Integer.parseInt(inputLowArr.substring(0,2)); // low end of user input range for departures 
      int highArr = Integer.parseInt(inputHighArr.substring(0,2)); // high end of user input range for departures 
      
      int flightDepTime = Integer.parseInt(depTime.substring(0,2)); // int actual departure time
      int flightArrTime = Integer.parseInt(arrTime.substring(0,2)); // int actual departure time 
      
      //int inputEndDeptLength = inputHighDept.length();
      //int endDeptRange = Integer.parseInt(inputHighDept.substring(inputEndDeptLength-2)); // e.g 23:00 -> give me 00 , but not beyond
      
      //int inputEndArrLength = inputHighArr.length();
      //int endArrRange = Integer.parseInt(inputHighArr.substring(inputEndArrLength-2)); -> for range e.g. 00:00 - 19:00 , i want to include 19:00
          
      if((inputDepAirport.equals(originAirport) && inputArrAirport.equals(arrAirport))&& (day>=low && day<=high) && ((flightDepTime >= lowDep && flightDepTime<highDep)
) && ((flightArrTime >= lowArr && flightArrTime<highArr))) {   
          
            flightSchedule.addFlight(day,city);
            flightSchedule.addFlightByDepTime(flightDepTime, city);    
           
        }
        
                
    //  if( day == 1 && originAirport.equals("JFK") && arrAirport.equals(inputArrAirport))  // uncomment to check value per day
    //{
    //  count++;
    //  println("Flights from" +  originAirport + " to " + arrAirport + "on " + day + "is now" + count );
    //}
    //for (String processedPart : processedParts) {          //uncomment if you need to check array contents 
    //  println(processedParts + "\n");
    }  
}

      
  }



void printFlightsPerDay() { // in use for total flights 
  for (int i = low; i <= high; i++) {
    String date = String.format("01/%02d/2022", i);
    int numFlights = flightSchedule.countFlightsForDate(i);
    println("Number of flights on " + date + ": " + numFlights);
  }
}
void printFlightsForAirport(){ // not currently functional 
  for (int i = low; i <= high; i++) {
    String airport = "LAX";            // will change according to user input 
    String date = String.format("01/%02d/2022", i);
    int numFlights = flightSchedule.countFLightsToAirport(i);
   // println("Number of flights from "+ airport+ " on " + date + ": " + numFlights);    
  }
 // drawAirportGraph(flightSchedule);  // drawing the graph passing the hashMap
  //drawText(); 
}
