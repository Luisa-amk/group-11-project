List<Flight> filterFlightsByAirports(List<Flight> flights, String departureAirport, String arrivalAirport) {             //this method filters by Airports

  List<Flight> filteredFlights = new ArrayList<>();
  for (Flight flight : flights) {
    if (flight.getDepartureAirport().equals(departureAirport) && flight.getArrivalAirport().equals(arrivalAirport)) {     //arrAirport and depAirport will be passed in to the userInterface and this method will be called in main
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}
List<Flight> filterFlightsByDate(List<Flight> flights, int dateLow, int dateHigh) {                        //any other filter methods can follow the exact same structure
  List<Flight> filteredFlights = new ArrayList<>();
  for (Flight flight : flights) {
    if (flight.getDate() >= dateLow && flight.getDate() <= dateHigh) {
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}

List<Flight> filterFlightsByArrivalTime(List<Flight> flights, String arrivalTimeLow, String arrivalTimeHigh) {

  arrivalTimeLow = arrivalTimeLow.replace(".", "");
  arrivalTimeHigh = arrivalTimeHigh.replace(".", "");

  int arrTimeLow = arrivalTimeLow.isEmpty() ? Integer.MIN_VALUE : Integer.parseInt(arrivalTimeLow);
  int arrTimeHigh = arrivalTimeHigh.isEmpty() ? Integer.MAX_VALUE : Integer.parseInt(arrivalTimeHigh);

  List<Flight> filteredFlights = new ArrayList<>();
  for (Flight flight : flights) {
    String arrivalTimee = flight.getArrivalTime();
    int arrivalTime = Integer.parseInt(arrivalTimee);
    if (arrivalTime >= arrTimeLow && arrivalTime <= arrTimeHigh) {
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}

List<Flight> filterFlightsByDepTime(List<Flight> flights, String departureTimeLow, String departureTimeHigh) {
  departureTimeLow = departureTimeLow.replace(".", "");
  departureTimeHigh = departureTimeHigh.replace(".", "");

  int depTimeLow = departureTimeLow.isEmpty() ? Integer.MIN_VALUE : Integer.parseInt(departureTimeLow);
  int depTimeHigh = departureTimeHigh.isEmpty() ? Integer.MAX_VALUE : Integer.parseInt(departureTimeHigh);

  List<Flight> filteredFlights = new ArrayList<>();
  for (Flight flight : flights) {
    String depTimee = flight.getDepartureTime();
    int depTime = Integer.parseInt(depTimee);
    if (depTime >= depTimeLow && depTime <= depTimeHigh) {
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}

List<Flight> filterFlightsByDistance(List<Flight> flights, int distLow, int distHigh) {

  List<Flight> filteredFlights = new ArrayList<>();
  for (Flight flight : flights) {
    int distance = (int)flight.getDistance();
    if (distance >= distLow && distance <= distHigh) {
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}
