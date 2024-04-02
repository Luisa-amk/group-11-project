class DataPoint // not DataPoints
{
  String flDate;
  String mktCarrier;
  int  mktCarrierFlNum;
  String origin;
  String originCityName;
  String  originStateAbr;
  String  originStateInit;
  int  originWac;
  String dest;
  String destCityName;
  String  destStateAbr;
  String destCityInit;
  int destWac;
  int crsDepTime;
  int depTime;
  int crsArrTime;
  int arrTime;
  int cancelled;
  int diverted;
  int distance;
    
    DataPoint(String flightData[]){
        flDate = flightData[0];
        mktCarrier = flightData[1];
        mktCarrierFlNum = Integer.parseInt(flightData[2]);
        origin = flightData[3];
        originCityName = flightData[4];
        originStateInit = flightData[5];
        originStateAbr = flightData[6];
        originWac = Integer.parseInt(flightData[7]) ;// convets a string into an integer
        dest = flightData[8];
        destCityName = flightData[9];
        destCityInit = flightData[10];
        destStateAbr = flightData[11];
        destWac = Integer.parseInt(flightData[12]);
        crsDepTime = Integer.parseInt(flightData[13]);
        
        if(flightData[14].isEmpty())
        depTime = -1;
        else
        depTime = Integer.parseInt(flightData[14]);  //still a null string
        
        crsArrTime = Integer.parseInt(flightData[15]);
        
        if(flightData[16].isEmpty())
        arrTime = -1;
        else
        arrTime = Integer.parseInt(flightData[16]); 
        
        cancelled = Integer.parseInt(flightData[17]);
        diverted = Integer.parseInt(flightData[18]);
        distance = Integer.parseInt(flightData[19]);      
    }

}
