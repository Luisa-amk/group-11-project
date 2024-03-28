void drawCancelChart(FlightSchedule flightSched) {
  int day=aStartDate;
  int i=0;
  while(i<airFlights.length){
    for(Map.Entry<Integer, List<String>> entry : flightSched.cancelledFlight.entrySet()){
      if(day<=aEndDate){
        int date = entry.getKey();
        if(date == day){
          airFlights[i] = flightSched.countCancelledFlight(date);
          day++;
          i++;
        }
      }
    }
  }
  int x=300;
  int xpos=310;
  for(int index=0; index<airFlights.length; index++){
    int size = airFlights[index];
    fill(bluegreen);
    rect(x,675,20,-size);
    x+=20;
    labelDate(index+1, xpos);
    xpos+=20;
  }
}  //  cancelled fligh bar chart code here

void drawCanGr(){
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
    int flightsForDate = flightSchedule.countCancelledFlight(day);
    
    
    int barWidth = 20; 
    int maxBarHeight = 400; 
    
    
    int barHeight = (int) map(flightsForDate, 0, 18000, 0, maxBarHeight);
    
    // Draw the bar
    fill(206, 212, 247);
    rect(xpos, height - barHeight - 30-20, barWidth, barHeight);
    
   
    fill(0);
    PFont labelFont = loadFont("Arial-BoldMT-20.vlw");    // change font 
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
