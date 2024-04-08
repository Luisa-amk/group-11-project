Table table; // Variable to hold the flight data

void setup() {
  size(500, 400);
  background(255); // Set background to black
  
  // Load flight data from CSV file
  table = loadTable("flights_full.csv", "header");

  // Variables to store counts
  int cancelledCount = 0;
  int divertedCount = 0;
  int onScheduleCount = 0;

  // Iterate through each row of the table
  for (TableRow row : table.rows()) {
    // Get the value of the 'CANCELLED' column (1 for cancelled, 0 for not cancelled)
    int cancelled = row.getInt("CANCELLED");
    // Get the value of the 'DIVERTED' column (1 for diverted, 0 for not diverted)
    int diverted = row.getInt("DIVERTED");
    
    // If cancelled, increment cancelled count
    if (cancelled == 1) {
      cancelledCount++;
    } 
    // If diverted, increment diverted count
    else if (diverted == 1) {
      divertedCount++;
    } 
    // Otherwise, flight is on schedule
    else {
      onScheduleCount++;
    }
  }
  
  // Draw pie chart
  float totalFlights = cancelledCount + divertedCount + onScheduleCount;
  float cancelledAngle = radians(map(cancelledCount, 0, totalFlights, 0, 360));
  float divertedAngle = radians(map(divertedCount, 0, totalFlights, 0, 360));
  float onScheduleAngle = radians(map(onScheduleCount, 0, totalFlights, 0, 360));
  
  // Draw cancelled slice
  fill(255, 0, 0); // Blood Red
  arc(width/2, height/2, 300, 300, 0, cancelledAngle, PIE);
  
  // Draw diverted slice
  fill(0, 255, 255); // Aquamarine
  arc(width/2, height/2, 300, 300, cancelledAngle, cancelledAngle + divertedAngle, PIE);
  
  // Draw on-schedule slice
  fill(144, 238, 144); // Sage Green
  arc(width/2, height/2, 300, 300, cancelledAngle + divertedAngle, cancelledAngle + divertedAngle + onScheduleAngle, PIE);
  
  // Legend
  fill(255, 0, 0); // Blood Red
  textSize(17);
  text("Cancelled Flights: " + cancelledCount, 20, 20);
  
  fill(255, 0, 0); // Blood Red
 
  
  fill(144, 238, 144); // Sage Green
  textSize(17);
  text("On Schedule Flights: " + onScheduleCount, 20, 40);
  
  fill(144, 238, 144); // Sage Green
}
