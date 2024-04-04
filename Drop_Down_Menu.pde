class DropDownMenu {
  PFont font;
  int dropdownX = 50;
  int dropdownY = 150;
  int dropdownWidth = 150;
  int dropdownHeight = 40;
  String[] options = {"Date Range", "Departure Time", "Arrival Time"};
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
    if (selectedOptionIndex == -1) {
      text("Select", dropdownX + dropdownWidth/2, dropdownY + dropdownHeight/2);
    } else {
      text(options[selectedOptionIndex], dropdownX + dropdownWidth/2, dropdownY + dropdownHeight/2);
      text(selectedOptionText, width/2, 200);
    }

    // Draw dropdown options if dropdown is open
    if (dropdownOpen) {
      for (int i = 0; i < options.length; i++) {
        fill(purple);
        rect(dropdownX, dropdownY + dropdownHeight * (i + 1), dropdownWidth, dropdownHeight);
        fill(0);
        textAlign(CENTER, CENTER);
        text(options[i], dropdownX + dropdownWidth/2, dropdownY + dropdownHeight * (i + 1) + dropdownHeight/2);
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
      for (int i = 0; i < options.length; i++) {
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
      println("Option 1 selected. Displaying text 1.");
      selectedOptionText = "Input Date Range (1-31)";
      showByDateOption = true;
      showByDepTimeOption = false;
      showByArrTimeOption = false;
      break;
    case 1:
      println("Option 2 selected. Displaying text 2.");
      selectedOptionText = "Input Departure Time (e.g. 07:00, 15:00, etc.)";
      showByDateOption = false;
      showByDepTimeOption = true;
      showByArrTimeOption = false;
      break;
    case 2:
      println("Option 3 selected. Displaying text 3.");
      selectedOptionText = "Input Arrival Time (e.g. 07:00, 15:00, etc.)";
      showByDateOption = false;
      showByDepTimeOption = false;
      showByArrTimeOption = true;
      break;
    default:
      println("No option selected.");
      break;
    }
  }
}
