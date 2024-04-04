List<Flight> filterFlightsByAirports(List<Flight> flights, String departureAirport, String arrivalAirport) {             //this method filters by Airports 
  List<Flight> filteredFlights = new ArrayList<>();
  for (Flight flight : flights) {
    if (flight.getDepartureAirport().equals(departureAirport) && flight.getArrivalAirport().equals(arrivalAirport)) {     //arrAirport and depAirport will be passed in to the userInterface and this method will be called in main 
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}
  
