String[] flights; 
String[] lines;
import java.util.ArrayList;
int result;
int default_query;
int current_query;
int query1 = 1;
int query2 = 2;
int query3 = 3;
boolean cancelled;
ArrayList<DataPoint> dataPoints;
int numDataPoints = 18;
String cancelledTime = "5";
//String cancArrTime  "0000";

void setup() {
  readData();
  result = default_query;        //result = default_query();
  current_query = query3;        //current_query = query3;// whatever type of query is default
  
   for(DataPoint dp : dataPoints )
   {
     
      println(dp.flDate + " " + dp.mktCarrier + " " + dp. mktCarrierFlNum + " " + dp.origin + " " + dp.originCityName + " " + dp.originStateInit + " " +
    dp.originStateAbr + " " + dp.originWac + " " + dp.dest + " " + dp.destCityName +  " " + dp.destCityInit + " " +  dp.destStateAbr + " " + dp.destWac +
    dp.crsDepTime + " " + dp.depTime + " " + dp.crsArrTime + " " + dp.arrTime + " " +  dp.cancelled + " " + dp.diverted + " " + dp.distance );
    
     println(dp); 
   }

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

void readData(){
  String[] lines = loadStrings("flights2k.csv"); 
  
  dataPoints = new ArrayList<DataPoint>();
  
  // Parse each line and create DataPoint objects
  for (int i = 1; i < lines.length; i++) {
    
    String[] parts = split(lines[i], ","); 
    DataPoint dp = new DataPoint(parts);  // problem is the parts array -> need to change the parts 
    dataPoints.add(dp);
    
   
  }
}
