

// create flight object in processed Flight flight = new Flight
List<Flight> filterFlightsByAirports(List<Flight> flights, String departureAirport, String arrivalAirport) {             //this method filters by Airports 
  List<Flight> filteredFlights = new ArrayList<>(); // does this empty the arrayList ?
  for (Flight flight : flights) {
    if (flight.getDepartureAirport().equals(departureAirport) && flight.getArrivalAirport().equals(arrivalAirport)) {     //arrAirport and depAirport will be passed in to the userInterface and this method will be called in main 
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}

List<Flight> filterFlightsByDate(List<Flight> flights, int startDate, int endDate){
  List<Flight> filteredFlights = new ArrayList<>();
  for(Flight flight : flights){
    if(flight.getDate() >= startDate && flight.getDate() <= endDate){
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}

List<Flight> filterFlightsByArrival(List<Flight> flights, int lowArr, int highArr, int highArrHour){ // high dep 
  List<Flight> filteredFlights = new ArrayList<>();
  for(Flight flight : flights){
    if(flight.getCovertedArrHour() >= lowArr && flight.getCovertedArrHour() < highArr){  // maybe a second if statement , if the 23 and the 00 are == to highDep and 0, then add
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}

List<Flight> filterFlightsByDeparture(List<Flight> flights, int lowDep, int highDep, int highDepHour){ // high dep 
  List<Flight> filteredFlights = new ArrayList<>();
  for(Flight flight : flights){
    if(flight.getConvertedDeptHour() >= lowDep && flight.getConvertedDeptHour() < highDep){  // maybe a second if statement , if the 23 and the 00 are == to highDep and 0, then add
      filteredFlights.add(flight);
    }
  }
  return filteredFlights;
}
