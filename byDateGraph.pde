public void drawFlightsByDateGraph()
  {
  //int j = 0;
  //while (j <1){   
    
    // don't need to pass anything , as the hashmap contains everything you need already ;
int maxX = 0;
int xpos = 200;
int xLabelPos = 0;
int maxBarHeight = 0;
int axisHeight = 0;
int xposAdd;
for ( int i = dateLow; i <= dateHigh; i++)
{
    int flightCount = flightSchedule.countFlightsForDate(i); 
    //println(flightCount);
    int cmpMax = flightCount; 
    int barWidth = 30; 
    maxBarHeight = 400; // larger this number , the taller the bars get 150,000
    
    
    int barHeight = (int) map(flightCount, 0, 18000, 0, maxBarHeight);// smaller 18000 -> smaller bars
    //int barHeight = flightsForDate;
    
    // Draw the bar
    fill(206, 212, 247);
    rect(xpos , height - barHeight - 30 - 30 - 70, barWidth, barHeight );
    
   
    fill(0);
    PFont labelFont = loadFont("UDDigiKyokashoN-R-20.vlw");    // change font 
    textFont(labelFont);
    textAlign(CENTER);
    textSize(12);
  
  xposAdd = xpos + 10;
  
  text(Integer.toString(i), xposAdd, height -10-30 - 70); // x axis labels, moving the labels from the corners to middle of bar, y pos of the labels

    fill(0);
    textAlign(CENTER);
    textSize(9);
    text(Integer.toString(flightCount), xposAdd, height - barHeight -40 -30 - 70); // the text for the representation of each bar 
   
    
    xpos += 30; // difference between increase in xpos and barWidth is 20, hence the 10pix gap
    
    if(cmpMax>maxX)
    maxX = cmpMax;  //for y axis  
    
    stroke(0);
    
   
    
 
}
 PFont labelFont = loadFont("UDDigiKyokashoN-R-17.vlw");  
    textFont(labelFont);
    int yPos = maxX/2;
    textSize(15);
    String yLabel = "Total Flights";
  
     String Title = "Scheduled Flights from " + depAirport + " to " + destAirport;
     text(Title, 400, 50);
     
     String xLabel = "Dates For January";     
     text(xLabel,600, 730);
     
     textAlign(CENTER);
     pushMatrix();      //function saves coordinated 
     translate(25, height / 2);
     rotate(-HALF_PI);
     text(yLabel, 0, 130);
     popMatrix();
 //j++;
  //}
  
  }
  
  
  
  /////
  
 
void showByDate(FlightSchedule sampleFS){ // don't need to pass anything , as the hashmap contains everything you need already ;
  int day = dateLow;
  int i =0;
  int xOrigin =300;
  int xpos = 310;
  int x = 300;
  int j = 0;
 // creating the array of total flights per date;
  
    for(Map.Entry<Integer, List<String>> entry : sampleFS.schedule.entrySet()){  // what should i reference  //explain this??
      if(day<dateHigh){
           int hoursNotNull = entry.getKey(); // this was handled in the flightsPerAirport 
  // got rid of this if statement 
            int totalFlightsPerTime = sampleFS.countFlightsByDepTime(hoursNotNull);
            //println(totalFlightsPerTime);
            fill(bluegreen);
            int barHeight = totalFlightsPerTime;
            int barPosition = xOrigin + 25*hoursNotNull;
            rect(barPosition,675,20,-(barHeight)); // creeating the bar chart 
            int textHeight = 675 - barHeight - 20;
            //byHourFlights[i] = mytotalFlights;  // maybe implement a adjust depending on them schedule we are passing
            day++;
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
         //  labelXAxis(hoursNotNull, barPosition);
           //xpos+=26;
                  
                
      }
       PFont labelFont = loadFont("Bahnschrift-17.vlw");  
    textFont(labelFont);
  //  int yPos = maxX/2;
    textSize(15);
    String yLabel = "Total Flights";
  
     String Title = "Scheduled Flights from " + depAirport + " to " + destAirport;
     text(Title, 400, 50);
     
     String xLabel = "Dates For January";     
     text(xLabel,600, 730);
     
     textAlign(CENTER);
     pushMatrix();      //function saves coordinated 
     translate(25, height / 2);
     rotate(-HALF_PI);
     text(yLabel, 0, 130);
     popMatrix();
     i++;
     
    }
 
    //draw axis and print axis labels 
  // e.g if key is 5, from position x -> xposition = xorigin + width*key) 
   //for (int j = 0; j <= 600; j+=20)
   // {
   //   yAxis2(j);
   // }
    
  //  titleTotalPerHour();
}
  
