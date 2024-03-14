String[] flights; 
import java.util.ArrayList;
int result;
int default_query;
int current_query;
int query1 = 1;
int query2 = 2;
int query3 = 3;

ArrayList<DataPoint> dataPoints;
int numDataPoints = 18;

void setup() {
  fullScreen();
  readData();
  result = default_query;        //result = default_query();
  current_query = query3;        //current_query = query3;// whatever type of query is default
  

}
void draw() {
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
  flights = loadStrings("flights-2k");
  dataPoints = new ArrayList<DataPoint>();

  for (String line : flights) {
    String[] flightData = line.split(" , ");
    if (flightData.length == numDataPoints) {
      
      DataPoint dataPoint = new DataPoint(flightData);
      dataPoints.add(dataPoint);
    }
  }
}
