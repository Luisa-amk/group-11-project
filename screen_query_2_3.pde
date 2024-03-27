Button flightsFromLAXButton;
Button totalCancelledFlightsButton;
Button returnToMainPageButton;

void setup() {
  size(800, 600);
  flightsFromLAXButton = new Button(width/2 - 100, 200, 200, 50, "Flights from LAX");
  totalCancelledFlightsButton = new Button(width/2 - 100, 300, 200, 50, "Total cancelled flights");
  returnToMainPageButton = new Button(width/2 - 100, 400, 200, 50, "Return to Main Page");
}

void draw() {
  background(0);
  drawArrivalsAndDeparturesBoard();
  
  flightsFromLAXButton.display();
  totalCancelledFlightsButton.display();
  returnToMainPageButton.display();
}

void drawArrivalsAndDeparturesBoard() {
  // Draw background to mimic arrivals and departures board
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(24);
  text("Arrivals and Departures", width/2, 100);
  textSize(18);
  text("FLIGHT   |   STATUS   |   TIME   |   GATE", width/2, 150);
}

void mousePressed() {
  if (flightsFromLAXButton.isMouseOver()) {
    // Add functionality for flights from LAX button
    println("Flights from LAX button pressed");
  } else if (totalCancelledFlightsButton.isMouseOver()) {
    // Add functionality for total cancelled flights button
    println("Total cancelled flights button pressed");
  } else if (returnToMainPageButton.isMouseOver()) {
    // Add functionality for return to main page button
    println("Return to Main Page button pressed");
  }
}

class Button {
  float x, y, w, h;
  String label;
  
  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }
  
  void display() {
    stroke(255);
    fill(100);
    rect(x, y, w, h);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(label, x + w/2, y + h/2);
  }
  
  boolean isMouseOver() {
    return mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h;
  }
}
