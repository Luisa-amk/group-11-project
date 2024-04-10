void drawPieChart(List<Flight> filteredFlights) {
  drawTitle();
  int totalFlights = filteredFlights.size();
  int onScheduleCount = 0;
  int divertedCount = 0;
  int cancelledCount = 0;
  color sageGreen = color(115, 183, 108);
  color orange = color(230, 155, 105);
  color softRed = color(204, 95, 95);

  // Count the number of on schedule, diverted, and cancelled flights
  for (Flight flight : filteredFlights) {
    if ((int) flight.getCancelled() == 1) {
      cancelledCount++;
    } else if ((int) flight.getDiverted() == 1) {
      divertedCount++;
    } else {
      onScheduleCount++;
    }
  }

  // Calculate angles for each category
  float divertedAngle = radians(map(divertedCount, 0, totalFlights, 0, 360));
  float cancelledAngle = radians(map(cancelledCount, 0, totalFlights, 0, 360));
  float onScheduleAngle = radians(map(onScheduleCount, 0, totalFlights, 0, 360));

  // Draw pie chart
  background(255);
  stroke(0);
  float lastAngle = 0;
  fill(sageGreen); 
  arc(width / 2, height / 2, 300, 300, lastAngle, lastAngle + onScheduleAngle);
  lastAngle += onScheduleAngle;

  fill(orange); // Yellow for diverted
  arc(width / 2, height / 2, 300, 300, lastAngle, lastAngle + divertedAngle);
  lastAngle += divertedAngle;

  fill(softRed); // Red for cancelled
  arc(width / 2, height / 2, 300, 300, lastAngle, lastAngle + cancelledAngle);

  // Legend
  textAlign(LEFT, TOP);
  fill(sageGreen); 
  textSize(17);
  text("On Schedule Flights: " + onScheduleCount, 20, 60);
  
  fill(orange);
  textSize(17);
  text("Diverted Flights: " + divertedCount, 20, 40);

  fill(softRed); 
  textSize(17);
  text("Cancelled Flights: " + cancelledCount, 20, 20);
  
  
}
void drawTitle() {
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(255);
  text("Departure Times", width / 2, 60);
}
