int startDate; // user chooses start date
int endDate;   // user chooses end date
int[] flightDates = new int[(endDate-startDate)+1];

void drawGraph(){
  int day = startDate;
  int i = 0;
  int xpos = 65;
  while(i<flightDates.length){
    for(Map.Entry entry : FlightSchedule.schedule.entrySet()){
      if(day<=endDate){
        String date = (String)entry.getKey();
        if(date.contains("/")){
          println(date);
          String mdy[] = split(date, '/');
          if(int(mdy[1])==day){
            flightDates[i] = flightSchedule.countFlightsForDate(date);
            day+=1;
            i+=1;
            labelDate(date, xpos);
            xpos+=70;
          }
        }
      }
    }
  }
  int x=50;
  for(int index=0; index<flightDates.length; index++){
    int size = flightDates[index];
    rect(x,475,30,-size);
    x+=70;
  }
}

void drawText(){
  PFont label = loadFont("Arial-BoldMT-18.vlw");
  textFont(label);
//  text("dates", 250, 495);
//  textAlign(CENTER);
  
  translate(18, 250);
  rotate(-HALF_PI);
  text("no. of flights", 0, 0);
  textAlign(CENTER);
}

void labelDate(String date, int x){
  PFont label = loadFont("Arial-BoldMT-10.vlw");
  textFont(label);
  text(date, x, 490);
  textAlign(CENTER);
}
