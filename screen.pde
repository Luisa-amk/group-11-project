//class Screen {
//  color screenColor = color(255);
//  Screen() {
//    screenWidgets=new ArrayList();
//  }
//  void add(Widget w) {
//    screenWidgets.add(w);
//  }
//  void draw() {
//    textFont(stdFont);
//    background(screenColor);
//    textFont(stdFont);
//    textAlign(CENTER, CENTER);
//    textSize(17);
//    if (currentScreen == homePage)
//    {
//      if (invalidDate)
//      {
//        text("Invalid Date", width/2, 400);
//      }
//      text("Input Departure Airport:", 440, 60);
//      text("Input Destination Airport:", 930, 60);
//      text("Filter By: ", 175, 280);
//      filterByDropDown.draw();
//      screenWidgets.clear();  // NEW
//      screenWidgets.add(home);
//      screenWidgets.add(airport1);
//      screenWidgets.add(airport2);
//      screenWidgets.add(showMe);
//      screenWidgets.add(totalFlights);
//      screenWidgets.add(divertedAndCancelled);
//      screenWidgets.add(flightInfo);
//      screenWidgets.add(flightsByHour);
//      screenWidgets.add(pieChartWidget);
//      screenWidgets.add(otherChartWidget);

//      if (filterByDateOption)
//      {
//        screenWidgets.clear();  // NEW
//        text("to", width/2, 420);
//        homePage.add(date1);
//        homePage.add(date2);
//        screenWidgets.add(date1);
//        screenWidgets.add(date2);
//        cp5.remove("sliderRange");
//        sliderAdded = false;
//      } else if (filterByDepTimeOption)
//      {
//        screenWidgets.clear();  // NEW
//        text("to", width/2, 420);
//        homePage.add(depTime1);
//        homePage.add(depTime2);
//        screenWidgets.add(depTime1);
//        screenWidgets.add(depTime2);
//        cp5.remove("sliderRange");
//        sliderAdded = false;
//      } else if (filterByArrTimeOption)
//      {
//        screenWidgets.clear();  // NEW
//        text("to", width/2, 420);
//        homePage.add(arrTime1);
//        homePage.add(arrTime2);
//        screenWidgets.add(arrTime1);
//        screenWidgets.add(arrTime2);
//        cp5.remove("sliderRange");
//        sliderAdded = false;
//      } else if (filterByDistOption)
//      {
//        screenWidgets.clear();  // NEW
//         slider.draw();

//        // ADD SLIDER
//      }
//      screenWidgets.add(home);
//      screenWidgets.add(airport1);
//      screenWidgets.add(airport2);
//      screenWidgets.add(showMe);
//      screenWidgets.add(totalFlights);
//      screenWidgets.add(divertedAndCancelled);
//      screenWidgets.add(flightInfo);
//      screenWidgets.add(flightsByHour);
//      screenWidgets.add(pieChartWidget);
//      screenWidgets.add(otherChartWidget);
//    } else if (currentScreen == dateBarChart)
//    {
//      drawDateBarChart();
//      screenWidgets.clear();
//      screenWidgets.add(returnToHomePage);
//    } else if (currentScreen == dateAirport)
//    {
//      drawAirportGraph(flightSchedule);
//      screenWidgets.clear();
//      screenWidgets.add(returnToHomePage);
//    } else if (currentScreen == cancelBarChart)
//    {
//      drawCanGr();
//      screenWidgets.clear();
//      screenWidgets.add(returnToHomePage);
//    } else if (currentScreen == flightInfoScreen)
//    {
//      sortByDropDown.draw();
//      text("Sort By:", 1120, 120);
//      screenWidgets.clear();
//      screenWidgets.add(returnToHomePage);

//      avFlights = new Widget(20, 20, 350, 40, 5, "there are " + filteredFlights.size() + " available flights...", purple, stdFont, EVENT_HOME);
//      //filteredFlights = filterFlightsByAirports(flights, depAirport, destAirport);                           //change to userInput
//      filteredFlights = filterFlightsByDate(filteredFlights, dateLow, dateHigh);
//      filteredFlights = filterFlightsByDepTime(filteredFlights, depTimeLow, depTimeHigh);
//      filteredFlights =  filterFlightsByArrivalTime(filteredFlights, arrTimeLow, arrTimeHigh);

//     // filteredFlights = filterFlightsByDistance(filteredFlights, 190, 2000);


//      screenWidgets.add(avFlights);

//      if(sortByFlightNumber){
//        sortByFlightNumber(filteredFlights);
//        drawFlightTickets(filteredFlights);
//      }
//      else if (sortByAirline){

