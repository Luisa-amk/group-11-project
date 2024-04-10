class DropDownMenu {
  PFont font;
  int dropdownX = 70;
  int dropdownY = 300;
  int dropdownWidth = 200;
  int dropdownHeight = 35;
  String[] FilterByOptions = {"Airport", "Departure Time", "Arrival Time", "Distance"};
  int selectedOptionIndex = -1;
  boolean dropdownOpen = false;
  String selectedOptionText = "";

  void draw() {
    // Draw dropdown button
    stroke(0);
    fill(darkPurple);
    rect(dropdownX, dropdownY, dropdownWidth, dropdownHeight);
    fill(0);
    textAlign(CENTER, CENTER);

    // Draw arrow indicating dropdown state
    float arrowX = dropdownX + dropdownWidth - 20;
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
        fill(darkPurple);
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
      println("Filter By: Airport");
      selectedOptionText = "Input Airport Name (e.g. LAX)";
      filterByAirport = true;
      filterByDepTimeOption = false;
      filterByArrTimeOption = false;
      filterByDistOption = false;
      break;
    case 1:
      println("Filter By: Departure Time");
      selectedOptionText = "Input Departure Time By Hour (i.e. 07.00 or 15.00, not 16.45)";
      filterByAirport = false;
      filterByDepTimeOption = true;
      filterByArrTimeOption = false;
      filterByDistOption = false;
      break;
    case 2:
      println("Filter By: Arrival Time");
      selectedOptionText = "Input Arrival Time By Hour (i.e. 07.00 or 15.00, not 16.45)";
      filterByAirport = false;
      filterByDepTimeOption = false;
      filterByArrTimeOption = true;
      filterByDistOption = false;
      break;
    case 3:
      println("Filter By: Distance");
      selectedOptionText = "Drag the slider to choose a distance";
      filterByAirport = false;
      filterByDepTimeOption = false;
      filterByArrTimeOption = false;
      filterByDistOption = true;
      break;
    default:
      println("No option selected.");
      break;
    }
  }
}
