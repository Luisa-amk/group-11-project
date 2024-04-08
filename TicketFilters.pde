
class FlightTicket {
  float x, y, w, h;
  int flightNumber;
  String arrivalTime;
  String departureTime;
  String originCityName;
  String destinationCityName;
 

  FlightTicket(float x, float y, float w, float h, int flightNumber, String arrivalTime, String departureTime, String originCityName, String destinationCityName) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.flightNumber = flightNumber;
    this.arrivalTime = arrivalTime;
    this.departureTime = departureTime;
    this.originCityName = originCityName;
    this.destinationCityName = destinationCityName;
  }

  void display() {
    float radius = 10;
    fill(144, 161, 223);
    strokeWeight(2);
    rect(x, y, w, h, radius);

    fill(0);
    textAlign(LEFT);
    textSize(16);
    PFont label2 = loadFont("AgencyFB-Bold-10.vlw");
    textFont(label2);
    text("Flight Number: " + flightNumber, x + 10, y + 20);
    text("Arrival Time: " + arrivalTime, x + 220, y + 60);
    text("Departure Time: " + departureTime, x + 10, y + 60);
    text("Origin: " + originCityName, x + 10, y + 80);
    text("Destination: " + destinationCityName, x + 220, y + 80);
   
    
    
  }

  void scroll(float e) {
    y -= e * 10;
  }
  
}