

int[] totalFlights = new int[(high-low)+1];
void drawFilteredGraph(FlightSchedule sampleFS){ // don't need to pass anything , as the hashmap contains everything you need already ;
  int day = low;
  int i = 0;
 // creating the array of total flights per date;
  while(i<totalFlights.length){
    for(Map.Entry<Integer, List<String>> entry : sampleFS.schedule.entrySet()){  // what should i reference  //explain this??
      if(day<=high){
        int date = entry.getKey(); // this was handled in the flightsPerAirport 
  // got rid of this if statement        
            totalFlights[i] = sampleFS.countFlightsForDate(date); // maybe implement a adjust depending on the schedule we are passing
            day++;
            i++;         
                
      }
    }
    //draw axis and print axis labels 
  }
  int x=300;
  int xpos = 310;
  for(int index=0; index<totalFlights.length; index++){
    int size = totalFlights[index];
    fill(bluegreen);
    int barheight = size;
    rect(x,675,20,-(barheight)); 
    int textHeight = 675 - barheight - 20;
    
    fill(0);
    textAlign(CENTER);   
    PFont label3 = loadFont("BookAntiqua-15.vlw");   
    textFont(label3);
    text(size, x+10, textHeight); 
     // text(Integer.toString(flightsForDate), xpos + 10, height - barHeight - 40 - 20);
    // height - initial - barheight - a lil more 
    x+=20;
    labelDates(index+1, xpos);
    xpos+=20;
   
  }
  
   for (int j = 0; j <= 600; j+=20)
    {
      yAxis1(j);
    }
    
    filteredText();
}


void filteredText(){
 PFont label = loadFont("AgencyFB-Bold-18.vlw");
 textFont(label);
 fill(0);
 text("flights from LAX for Jan", 500, 760); // adjust the title 
 text("date", 600, 730);
 text("total flights", 100, 300);

}

void labelDates(int date, int x){
 
  PFont label2 = loadFont("AgencyFB-Bold-10.vlw");
  textFont(label2);
  
  fill(0);
  text(date, x, 690);
 // text("flights from LAX for Jan", 300, 650);
  //textAlign(CENTER);
}

void yAxis1(int x )
{
  PFont label2 = loadFont("AgencyFB-Bold-10.vlw");
  textFont(label2);
  fill(0);
  text(x,270,675-x);
  
  line(300,675, 300, 675-x);
}


// by hour graph 


int[] byHourFlights = new int[(highDep-lowDep)];
void showByHourDepBarChart(FlightSchedule sampleFS){ // don't need to pass anything , as the hashmap contains everything you need already ;
  int hour = low;
  int i =0;
  int xOrigin =300;
  int xpos = 310;
  int x = 300;
 // creating the array of total flights per date;
  
    for(Map.Entry<Integer, List<String>> entry : sampleFS.scheduleFlightsByDep.entrySet()){  // what should i reference  //explain this??
      if(hour<highDep){
           int hoursNotNull = entry.getKey(); // this was handled in the flightsPerAirport 
  // got rid of this if statement 
            int totalFlightsPerTime = sampleFS.countFlightsByDepTime(hoursNotNull);
            println(totalFlightsPerTime);
            fill(bluegreen);
            int barHeight = totalFlightsPerTime;
            int barPosition = xOrigin + 25*hoursNotNull;
            rect(barPosition,675,20,-(barHeight)); // creeating the bar chart 
            int textHeight = 675 - barHeight - 20;
            //byHourFlights[i] = mytotalFlights;  // maybe implement a adjust depending on them schedule we are passing
            hour++;
            fill(0);
            
           textAlign(CENTER);   
           //PFont label3 = loadFont("BookAntiqua-15.vlw");    
           PFont label3 = loadFont("Bahnschrift-17.vlw");          
           textFont(label3);
           textSize(9);
           text(barHeight, barPosition+10, textHeight); 
           // text(Integer.toString(flightsForDate), xpos + 10, height - barHeight - 40 - 20);
           // height - initial - barheight - a lil more 
           //x+=60;
           labelXAxis(hoursNotNull, barPosition);
           //xpos+=26;
                  
                
      }
    }
    //draw axis and print axis labels 
  // e.g if key is 5, from position x -> xposition = xorigin + width*key) 
   for (int j = 0; j <= 600; j+=20)
    {
      yAxis2(j);
    }
    
    titleTotalPerHour();
}

 
void titleTotalPerHour(){ //  need diff method for titling 
 PFont label = loadFont("AgencyFB-Bold-18.vlw");
 textFont(label);
 fill(0);
 String titleFlightsByHour = " Total Flights Departing from "+ inputDepAirport + " between " + lowDep + ":00 and " + highDep + ":00";
 text(titleFlightsByHour, 500, 760); // adjust the title 
 text("hour", 600, 730);
 text("total flights", 100, 300);

}

void labelXAxis(int hours, int x){ // don't really need this method 
 
  PFont label2 = loadFont("Bahnschrift-10.vlw");
  textFont(label2);
// to label x axis  
  fill(0);
  text(hours, x, 690);
 // text("flights from LAX for Jan", 300, 650);
  //textAlign(CENTER);
}

void yAxis2(int x )
{
  PFont label2 = loadFont("Bahnschrift-10.vlw");
  textFont(label2);
  fill(0);
  text(x,270,675-x);
  
  line(300,675, 300, 675-x);
}
