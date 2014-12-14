
/*==========  Variables  ==========*/

JSONObject jsonNodeAPI;
JSONObject jsonTestDetail;
JSONObject jsonTestSummary;
JSONObject jsonTestTiming;

String nodeName;
String nodeCity;
String testName;

int testID; 
int testTotalLoadTime;
float metricRadius;



/*==========  Functions  ==========*/

void getNodeData() {
  
  jsonNodeAPI = loadJSONObject("https://fathomless-hamlet-6084.herokuapp.com");
  jsonTestDetail = jsonNodeAPI.getJSONObject("TestDetail");
  jsonTestSummary = jsonNodeAPI.getJSONObject("Summary");
  jsonTestTiming = jsonTestSummary.getJSONObject("Timing");

  testName = jsonTestDetail.getString("Name");
  nodeName = jsonNodeAPI.getString("NodeName");
  testID = jsonNodeAPI.getInt("TestId");
  
  testTotalLoadTime = jsonTestTiming.getInt("Total");
  metricRadius = map(testTotalLoadTime, 0, 10000, 5, 25);
  
  String[] nodeInfo = split(nodeName, '-');
  nodeCity = nodeInfo[0];
  
  println(testID + ": " + testName + " - " + nodeCity + " - " + testTotalLoadTime);
}



color getMarkerColor() {
  
  switch(testID) {
    case 87115:    //Bing
      return color(244, 0, 38);
    case 87114:    //Google
      return color(0, 194, 75);
    case 87155:    //Yahoo
      return color(80, 0, 149);
    case 87156:    //Ask
      return color(255, 133, 89);
    case 87673:    //CNN
      return color(211, 201, 52);
    case 87674:    //MoMA
      return color(167, 34, 90);
    case 87675:    //Whitney
      return color(34, 173, 194);
    case 87676:    //BKMuseum
      return color(255, 60, 87);
    case 87678:    //MET NYC
      return color(204, 255, 28);
    case 87679:    //Guggenheim
      return color(255, 148, 57);
    case 87680:    //NewMuseum
      return color(166, 226, 45);
    default:
      return color(255, 215, 0);
  }
  
}

