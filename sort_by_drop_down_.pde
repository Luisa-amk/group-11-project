class SortByDropDownMenu {
  PFont font;
  int dropdownX = 990;
  int dropdownY = 150;
  int dropdownWidth = 255;
  int dropdownHeight = 35;
  String[] FilterByOptions = {"Airline (A-Z)", " Airline (Z-A)", "Distance (Short-Long)", "Distance (Long-Short)", "Flight Number"};
  int selectedOptionIndex = -1;
  boolean dropdownOpen = false;
  String selectedOptionText = "";

  void draw() {
    // Draw dropdown button
    stroke(0);
    fill(purple);
    rect(dropdownX, dropdownY, dropdownWidth, dropdownHeight);
    fill(0);
    textAlign(CENTER, CENTER);

    // Draw arrow indicating dropdown state
    float arrowX = dropdownX + dropdownWidth - 15;
    float arrowY = dropdownY + dropdownHeight / 2;
    float arrowSize = 6;

    beginShape();
    if (dropdownOpen) {
      // Draw arrow pointing upwards when dropdown is open
      vertex(arrowX, arrowY - arrowSize / 2);
      vertex(arrowX + arrowSize, arrowY + arrowSize / 2);
      vertex(arrowX - arrowSize, arrowY + arrowSize / 2);
    } else {
      // Draw arrow pointing downwards when dropdown is closed
      vertex(arrowX - arrowSize, arrowY - arrowSize / 2);
      vertex(arrowX + arrowSize, arrowY - arrowSize / 2);
      vertex(arrowX, arrowY + arrowSize / 2);
    }
    endShape(CLOSE);

    if (selectedOptionIndex == -1) {
      text("Select", dropdownX + dropdownWidth/2, dropdownY + dropdownHeight/2);
    } else {
      text(FilterByOptions[selectedOptionIndex], dropdownX + dropdownWidth/2, dropdownY + dropdownHeight/2);
      text(selectedOptionText, width/2, 230);
    }

    // Draw dropdown options if dropdown is open
    if (dropdownOpen) {
      for (int i = 0; i < FilterByOptions.length; i++) {
        fill(purple);
        rect(dropdownX, dropdownY + dropdownHeight * (i + 1), dropdownWidth, dropdownHeight);
        fill(0);
        textAlign(CENTER, CENTER);
        text(FilterByOptions[i], dropdownX + dropdownWidth/2, dropdownY + dropdownHeight * (i + 1) + dropdownHeight/2);
      }
    }
  }
  void mousePressed() {
    // Check if mouse is inside dropdown button
    if (mouseX > dropdownX && mouseX < dropdownX + dropdownWidth && mouseY > dropdownY && mouseY < dropdownY + dropdownHeight) {
      // Toggle dropdown options visibility
      dropdownOpen = !dropdownOpen;
    }

    // Check if mouse is inside dropdown options
    if (dropdownOpen) {
      for (int i = 0; i < FilterByOptions.length; i++) {
        if (mouseX > dropdownX && mouseX < dropdownX + dropdownWidth && mouseY > dropdownY + dropdownHeight * (i + 1) && mouseY < dropdownY + dropdownHeight * (i + 2)) {
          selectedOptionIndex = i;
          dropdownOpen = false; // Close the dropdown after selecting an option
          handleDropdownEvent(selectedOptionIndex);
          break;
        }
      }
    }
  }
  void handleDropdownEvent(int optionIndex) {
    // Handle the event based on the selected option index
    switch (optionIndex) {
    case 0:
      println("Sort By: airline (A-Z)");
      sortByAirline = true;
      sortByAirlineZA = false;
      sortByFlightDistanceShortToLong = false;
      sortByFlightDistanceLongToShort = false;
      sortByFlightNumber = false;

      flightTickets.clear();
      break;
    case 1:
      println("Sort By: airline (Z-A)");
      sortByAirline = false;
      sortByAirlineZA = true;
      sortByFlightDistanceShortToLong = false;
      sortByFlightDistanceLongToShort = false;
      sortByFlightNumber = false;

      flightTickets.clear();
      break;
    case 2:
      println("Sort By: Flight Distance (Short - Long)");
      sortByAirline = false;
      sortByAirlineZA = false;
      sortByFlightDistanceShortToLong = true;
      sortByFlightDistanceLongToShort = false;
      sortByFlightNumber = false;

      flightTickets.clear();
      break;
    case 3:
      println("Sort By: Flight Distance (Long - Short)");
      sortByAirline = false;
      sortByAirlineZA = false;
      sortByFlightDistanceShortToLong = false;
      sortByFlightDistanceLongToShort = true;
      sortByFlightNumber = false;

      flightTickets.clear();
      break;
    case 4:
      println("Sort By: Flight Number (Ascending)");
      sortByAirline = false;
      sortByAirlineZA = false;
      sortByFlightDistanceShortToLong = false;
      sortByFlightDistanceLongToShort = false;
      sortByFlightNumber = true;

      flightTickets.clear();

      break;
    default:
      println("No option selected.");
      break;
    }
  }
}
