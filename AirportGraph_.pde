int aStartDate = 01;
int aEndDate = 31; 
int[] airFlights = new int[(aEndDate-aStartDate)+1];
int maxAxis = 0;
int axisx;
PFont label1, label;
PFont label2;

void drawAirportGraph(FlightSchedule sampleFS){ // don't need to pass anything , as the hashmap contains everything you need already ;
  int day = aStartDate;
  int i = 0;
 // creating the array of total flights per date;
  while(i<airFlights.length){
    for(Map.Entry<Integer, List<String>> entry : sampleFS.scheduleForAirport.entrySet()){  // what should i reference  //explain this??
      if(day<=aEndDate){
        int date = entry.getKey(); // this was handled in the flightsPerAirport 
          if(date == day){
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
  for(int index=0; index<airFlights.length; index++){
    int size = airFlights[index];
    fill(bluegreen);
    rect(x,675,20,-size); 
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


void drawText(){
 PFont label = loadFont("AndaleMono-17.vlw");
 textFont(label);
 fill(0);
 text("flights from LAX for Jan", 500, 760);
 text("date", 600, 730);
 text("total flights", 100, 300);

}

void labelDate(int date, int x){
 
  PFont label2 = loadFont("AndaleMono-17.vlw");
  textFont(label2);
  
  fill(0);
  text(date, x, 690);
  //text("flights from LAX for Jan", 300, 650);
 // textAlign(CENTER);
}

void yAxis(int x )
{
  PFont label2 = loadFont("AndaleMono-17.vlw");
  textFont(label2);
  fill(0);
  text(x,270,675-x);
  
  line(300,675, 300, 675-x);
}
