class FlightTicket {
  float x, y, w, h;
  int flightNumber;
  String arrivalTime;
  String departureTime;
  String originCityName;
  String destinationCityName;
  double cancelled;
  String airline;




  FlightTicket(float x, float y, float w, float h, int flightNumber, String arrivalTime, String departureTime, String originCityName, String destinationCityName,
    double cancelled, String airline) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.flightNumber = flightNumber;
    this.arrivalTime = arrivalTime;
    this.departureTime = departureTime;
    this.originCityName = originCityName;
    this.destinationCityName = destinationCityName;
    this.cancelled = cancelled;
    this.airline = airline;
  }

  void display() {
    stroke(0);
    float radius = 10;
    //fill(144, 161, 223);
    fill(darkPurple, 40);
    strokeWeight(2);
    rect(x, y, w, h, radius);

    fill(0);
    textAlign(LEFT);
    textSize(16);
    textFont(ticketFont);
    //  image(airplaneImg, x + 700, y-90);
    text("Flight Number: " + flightNumber, x + 10, y + 25);
    text("Arrival Time: " + formatTime(arrivalTime), x + 280, y + 60);
    text("Departure Time: " + formatTime(departureTime), x + 10, y + 60);
    text("Origin: " + originCityName, x + 10, y + 90);
    text("Destination: " + destinationCityName, x + 280, y + 90);


    text("airline: " + airline, x + 550, y + 90);
    fill(255, 0, 0);
    textSize(20);
    text(cancelled == 1.00? "CANCELLED" : "", x + (width - 510), y + 22);
  }

  void scroll(float e) {
    y -= e * 10;
  }
  void mouseWheel(float e) {
    scroll(e);
  }
}
