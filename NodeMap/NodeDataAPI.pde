
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
  
  jsonNodeAPI = loadJSONObject(serverPath);
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

