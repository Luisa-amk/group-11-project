class DataPoint // not DataPoints
{
  String FL_DATE;
  String MKT_CARRIER;
  int MKT_CARRIER_FL_NUM;
  String ORIGIN;
  String ORIGIN_CITY_NAME;
  String ORIGIN_STATE_ABR;
  int ORIGIN_WAC;
  String DEST;
  String DEST_CITY_NAME;
  String DEST_STATE_ABR;
  int DEST_WAC;
  int CRS_DEP_TIME;
  int DEP_TIME;
  int CRS_ARR_TIME;
  int ARR_TIME;
  int CANCELLED;
  int DIVERTED;
  int DISTANCE;
    
    DataPoint(String flightData[]){
      FL_DATE = flightData[0];
        MKT_CARRIER = flightData[1];
        MKT_CARRIER_FL_NUM = Integer.parseInt(flightData[2]);
        ORIGIN = flightData[3];
        ORIGIN_CITY_NAME = flightData[4];
        ORIGIN_STATE_ABR = flightData[5];
        ORIGIN_WAC = Integer.parseInt(flightData[6]);
        DEST = flightData[7];
        DEST_CITY_NAME = flightData[8];
        DEST_STATE_ABR = flightData[9];
        DEST_WAC = Integer.parseInt(flightData[10]);
        CRS_DEP_TIME = Integer.parseInt(flightData[11]);
        DEP_TIME = Integer.parseInt(flightData[12]);
        CRS_ARR_TIME = Integer.parseInt(flightData[13]);
        ARR_TIME = Integer.parseInt(flightData[14]);
        CANCELLED = Integer.parseInt(flightData[15]);
        DIVERTED = Integer.parseInt(flightData[16]);
        DISTANCE = Integer.parseInt(flightData[17]);      
    }

}
