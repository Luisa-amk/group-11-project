class DataPoint // not DataPoints
{
  String flDate;
  String mktCarrier;
  int  mktCarrierFlNum;
  String origin;
  String originCityName;
  String  originStateAbr;
  int  originWac;
  String dest;
  String destCityName;
  String  destStateAbr;
  int destWac;
  int crsDepTime;
  int depTime;
  int crsArrTime;
  int arrTime;
  int  cancelled;
  int diverted;
  int distance;
    
    DataPoint(String flightData[]){
      flDate = flightData[0];
        mktCarrier = flightData[1];
        mktCarrierFlNum = Integer.parseInt(flightData[2]);
        origin = flightData[3];
        originCityName = flightData[4];
        originStateAbr = flightData[5];
        originWac = Integer.parseInt(flightData[6]);
        dest = flightData[7];
        destCityName = flightData[8];
        destStateAbr = flightData[9];
        destWac = Integer.parseInt(flightData[10]);
        crsDepTime = Integer.parseInt(flightData[11]);
        depTime = Integer.parseInt(flightData[12]);
        crsArrTime = Integer.parseInt(flightData[13]);
        arrTime = Integer.parseInt(flightData[14]);
        cancelled = Integer.parseInt(flightData[15]);
        diverted = Integer.parseInt(flightData[16]);
        distance = Integer.parseInt(flightData[17]);      
    }

}
