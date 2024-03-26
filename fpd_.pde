import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


FlightSchedule flightSchedule;
int low = 1;
int high = 31;

void setup() {
  size(1000, 500);
  flightSchedule = new FlightSchedule();
  readData("flights-fullmonth");
  printFlightsPerDay();
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
    }
    //for (String processedPart : processedParts) {          //uncomment if you need to check array contents 
    //  println(processedParts + "\n");
    //}
  }
}

void printFlightsPerDay() {
  for (int i = low; i <= high; i++) {
    String date = String.format("01/%02d/2022", i);
    int numFlights = flightSchedule.countFlightsForDate(i);
    println("Number of flights on " + date + ": " + numFlights);
  }
}

void drawGraph() {
  
}
