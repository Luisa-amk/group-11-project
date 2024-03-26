
class FlightSchedule {
  private Map<Integer, List<String>> schedule;

  public FlightSchedule() {
    this.schedule = new HashMap<>();
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
}
