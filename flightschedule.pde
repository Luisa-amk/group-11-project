class FlightSchedule {
  private Map<Integer, List<String>> schedule;
  private Map<Integer, List<String>> scheduleForAirport;
  private Map<Integer, List<String>> scheduleFlightsByDep;
  private Map<Integer, List<String>> scheduleFlightsByArr;
  private Map<Integer, List<String>> cancelledFlight;


  public  FlightSchedule() { // constructor
    this.schedule = new HashMap<>();
    this.scheduleForAirport = new HashMap<>();
    this.scheduleFlightsByDep = new HashMap<>();
    this.cancelledFlight = new HashMap<>();
    this.scheduleFlightsByArr = new HashMap<>();
    this.scheduleFlightsByDep = new HashMap<>();
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
  public void addAirportFlights(int day, String city) {
    List<String> flights = scheduleForAirport.getOrDefault(day, new ArrayList<>()); // day is the key
    flights.add(city);  // city (the data each key is pointing to ) // total flights from this city per date
    scheduleForAirport.put(day, flights); // hashmap of int day, arrayList containing all flights from a particular airport
  }

  public int countFLightsToAirport(int date) {   // for each date return the total flights ( which are from this city )
    List<String> flights = scheduleForAirport.getOrDefault(date, new ArrayList<>());
    return flights.size();
  }


  public void addFlightByDepTime( int time, String city ) {
    List<String> cityDeps = scheduleFlightsByDep.getOrDefault(time, new ArrayList<>());
    cityDeps.add(city); // an array list of the cities, from which
    scheduleFlightsByDep.put(time, cityDeps);
  }

  public int countFlightsByDepTime(int time) {
    List<String> cityDeps = scheduleFlightsByDep.getOrDefault(time, new ArrayList<>());
    return cityDeps.size();
  }

  public void addFlightByArrTime( int time, String city ) {
    List<String> cityArr = scheduleFlightsByArr.getOrDefault(time, new ArrayList<>());
    cityArr.add(city); // an array list of the cities, from which

    scheduleFlightsByArr.put(time, cityArr);
  }

  public int countFlightsByArrTime(int time) { // size
    List<String> cityArr = scheduleFlightsByArr.getOrDefault(time, new ArrayList<>());
    return cityArr.size();
  }

  public void addCancelledFlight(int day, String cancelled) {
    List<String> cancelledFlights = cancelledFlight.getOrDefault(day, new ArrayList<>());
    cancelledFlights.add(cancelled);
    cancelledFlight.put(day, cancelledFlights);
  }


  public int countCancelledFlight(int date) {
    List<String> cancelled = cancelledFlight.getOrDefault(date, new ArrayList<>());
    return cancelled.size();
  }
  
  public void clearSchedule( Map<Integer, List<String>> inputSchedule)
  {    
    inputSchedule.clear();
  }
}
