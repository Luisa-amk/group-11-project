


public class BarCharts{
  
  int min;
  int max;
  int graphType; // no encapsulation
  FlightSchedule  sampleFS;
  String arrivalAirport;
  String departureAirport;
//  int depTime;
//  int arrTime;
  
  BarCharts(int min, int max, FlightSchedule sampleFS, String departureAirport, String arrivalAirport)
  {
    this.min = min;
    this.max = max;
    //this.graphType = graphType;
    this.sampleFS = sampleFS;
    this.departureAirport = departureAirport;
    this.arrivalAirport = arrivalAirport;
  }
  
  public void drawGraph(int min, int max, int graphType, FlightSchedule sampleFS,String departureAirport, String arrivalAirport)
  {
    // don't need to pass anything , as the hashmap contains everything you need already ;
int maxX = 0;
int xpos = 200;
int xLabelPos = 0;
for ( int i = min; i <= max; i++)
{
    int flightCount = totalFlights(graphType, i, sampleFS);
    
    int cmpMax = flightCount; 
    int barWidth = 30; 
    int maxBarHeight = 150000; // larger this number , the taller the bars get
    
    
    int barHeight = (int) map(flightCount, 0, 18000, 0, maxBarHeight);// smaller 18000 -> smaller bars
    //int barHeight = flightsForDate;
    
    // Draw the bar
    fill(206, 212, 247);
    rect(xpos , height - barHeight - 30 - 30 - 70, barWidth, barHeight);
    
   
    fill(0);
    PFont labelFont = loadFont("Bahnschrift-17.vlw");    // change font 
    textFont(labelFont);
    textAlign(CENTER);
    textSize(12);
  
  if(graphType == FLIGHTS_BY_DATE || graphType == CANCEL_FLIGHT_GRAPH)
  text(Integer.toString(i), xpos + 10, height -10-30 - 70); // x axis labels, moving the labels from the corners to middle of bar, y pos of the labels
  else
  {
  pushMatrix();      //function saves coordinated 
  String xLabels = String.valueOf(i);
  textSize(15);
  translate(xpos, height - 10 -30 - 70);
  rotate(-PI/4);
  text(xLabels + ":00", 0, 0);
  popMatrix();      //restores coordinates 
  } 
    fill(0);
    textAlign(CENTER);
    textSize(9);
    text(Integer.toString(flightCount), xpos + 10, height - barHeight -40 -30 - 70); // the text for the representation of each bar 
   
    
    xpos += 30; // difference between increase in xpos and barWidth is 20, hence the 10pix gap
    
    if(cmpMax>maxX)
    maxX = cmpMax;  //for y axis  
    
 
  
}
 axisTitles(min, max, departureAirport, arrivalAirport, graphType, maxX);
println(maxX);
println(xLabelPos);

  }
  
  public int totalFlights(int graphType, int i, FlightSchedule sampleFS)
  {
    int totalFlights = 0;
    if(graphType == FLIGHTS_BY_DATE)
    totalFlights = sampleFS.countFlightsForDate(i); 
    else if (graphType == CANCEL_FLIGHT_GRAPH)
    totalFlights = sampleFS.countCancelledFlight(i);
    else if (graphType == FLIGHTS_BY_HOUR)
    totalFlights = sampleFS.countFlightsByDepTime(i);
    
    return totalFlights;
  }
  
  public void axisTitles(int min, int max, String departureAirport, String arrivalAirport, int graphType, int maxX)
  {
    PFont labelFont = loadFont("Bahnschrift-17.vlw");  
    textFont(labelFont);
    int yPos = maxX/2;
    textSize(15);
    String yLabel = "Total Flights";
    if(graphType == FLIGHTS_BY_DATE){
     String Title = "Scheduled Flights from " + departureAirport + " to " + arrivalAirport;
     text(Title, 400, 50);
     
     String xLabel = "Dates For January";     
     text(xLabel,600, 730);
     
     textAlign(CENTER);
     pushMatrix();      //function saves coordinated 
     translate(25, height / 2);
     rotate(-HALF_PI);
     text(yLabel, 0, 130);
     popMatrix();  
     //text(
     //text(
    }
    else if (graphType == CANCEL_FLIGHT_GRAPH)
    {
      String Title = "Total Cancelled Flights From " + departureAirport + " to " + arrivalAirport;
      text(Title, 400,50);
      
      String xLabel = "Dates";
      text(xLabel, 600, 730);
     
      
     textAlign(CENTER);
     pushMatrix();      //function saves coordinated 
     translate(25, height / 2);
     rotate(-HALF_PI);
     text(yLabel, 0, 200);
     popMatrix();  
     
    }
    else if ( graphType == FLIGHTS_BY_HOUR)
    {
      String title = "Scheduled Flights Per Hour from " + departureAirport + " to " + arrivalAirport;
      text(title,400,50);
      
      String xLabel = "Hour";
      text(xLabel, 600, 730);
      
      textAlign(CENTER);
     pushMatrix();      //function saves coordinated 
     translate(25, height / 2);
     rotate(-HALF_PI);
     text(yLabel, 0, 150);
     popMatrix(); 
      
    }
    else 
    text("Error generating Graph", 600, 730);
   
  }
  
  
  
}// end of class bracket

// make a method to print the correct, y axis, to adjust -> ask chatgpt 
// make a method to print the correct title in x axis and the y axis