//        sortByAirline(filteredFlights);
//        drawFlightTickets(filteredFlights);
//      }
//      else if (sortByAirlineZA){
//        sortByAirlineZA(filteredFlights);
//        drawFlightTickets(filteredFlights);

//      }

//      else{
//        drawFlightTickets(filteredFlights);


//      }

//    }
//    else if( currentScreen == flightsPerHour){
//      screenWidgets.clear();
//     screenWidgets.add(returnToHomePage);           //draw bar charts in corresponding screen

//    }
//    else if (currentScreen == pieChart){
//       screenWidgets.clear();
//       screenWidgets.add(returnToHomePage);

//    }
//    else if (currentScreen == otherChart){
//       screenWidgets.clear();
//       screenWidgets.add(returnToHomePage);

//    }
//    for (int i = 0; i<screenWidgets.size(); i++) {
//      Widget aWidget = (Widget)screenWidgets.get(i);
//      aWidget.draw();
//    }
//  }
//  ArrayList getWidgets()
//  {
//    return screenWidgets;
//  }
//}

class Screen {
  boolean methodExecuted = true;
  int i = 1;
  color screenColor = color(255);
  Screen() {
    screenWidgets=new ArrayList();
  }
  void add(Widget w) {
    screenWidgets.add(w);
  }
  
