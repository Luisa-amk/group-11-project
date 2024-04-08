// data handling for the sorting and filtering, printing out the info as 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
int screenx ;

FlightSchedule flightSchedule;
String[] lines;

//hardcoded date variables
List<Flight> flights;  // SAT declare the flights array list  
int low = 1;  // hardcoded date
int high = 31; // hardcoded date
String inputLowArr = "00:00";  // hardcoded userinput -> lower arrival range                  //change according to userinput 
String inputHighArr = "23:00"; // hardcoded userinput -> lower arrival range 
String inputLowDept  = "04:00"; // hardcoded userinput -> lower departure range
String inputHighDept = "19:00";  // hardcoded userinput -> higher departure range
String inputDepAirport = "LAX"; // hardcoded userinput -> departureAirport
String inputArrAirport = "ORD"; // hardcoded userinput -> arrivalAirport
//int lowDep = 0;    // inputLowDep String converted to int 
//int highDep = 0 ; // inputLowDep String converted to int
//int lowArr = 0 ;
//int highArr = 0 ;
String city = ""; 
String originAirport ="";
String arrAirport = ""; 
String depTime = "";
String arrTime = "";
      //println( depTime + " "+ arrTime);
int flightDepTime = 0;; 
int flightArrTime = 0;

int lowDep = Integer.parseInt(inputLowDept.substring(0,2)); // low end of user input range for departures  
int highDep = Integer.parseInt(inputHighDept.substring(0,2)); // high end of use input range for departures 
int lowArr = Integer.parseInt(inputLowArr.substring(0,2)); // low end of user input range for departures 
int highArr = Integer.parseInt(inputHighArr.substring(0,2)); // high end of user input range for departures 
final int FLIGHTS_BY_DATE = 1;  // 2000
final int CANCEL_FLIGHT_GRAPH = 2; // 200000
final int FLIGHTS_BY_HOUR = 3; // 70000 or 150000


void setup() {
 fullScreen();
  //size ( 200, 200);
  background(255);
  flightSchedule = new FlightSchedule();
  flights = new ArrayList<>();           // Initialize the flights list
  readData("flights-full.csv");
  BarCharts flightsByDateGraph = new BarCharts (low, high,flightSchedule, inputDepAirport, inputArrAirport); // create bar chart object
  flightsByDateGraph.drawGraph(lowDep, highDep, FLIGHTS_BY_HOUR, flightSchedule, inputDepAirport, inputArrAirport); // adjust the first 3 as needed
  //printFlightsPerDay(flightSchedule);
  //drawFilteredGraph(flightSchedule);
  printTimeTotal(flightSchedule);
  //showByHourDepBarChart(); // something in this method is printing, get rid of it 
  //test();
 
}

void draw() {
  //UI design code 
  
}

void test(){
  for (int i = 0; i <= 31; i++)
  {
     String endFinalHourLabel = ":00";
      String finalHourLabel = "";
      String hourLabel = String.valueOf(i);
      if(i==0)
       finalHourLabel = "00:00";
      else if (i>0 && i<10)
       finalHourLabel = "0"+hourLabel +endFinalHourLabel;
      else
       finalHourLabel = hourLabel + endFinalHourLabel;
       
       println(finalHourLabel);
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
 
    //int i = 0;
    //if ( i >=5)
   // break;
    
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
      int flightDepTime = Integer.parseInt(depTime.substring(0,2)); // int actual departure time, just taking the first two
      int flightArrTime = Integer.parseInt(arrTime.substring(0,2)); // int actual departure time 
      
     
        // filling the cancelled hashmap
       
          
          // filling the filtered list ( using the total hashmap)
      if((inputDepAirport.equals(originAirport) && inputArrAirport.equals(arrAirport))&& (day>=low && day<=high) && ((flightDepTime >= lowDep && flightDepTime<highDep)
) && ((flightArrTime >= lowArr && flightArrTime<highArr))) {    // include && !cancelled 

          
           // println(flightDepTime + " " + lowDep + " " + highDep);
             flightSchedule.addFlight(day,city);
            flightSchedule.addFlightByDepTime(flightDepTime, city);
           // flightSchedule.addFlightByDepTime(flightDepTime, city);
           
        }
        
          String cancelled = processedParts.get(15);
       if (cancelled.equals("1.00")) {
       flightSchedule.addCancelledFlight(day,cancelled);            
      }
        
                
    //  if( day == 1 && originAirport.equals("JFK") && arrAirport.equals(inputArrAirport))  // uncomment to check value per day
    //{
    //  count++;
    //  println("Flights from" +  originAirport + " to " + arrAirport + "on " + day + "is now" + count );
    //}
    //for (String processedPart : processedParts) {          //uncomment if you need to check array contents 
    //  println(processedParts + "\n");
    
    }
    //checkTimeHashmap(flightSchedule,highDep, lowDep);
    
}

    
  }



void printFlightsPerDay(FlightSchedule flightSchedule) { // in use for total flights  // add and pass the parameter of the 
  for (int i = low; i <= high; i++) {
    String date = String.format("01/%02d/2022", i);
    int numFlights = flightSchedule.countFlightsForDate(i);
    println("Number of flights on " + date + ": " + numFlights);
  }
}
//void printFlightsForAirport(){ // not currently functional 
//  for (int i = low; i <= high; i++) {
//    String airport = "LAX";            // will change according to user input 
//    String date = String.format("01/%02d/2022", i);
//    int numFlights = flightSchedule.coutFlightsToAirport(i);
   // println("Number of flights from "+ airport+ " on " + date + ": " + numFlights);    
//  }
 // drawAirportGraph(flightSchedule);  // drawing the graph passing the hashMap
  //drawText(); 
//}

void printTimeTotal(FlightSchedule sampleFs)  
{
  for ( Map.Entry<Integer, List<String>> entry : sampleFs.scheduleFlightsByDep.entrySet())
  {
            int keyIs = entry.getKey();
            List<String> value = entry.getValue();
            
            System.out.println("Key: " + keyIs + ", Value: " + value.size());
  }
}

// repeat above method to print out total cancelled flights for this date range ( not necessary right now )
