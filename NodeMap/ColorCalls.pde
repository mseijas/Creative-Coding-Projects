
/*==========  Variables  ==========*/

String resultColor;
HashMap<Integer, String> testColors = new HashMap<Integer, String>();



/*==========  Functions  ==========*/

String generateRandomColor() {
  
  color randColor = color(random(0,360), random(50,85), random(75,100));
  String randColorHEX = hex(randColor);
  
  return randColorHEX;
  
}


Boolean doesColorExist(String _checkColor) {   //in HEX
  
  for (Map.Entry testColorsRow : testColors.entrySet()) {
    
    String testColors_ColorValue = testColorsRow.getValue().toString();
    
    if (testColors_ColorValue.equals(_checkColor) == true) {
      println("    Found COLOR: TRUE");
      return true;
    } 
    
  }
  
  println("    Found COLOR: FALSE");
  return false;
}


Boolean doesTestColorExist(int _testID) {
  
  for (Map.Entry testColorsRow : testColors.entrySet()) {
    
    int testColors_TestID = int(testColorsRow.getKey().toString());
    
    if (testColors_TestID == _testID) {
      
      resultColor = testColorsRow.getValue().toString();
      println("    Found ID: TRUE");
      return true;
    }
  }
  
  println("    Found ID: FALSE");
  return false;
  
}


String getColor(int _testID) {
  
  if(doesTestColorExist(_testID) == true) {
    
    return resultColor;
    
  } else {
    
    String newColor = generateRandomColor();
    
    while(doesColorExist(newColor)==true) {
      newColor = generateRandomColor();
      println("       !!!!!!! in RaNdOm COLOR loop!!");
    }
    
    testColors.put(_testID, newColor);
    
    return newColor;
    
  }
  
}
