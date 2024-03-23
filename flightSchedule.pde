static class FlightSchedule {
  private static Map<String, List<Flight>> schedule;

  public FlightSchedule() {
    schedule = new HashMap<>();
  }

  public void addFlight(String date, Flight flight) {
    List<Flight> flightsForDate = schedule.getOrDefault(date, new ArrayList<>());
    flightsForDate.add(flight);
    schedule.put(date, flightsForDate);
  }

  public int countFlightsForDate(String date) {
    List<Flight> flightsForDate = schedule.getOrDefault(date, new ArrayList<>());
    return flightsForDate.size();
  }
}