  void draw() {
    textFont(stdFont);
    background(screenColor);
    textFont(stdFont);
    textAlign(CENTER, CENTER);
    textSize(17);
    if (currentScreen == homePage)
    {
      if (invalidDate)
      {
        text("Invalid Date", 900, 90);
      }
      text("Input Date Range (1-31)", 440, 60);
      text("Start Date: ", 650, 60);
      text("End Date: ", 650, 120);
      text("Filter By: ", 175, 280);
      filterByDropDown.draw();
      screenWidgets.clear();  // NEW
      screenWidgets.add(home);
      screenWidgets.add(date1);
      screenWidgets.add(date2);
      screenWidgets.add(showMe);
      screenWidgets.add(totalFlights);
      screenWidgets.add(divertedAndCancelled);
      screenWidgets.add(flightInfo);
      screenWidgets.add(flightsByHour);
      screenWidgets.add(pieChartWidget);
      //screenWidgets.add(otherChartWidget);

      if (filterByAirport)
      {
        screenWidgets.clear();
        text("Departure:", width/2 - 120, 350);
        text("Destination:", width/2 -125, 420);
        homePage.add(airport1);
        homePage.add(airport2);
        screenWidgets.add(airport1);
        screenWidgets.add(airport2);
        cp5.remove("sliderRange");
        sliderAdded = false;
      } else if (filterByDepTimeOption)
      {
        screenWidgets.clear();
        text("to", width/2, 420);
        homePage.add(depTime1);
        homePage.add(depTime2);
        screenWidgets.add(depTime1);
        screenWidgets.add(depTime2);
        cp5.remove("sliderRange");
        sliderAdded = false;
      } else if (filterByArrTimeOption)
      {
        screenWidgets.clear();
        text("to", width/2, 420);
        homePage.add(arrTime1);
        homePage.add(arrTime2);
        screenWidgets.add(arrTime1);
        screenWidgets.add(arrTime2);
        cp5.remove("sliderRange");
        sliderAdded = false;
      } else if (filterByDistOption)
      {
        screenWidgets.clear();
        slider.draw();

        // ADD SLIDER
      }
      screenWidgets.add(home);
      screenWidgets.add(date1);
      screenWidgets.add(date2);
      screenWidgets.add(showMe);
      screenWidgets.add(totalFlights);
      screenWidgets.add(divertedAndCancelled);
      screenWidgets.add(flightInfo);
      screenWidgets.add(flightsByHour);
      screenWidgets.add(pieChartWidget);
      //screenWidgets.add(otherChartWidget);
    } else if (currentScreen == dateBarChart) // IM WORKING HERE RN
    {
     
      BarCharts dateChart = new BarCharts();
      dateChart.drawGraph(dateLow,dateHigh,FLIGHTS_BY_DATE,flightsByDateMaxH,flightSchedule);
      //drawFlightsByDateGraph();   
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);
      cp5.remove("sliderRange");
      sliderAdded = false;
      
    
    } else if (currentScreen == dateAirport)
    {
      drawAirportGraph(flightSchedule);
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);
      cp5.remove("sliderRange");
      sliderAdded = false;
    } else if (currentScreen == cancelBarChart)
    {
      BarCharts cancChart = new BarCharts();
      cancChart.drawGraph(dateLow,dateHigh,CANCEL_FLIGHT_GRAPH,400,flightSchedule);
     // drawCanGr();
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);
      cp5.remove("sliderRange");
      sliderAdded = false;
    } else if (currentScreen == flightInfoScreen)
    {
      
      println(depAirport + " and  " + destAirport); 
      sortByDropDown.draw();
      text("Sort By:", 1120, 120);
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);
      cp5.remove("sliderRange");
      sliderAdded = false;

      avFlights = new Widget(20, 20, 350, 40, 5, "there are " + filteredFlights.size() + " available flights...", purple, stdFont, EVENT_HOME);
      //filteredFlights = filterFlightsByAirports(flights, depAirport, destAirport);                           //change to userInput
      filteredFlights = filterFlightsByDate(flights, dateLow, dateHigh);
      if (filterByAirport) {
        filteredFlights = filterFlightsByAirports(filteredFlights, depAirport, destAirport);
      }
      if (filterByDepTimeOption) {
        filteredFlights = filterFlightsByDepTime(filteredFlights, depTimeLow, depTimeHigh);
      }
      if ( filterByArrTimeOption) {
        filteredFlights =  filterFlightsByArrivalTime(filteredFlights, arrTimeLow, arrTimeHigh);
      }
      if (filterByDistOption) {
        filteredFlights = filterFlightsByDistance(filteredFlights, lowDistValue, highDistValue);
      }


      screenWidgets.add(avFlights);



      if (sortByFlightNumber) {
        sortByFlightNumber(filteredFlights);
        drawFlightTickets(filteredFlights);
      } else if (sortByAirline) {
        sortByAirline(filteredFlights);
        drawFlightTickets(filteredFlights);
      } else if (sortByAirlineZA) {
        sortByAirlineZA(filteredFlights);
        drawFlightTickets(filteredFlights);
      } else if (sortByFlightDistanceShortToLong) {
        sortByDistanceShortToLong(filteredFlights);
        drawFlightTickets(filteredFlights);
      } else if ( sortByFlightDistanceLongToShort) {
        sortByDistanceLongToShort(filteredFlights);
        drawFlightTickets(filteredFlights);
      } else {
        drawFlightTickets(filteredFlights);
      }
    } else if ( currentScreen == flightsPerHour) { // FLIGHTS PER HOUR MAKE IT WORK RWAN!!!
          
    BarCharts byHourGraph = new BarCharts (); 
    byHourGraph.drawGraph(depTimeLowHour, depTimeHighHour, FLIGHTS_BY_HOUR, flightsByHourMaxH, flightSchedule);
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);           //draw bar charts in corresponding screen
    } else if (currentScreen == pieChart) {
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);

      filteredFlights = filterFlightsByDate(flights, dateLow, dateHigh);
      if (filterByAirport) {
        filteredFlights = filterFlightsByAirports(filteredFlights, depAirport, destAirport);
      }
      if (filterByDepTimeOption) {
        filteredFlights = filterFlightsByDepTime(filteredFlights, depTimeLow, depTimeHigh);
      }
      if ( filterByArrTimeOption) {
        filteredFlights =  filterFlightsByArrivalTime(filteredFlights, arrTimeLow, arrTimeHigh);
      }
      if (filterByDistOption) {
        filteredFlights = filterFlightsByDistance(filteredFlights, lowDistValue, highDistValue);
      }
      drawPieChart(filteredFlights);
    } else if (currentScreen == otherChart) {
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);
    }
    for (int i = 0; i<screenWidgets.size(); i++) {
      Widget aWidget = (Widget)screenWidgets.get(i);
      aWidget.draw();
    }
  }
  ArrayList getWidgets()
  {
    return screenWidgets;
  }
  
  void drawByDateChart()
  {
     filteredFlights = filterFlightsByDate(flights, dateLow, dateHigh);
      if (filterByAirport) {
        filteredFlights = filterFlightsByAirports(filteredFlights, depAirport, destAirport);
      }
      if (filterByDepTimeOption) {
        filteredFlights = filterFlightsByDepTime(filteredFlights, depTimeLow, depTimeHigh);
      }
      if ( filterByArrTimeOption) {
        filteredFlights =  filterFlightsByArrivalTime(filteredFlights, arrTimeLow, arrTimeHigh);
      }
      if (filterByDistOption) {
        filteredFlights = filterFlightsByDistance(filteredFlights, lowDistValue, highDistValue);
      }  
      getFilteredMap(filteredFlights);
      
       depTimeLowHour = Integer.parseInt(depTimeLow.substring(0,2));
       depTimeHighHour = Integer.parseInt(depTimeHigh.substring(0,2));
      // getFilteredMap(filteredFlights);
      // drawFlightsByDateGraph();      
  }
}
