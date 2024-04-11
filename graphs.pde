void drawCanGr() {
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
    PFont labelFont = loadFont("ArialNarrow-17.vlw");    // change font
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


int aStartDate = 01;
int aEndDate = 31;
int[] airFlights = new int[(aEndDate-aStartDate)+1];
int maxAxis = 0;
int axisx;
PFont label1, label;
PFont label2;

void drawAirportGraph(FlightSchedule sampleFS) { // don't need to pass anything , as the hashmap contains everything you need already ;
  stroke(0);
  int day = aStartDate;
  int i = 0;
  // creating the array of total flights per date;
  while (i<airFlights.length) {
    for (Map.Entry<Integer, List<String>> entry : sampleFS.scheduleForAirport.entrySet()) {  // what should i reference  //explain this??
      if (day<=aEndDate) {
        int date = entry.getKey(); // this was handled in the flightsPerAirport
        if (date == day) {
          airFlights[i] = sampleFS.countFLightsToAirport(date); // explain this joanne?
          day++;
          i++;
        }
      }
    }
    //draw axis and print axis labels
  }
  int x=300;
  int xpos = 310;
  for (int index=0; index<airFlights.length; index++) {
    int size = airFlights[index];
    fill(bluegreen);
    rect(x, 675, 20, -size);
    x+=20;
    labelDate(index+1, xpos);
    xpos+=20;
  }

  for (int j = 0; j <= 600; j+=20)
  {
    yAxis(j);
  }

  drawText();
}


void drawText() {
  PFont label = loadFont("ArialNarrow-17.vlw");
  textFont(label);
  fill(0);
  text("flights from LAX for Jan", 500, 760);
  text("date", 600, 730);
  text("total flights", 100, 300);
}

void labelDate(int date, int x) {

  PFont label2 = loadFont("ArialNarrow-17.vlw");
  textFont(label2);

  fill(0);
  text(date, x, 690);
  //text("flights from LAX for Jan", 300, 650);
  // textAlign(CENTER);
}

void yAxis(int x )
{
  PFont label2 = loadFont("ArialNarrow-17.vlw");
  textFont(label2);
  fill(0);
  text(x, 270, 675-x);

  line(300, 675, 300, 675-x);
}

void drawDateBarChart() {

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
    int flightsForDate = flightSchedule.countFlightsForDate(day);


    int barWidth = 20;
    int maxBarHeight = 400;


    int barHeight = (int) map(flightsForDate, 0, 18000, 0, maxBarHeight);

    // Draw the bar
    fill(206, 212, 247);
    rect(xpos, height - barHeight - 30-20, barWidth, barHeight);


    fill(0);
    PFont labelFont = loadFont("ArialNarrow-17.vlw");    // change font
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



/// ULTIMATE FLGIHTS BY DATE GR
