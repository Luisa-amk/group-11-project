//class FlightSchedule {
//  private Map<Integer, List<String>> schedule;
//  private Map<Integer, List<String>> scheduleForAirport;

//  public FlightSchedule() {
//    this.schedule = new HashMap<>();
//    this.scheduleForAirport = new HashMap<>();
//  }

//  public void addFlight(int day, String city) {
//    List<String> citiesForDay = schedule.getOrDefault(day, new ArrayList<>());
//    citiesForDay.add(city);
//    schedule.put(day, citiesForDay);
//  }

//  public int countFlightsForDate(int date) {
//    List<String> citiesForDate = schedule.getOrDefault(date, new ArrayList<>());
//    return citiesForDate.size();
//  }
//  public void addAirportFlights(int day, String city){
//    List<String> flights = scheduleForAirport.getOrDefault(day, new ArrayList<>());
//    flights.add(city);
//    scheduleForAirport.put(day, flights);
    
//  }
//  public int countFLightsToAirport(int date){
//    List<String> flights = scheduleForAirport.getOrDefault(date, new ArrayList<>());
//    return flights.size();
//  }
//}

class FlightSchedule {
  private Map<Integer, List<String>> schedule;
  private Map<Integer, List<String>> scheduleForAirport;
  private Map<Integer, List<String>> cancelledFlight;


  public FlightSchedule() {
    this.schedule = new HashMap<>();
    this.scheduleForAirport = new HashMap<>();
    this.cancelledFlight = new HashMap<>();

  }

  public void addFlight(int day, String city) {
    List<String> citiesForDay = schedule.getOrDefault(day, new ArrayList<>());
    citiesForDay.add(city);
    schedule.put(day, citiesForDay);
  }

  public int countFlightsForDate(int date) {
    List<String> citiesForDate = schedule.getOrDefault(date, new ArrayList<>());
    return citiesForDate.size();
  }
  
  public void addAirportFlights(int day, String city){
    List<String> flights = scheduleForAirport.getOrDefault(day, new ArrayList<>());
    flights.add(city);
    scheduleForAirport.put(day, flights);
    
  }
  public int countFLightsToAirport(int date){
    List<String> flights = scheduleForAirport.getOrDefault(date, new ArrayList<>());
    return flights.size();
  }
  
  public void addCancelledFlight(int day, String cancelled){
    List<String> cancelledFlights = cancelledFlight.getOrDefault(day, new ArrayList<>());
    cancelledFlights.add(cancelled);
    cancelledFlight.put(day, cancelledFlights);
    
  }
  public int countCancelledFlight(int date){
    List<String> cancelled = cancelledFlight.getOrDefault(date, new ArrayList<>());
    return cancelled.size();
  }


}