class DataPoint {
  String flDate;
  String mktCarrier;
  int mktCarrierFlNum;
  String origin;
  String originCityName;
  String originStateAbr;
  int originWac;
  String dest;
  String destCityName;
  String destStateAbr;
  int destWac;
  int crsDepTime;
  int depTime;
  int crsArrTime;
  int arrTime;
  int cancelled;
  int diverted;
  int distance;
  
  DataPoint(String flightData[]) {
    flDate = flightData[0];
    mktCarrier = flightData[1];
    mktCarrierFlNum = int(flightData[2]);
    origin = flightData[3];
    originCityName = flightData[4];
    originStateAbr = flightData[5];
    originWac = int(flightData[6]);
    dest = flightData[7];
    destCityName = flightData[8];
    destStateAbr = flightData[9];
    destWac = int(flightData[10]);
    crsDepTime = int(flightData[11]);
    depTime = int(flightData[12]);
    crsArrTime = int(flightData[13]);
    arrTime = int(flightData[14]);
    cancelled = int(flightData[15]);
    diverted = int(flightData[16]);
    distance = int(flightData[17]);
  }
  
  String getInfo() {
    String line = "Flight Date: " + flDate + " " +
           "Marketing Carrier: " + mktCarrier + " "+
           "Marketing Carrier Flight Number: " + mktCarrierFlNum + " " +
           "Origin: " + origin + " " +
           "Origin City Name: " + originCityName + " " +
           "Origin State Abbreviation: " + originStateAbr + " " +
           "Origin World Area Code: " + originWac + " " +
           "Destination: " + dest + " " +
           "Destination City Name: " + destCityName + " " +
           "Destination State Abbreviation: " + destStateAbr + " " +
           "Destination World Area Code: " + destWac+ " " +
           "Scheduled Departure Time: " + crsDepTime + " " +
           "Actual Departure Time: " + depTime + " " +
           "Scheduled Arrival Time: " + crsArrTime + " " +
           "Actual Arrival Time: " + arrTime + " " +
           "Cancelled: " + cancelled + " " +
           "Diverted: " + diverted + " " +
           "Distance: " + distance; 
    return line;
  }
}