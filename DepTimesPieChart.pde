String[] lines; // Array to store lines from the file
int total = 0; // Total count
int[] aggregatedData = new int[8]; // Aggregated data array
String[] labels = {"1:00AM-3:00AM", "3:01-6:00AM", "6:01-9:00AM", "9:01-12:00AM", "12:01PM-3:00PM", "3:01PM-6:00PM", "6:01PM-9:00PM", "9:01PM-12:59"}; // Labels for the data
color[] colors = new color[8]; // Colors for the segments

void setup() {
  size(800, 600);
  background(200, 180, 255); // Light shade of purple background
  
  // Load data from file
  lines = loadStrings("flights_full.csv"); // Replace "flights_full.csv" with your file name
  
  // Aggregate data
  aggregateData();
  
  // Initialize colors for segments
  for (int i = 0; i < colors.length; i++) {
    colors[i] = color(random(255), random(255), random(255)); // Random colors for demonstration
  }
  
  // Draw title
  drawTitle();
  
  // Draw pie chart
  drawPieChart();
}

void drawTitle() {
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(255);
  text("Departure Times", width / 2, 60);
}

void aggregateData() {
  for (int i = 0; i < lines.length; i++) {
    String[] values = split(lines[i], ','); // Split each line by comma
    if (values.length > 12) {
      int value = int(values[12]); // Assuming the numerical value is in the 13th column
      total += value;
      // Aggregate data into 8 categories
      int index = i % aggregatedData.length; // Wrap around index
      aggregatedData[index] += value;
    }
  }
  
  // Print aggregated data for debugging
  for (int i = 0; i < aggregatedData.length; i++) {
    println("Aggregated data[" + i + "]: " + aggregatedData[i]);
  }
}

void drawPieChart() {
  float startAngle = 0;
  float endAngle = 0;
  
  textSize(16); // Set the font size for labels
  
  for (int i = 0; i < aggregatedData.length; i++) {
    float angle = map(aggregatedData[i], 0, total, 0, TWO_PI); // Calculate angle for each segment
    
    fill(colors[i]); // Set segment color
    endAngle = startAngle + angle; // Calculate end angle
    
    // Draw segment
    arc(width/2, height/2, 300, 300, startAngle, endAngle, PIE);
    
    // Calculate and display label position
    float labelAngle = startAngle + angle/2;
    float labelX = width/2 + 150 * cos(labelAngle);
    float labelY = height/2 + 150 * sin(labelAngle);
    textAlign(CENTER, CENTER);
    fill(0);
    text(labels[i], labelX, labelY);
    
    // Update start angle for next segment
    startAngle = endAngle;
  }
}
