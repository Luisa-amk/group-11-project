String[] flights; // Array to store the lines of the CSV file

void setup() {
  // Load the CSV file into the flights array
  flights = loadStrings("flights-2k"); // Replace this with the path to your CSV file
  
  // Print each line of the CSV file
  for (String line : flights) {
    println(line);
  }
}
