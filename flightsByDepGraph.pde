

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
    textSize(9);
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
