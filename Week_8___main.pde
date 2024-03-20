import java.util.ArrayList;

int result;
int default_query;
int current_query;
int query1 = 1;
int query2 = 2;
int query3 = 3;
 float ypos = 10;



ArrayList<DataPoint> dataPoints; // array of DataPoint, create empty array // dataPoints name 
int numDataPoints = 18;
float lineHeight = 20; 


void setup() {
  size (400,400);
  background (255); 
  
  readData(); // read file
  printDataPoints();
  result = default_query;        //result = default_query();
  current_query = query3;        //current_query = query3;// whatever type of query is default
  PFont myFont = loadFont("AgencyFB-Bold-10.vlw");
  textFont(myFont); 
  fill (0);
}

void draw() {
  

  // Iterate over dataPoints and display each DataPoint's info
  for (DataPoint dp : dataPoints) {
    text(dp.getInfo(), 10, ypos); // Display
    ypos += lineHeight; // Increment next line
  }

//switch(current_query){
//case query1:
//   //render_query1(results);
//   break;
//case query2:
//   //render_query2(results);
//   break;
//}
////render_controls();
}

void mousePressed()
{
////Work out which button pressed
//switch(event)
//{
//case button1:
//   current_query = query1;
//   results=query1();
//   break;
//case button2:
//   current_query = query2;
//   results=query2();
//   break;
//}
}

void readData() {
 
    dataPoints = new ArrayList<DataPoint>();
     String[] lines = loadStrings("flights-2k.csv"); 


  // Parse each line and create DataPoint objects
 for (int i = 1; i < lines.length; i++) {  //skip header
    String[] parts = split(lines[i], ","); // split it into parts 
    DataPoint dp = new DataPoint(parts); // create new object - dp
    dataPoints.add(dp); // add to arraylist called dataPoints
  }
}

void printDataPoints() {
  for (DataPoint dp : dataPoints) {
  println(dp.getInfo());
}
  }