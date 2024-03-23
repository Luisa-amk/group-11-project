import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

FlightSchedule flightSchedule;
//PFont label = loadFont("Arial-BoldMT-18.vlw");

void setup() {
  size(500, 500);
  flightSchedule = new FlightSchedule();
  readData("flights2k.csv");  //<>//
  printFlightsPerDay();
}

void draw() {
  background(0);
  drawGraph();
  drawText();
}

void readData(String fileName) {
  String[] lines = loadStrings(fileName);
  if (lines != null) {
    processData(lines); 
  } 
}

void processData(String[] lines) {  //code needs to be updated to include updated class 
  for (String line : lines) {
    
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
        jointPart += "," + part;
        if (part.endsWith("\"")) {
          withinQuotes = false;
          processedParts.add(jointPart.replaceAll("\"", ""));
        }
      } else {
        if (part.isEmpty()) {
          part = "-1";
        }
        processedParts.add(part);
      }
    }
    if (processedParts.size() >= 18) {
      String date = processedParts.get(0);
      String city = processedParts.get(4); // Assuming city is at index 4
      Flight flight = new Flight(city);
      flightSchedule.addFlight(date, flight);
    }

    //for (String processedPart : processedParts) {
    //  println(processedParts);
    //}
  }
}

void printFlightsPerDay() {
  for (int i = 1; i <= 31; i++) {        // swap i for low and i<= high for the data range input  
    String date = String.format("01/%02d/2022", i);
    int numFlights = flightSchedule.countFlightsForDate(date);
    println("Number of flights on " + date + ": " + numFlights);
  }
}
