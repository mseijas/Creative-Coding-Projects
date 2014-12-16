
/*==========  Variables  ==========*/

color markerColor;
color labelColor = color(13, 42, 56);
color textColor = color(61, 77, 86);



/*==========  Functions  ==========*/

void createMarker() {

  getNodeData();
  
  coordinateLookup(nodeCity);
  Location markerLocation = new Location(getLatitude(), getLongitude());
  SimplePointMarker marker = new SimplePointMarker(markerLocation);
  
  //markerColor = getMarkerColor(); 
  markerColor = unhex(getColor(testID));
  
  ScreenPosition markerPos = marker.getScreenPosition(map);
  
  fill(markerColor);
  ellipse(markerPos.x, markerPos.y, metricRadius, metricRadius);

  printLegend(testName, nodeCity, testTotalLoadTime, markerColor);
  
}


void printLegend(String _testName, String _nodeCity, int _testTotalLoadTime, color _markerColor) {
  
  int spacing = int(width * 0.0099);
  
  
  colorMode(RGB);
  
  fill(labelColor);
  text("Test", spacing, legendY);
  fill(textColor);
  text(_testName, textWidth("Test") + spacing + int(width * 0.0199), legendY);

  fill(labelColor);
  text("Location", int(width * 0.42), legendY);
  fill(textColor);
  text(_nodeCity, textWidth("Location") + spacing + int(width * 0.42), legendY);

  fill(labelColor);
  text("Webpage Response (ms)", int(width * 0.811), legendY);
  fill(textColor);
  text(_testTotalLoadTime, textWidth("Webpage Response (ms)") + int(width * 0.811) + spacing, legendY);
  
  
  colorMode(HSB, 360, 100, 100);
  
  fill(_markerColor);
  ellipse(textWidth("Test") + spacing*2, legendY - 6, 5, 5);
  
}

