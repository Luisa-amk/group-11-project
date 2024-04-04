void drawCanGr(){
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
    int flightsForDate = flightSchedule.countCancelledFlight(day);
    
    
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
