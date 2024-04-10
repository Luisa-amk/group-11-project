void sortByFlightNumber(List<Flight> filteredFlights) {     // Ascending Order , Taken in filtered list and sort it
  Comparator<Flight> flightNumberComparator = new Comparator<Flight>() {
    public int compare(Flight flight1, Flight flight2) {
      return flight1.getFlightNumber() - flight2.getFlightNumber();
    }
  };

  // Sort the flights using the comparator
  Collections.sort(filteredFlights, flightNumberComparator);
  // Print out the sorted flights for checking
  System.out.println("Sorted by Flight Number:");
  for (Flight flight : filteredFlights) {
    System.out.println(flight.toString()); // return filterd and sorted
  }
}

void sortByAirline(List<Flight> flights) {

  Comparator<Flight> airlineComparator = new Comparator<Flight>() {
    @Override
      public int compare(Flight flight1, Flight flight2) {
      return flight1.getAirline().compareToIgnoreCase(flight2.getAirline());
    }
  };

  // Sort the flights using the comparator
  Collections.sort(flights, airlineComparator);
}

void sortByAirlineZA(List<Flight> filteredFlights) { // take in market supplier (Z-A)

  Comparator<Flight> airlineComparator = new Comparator<Flight>() {
    public int compare(Flight flight1, Flight flight2) {
      return flight2.getAirline().compareTo(flight1.getAirline());
    }
  };

  Collections.sort(filteredFlights, airlineComparator);
}

void sortByDistanceShortToLong(List<Flight> flights) {
  Comparator<Flight> distanceComparator = new Comparator<Flight>() {
    public int compare(Flight flight1, Flight flight2) {

      return (int)flight1.getDistance() - (int)flight2.getDistance();
    }
  };


  Collections.sort(flights, distanceComparator);
}
void sortByDistanceLongToShort(List<Flight> flights) {
  Comparator<Flight> distanceComparator = new Comparator<Flight>() {
    public int compare(Flight flight1, Flight flight2) {

      return (int)flight2.getDistance() - (int)flight1.getDistance();
    }
  };


  Collections.sort(flights, distanceComparator);
}
