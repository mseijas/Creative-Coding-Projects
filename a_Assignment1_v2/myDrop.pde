class myDrop {
  
  /******************************************
    PROPERTIES
  ******************************************/
  int numCircles = 30;
  int radius = 300;
  int alpha = 0;
  
  
  /******************************************
    CONSTRUCTOR FUNCTION
  ******************************************/
  myDrop(float red, float green, float blue, float posX, float posY){
    //println("*** START LOOP ***");
    
    for (int i=0; i<numCircles*2; i++) {    //run the loop for twice as many circles as i've specified
      
      /*** Get some stats ***
         print(i); print("   -   ");
         print("Radius: ");
         print(radius);
         print("  -  ");
         print("Alpha: ");
         println(alpha);
      /*********************/
      
      pushMatrix();
      stroke(red, green, blue, alpha);      //set the sroke color
      ellipse(posX, posY, radius, radius);  //draw an ellipse
      popMatrix();
      
      radius -= radius/numCircles;          //decrease the radius for the next ellipse
      alpha += 100/numCircles;              //decrease the alpha value by 1 step
    }
    alpha = 0;          //reset alpha after exiting loop
    radius = 300;       //reset radius after exiting loop
    
    //println("*** END LOOP ***");
  }
   
}
