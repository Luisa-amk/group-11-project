public class Flight {
    private int date;
    private String airline;
    private int flightNumber;
    private String departureAirport;
    private String arrivalAirport;
    private String arrivalTime;
    private String departureTime;
    private String originCityName;
    private String originStateAbr;
    private int originWAC;
    private String destCityName;
    private String destCityNameAbr;
    private String destWAC;
    private String crsDepTime;
    private String crsArrTime;
    private double cancelled;
    private double diverted;
    private double distance;
   
   // constructor -> only passing through variables of interest to us for the flight tickets
   // changed departureTime and arrivalTime to String -> needed for the filter 
    public Flight(int date, int flightNumber, String departureAirport, String arrivalAirport, String arrivalTime, String departureTime, String destCityName, String originCityName) {
        this.date = date;
        this.flightNumber = flightNumber;
        this.departureAirport = departureAirport;
        this.arrivalAirport = arrivalAirport;
        this.arrivalTime = arrivalTime;
        this.departureTime = departureTime;
        this.destCityName = destCityName;
        this.originCityName = originCityName;
    }
    public Flight(int date, String airline, int flightNumber, String departureAirport, String arrivalAirport, String arrivalTime, String departureTime, 
    String originCityName, String originStateAbr, int originWAC, String destCityName, String destCityNameAbr, String destWAC, 
    String crsDepTime, String crsArrTime, double cancelled, double diverted, double distance) {                                                //initalises all the flight attributes 
        this.date = date;
        this.airline = airline;
        this.flightNumber = flightNumber;
        this.departureAirport = departureAirport;
        this.arrivalAirport = arrivalAirport;
        this.arrivalTime = arrivalTime;
        this.departureTime = departureTime;
        this.originCityName = originCityName;
        this.originStateAbr = originStateAbr;
        this.originWAC = originWAC;
        this.destCityName = destCityName;
        this.destCityNameAbr = destCityNameAbr;
        this.destWAC = destWAC;
        this.crsDepTime = crsDepTime;
        this.crsArrTime = crsArrTime;
        this.cancelled = cancelled;
        this.diverted = diverted;
        this.distance = distance;
    }

    // Getters and setters for the flight attributes and a ToString method (just changes how the data is printed to console)

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public int getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(int flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(String departureAirport) {
        this.departureAirport = departureAirport;
    }

    public String getArrivalAirport() {
        return arrivalAirport;
    }

    public void setArrivalAirport(String arrivalAirport) {
        this.arrivalAirport = arrivalAirport;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getOriginCityName() {
        return originCityName;
    }

    public void setOriginCityName(String originCityName) {
        this.originCityName = originCityName;
    }

    public String getOriginStateAbr() {
        return originStateAbr;
    }

    public void setOriginStateAbr(String originStateAbr) {
        this.originStateAbr = originStateAbr;
    }

    public int getOriginWAC() {
        return originWAC;
    }

    public void setOriginWAC(int originWAC) {
        this.originWAC = originWAC;
    }

    public String getDestCityName() {
        return destCityName;
    }

    public void setDestCityName(String destCityName) {
        this.destCityName = destCityName;
    }

    public String getDestCityNameAbr() {
        return destCityNameAbr;
    }

    public void setDestCityNameAbr(String destCityNameAbr) {
        this.destCityNameAbr = destCityNameAbr;
    }

    public String getDestWAC() {
        return destWAC;
    }

    public void setDestWAC(String destWAC) {
        this.destWAC = destWAC;
    }

    public String getCrsDepTime() {
        return crsDepTime;
    }

    public void setCrsDepTime(String crsDepTime) {
        this.crsDepTime = crsDepTime;
    }

    public String getCrsArrTime() {
        return crsArrTime;
    }

    public void setCrsArrTime(String crsArrTime) {
        this.crsArrTime = crsArrTime;
    }

    public double getCancelled() {
        return cancelled;
    }

    public void setCancelled(double cancelled) {
        this.cancelled = cancelled;
    }

    public double getDiverted() {
        return diverted;
    }

    public void setDiverted(double diverted) {
        this.diverted = diverted;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }
    
    public int getConvertedDeptHour(){ // get the hour of the flightDepartureTime
    //int departureHour = Integer.parseInt(departureTime.substring(0,2));
     int flightDepTime = Integer.parseInt(departureTime.substring(0,2)); // int actual departure time
     return flightDepTime;
    }
    
    public int getCovertedArrHour(){
      int flightArrTime = Integer.parseInt(arrivalTime.substring(0,2));
      return flightArrTime;
    }

    public String toString() {
        return "Flight{" +
                "date='" + date + '\'' +
                ", flightNumber=" + flightNumber +
                ", departureAirport='" + departureAirport + '\'' +
                ", arrivalAirport='" + arrivalAirport + '\'' + "arrival Time = " + arrivalTime + "departure time = " + departureTime +
                '}';
    }
}
