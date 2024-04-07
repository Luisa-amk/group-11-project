class Screen {
  color screenColor = color(255);
  Screen() {
    screenWidgets=new ArrayList();
  }
  void add(Widget w) {
    screenWidgets.add(w);
  }
  void draw() {
    background(screenColor);
    textFont(stdFont); 
    textAlign(CENTER, CENTER); 
    textSize(20);
    if (currentScreen == homePage)
    {
      if (invalidDate)
      {
        text("Invalid Date", width/2, 400);
      }
      text("Input Departure Airport:", 450, 60);
      text("Input Destination Airport:", 950, 60);
      text("Filter By: ", 175, 280);
      filterByDropDown.draw();
      screenWidgets.clear();  // NEW
      screenWidgets.add(home);
      screenWidgets.add(airport1);
      screenWidgets.add(airport2);
      screenWidgets.add(showMe);
      screenWidgets.add(totalFlights);
      screenWidgets.add(divertedAndCancelled);
      screenWidgets.add(flightInfo);

      if (filterByDateOption)
      {
        screenWidgets.clear();  // NEW
        text("to", width/2, 420);
        homePage.add(date1);
        homePage.add(date2);
        screenWidgets.add(date1);
        screenWidgets.add(date2);
      } else if (filterByDepTimeOption)
      {
        screenWidgets.clear();  // NEW
        text("to", width/2, 420);
        homePage.add(depTime1);
        homePage.add(depTime2);
        screenWidgets.add(depTime1);
        screenWidgets.add(depTime2);
      } else if (filterByArrTimeOption)
      {
        screenWidgets.clear();  // NEW
        text("to", width/2, 420);
        homePage.add(arrTime1);
        homePage.add(arrTime2);
        screenWidgets.add(arrTime1);
        screenWidgets.add(arrTime2);
      } else if (filterByDistOption)
      {
        screenWidgets.clear();  // NEW

        // ADD SLIDER

      }
      screenWidgets.add(home);
      screenWidgets.add(airport1);
      screenWidgets.add(airport2);
      screenWidgets.add(showMe);
      screenWidgets.add(totalFlights);
      screenWidgets.add(divertedAndCancelled);
      screenWidgets.add(flightInfo); 
    } 
    else if (currentScreen == dateBarChart)
    {
      drawBarChart();
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);
    } else if (currentScreen == dateAirport)
    {
      drawAirportGraph(flightSchedule);
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);
    } else if (currentScreen == cancelBarChart)
    {
      drawCanGr();
      screenWidgets.clear();
      screenWidgets.add(returnToHomePage);
    } else if (currentScreen == flightInfoScreen)
    {
      sortByDropDown.draw();
      text("Sort By:", 1120, 120);
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
}
