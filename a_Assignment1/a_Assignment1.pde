/******************************************
*****        MATIAS SEIJAS       **********
*****      September 30, 2014    **********
******************************************/


/******************************************
    VARIABLES
******************************************/

int numCircles = 30;
int radius = 300;
int alpha = 0;
float red = 255, green = 255, blue = 255;
float posX = width/2;
float posY = height/2;



/******************************************
    SETUP
******************************************/

void setup (){
  size(800, 800);        //set background size
  background(0);         //set background color to black
  ellipseMode(CENTER);   //set draw ellipse mode to CENTER
  noFill();              //set default fill for shapes as noFill
}



/******************************************
    DRAW
******************************************/

void draw() {
  makeCircles(random(0,255),random(0,255),255, random(0, width), random(0,height));
}



/******************************************
    FUNCTION TO MAKE CONCENTRIC CIRCLES
******************************************/

void makeCircles(float red, float green, float blue, float posX, float posY) {
  println("*** START LOOP ***");
  
  for (int i=0; i<numCircles*2; i++) {    //run the loop for twice as many circles as i've specified
    
    /*** Get some stats ***/
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
  
  println("*** END LOOP ***");
}




/******************************************
    INTERACTIONS
******************************************/

void mousePressed() {
  makeCircles(random(0,255),random(0,255),255, mouseX, mouseY);
}

void keyPressed() {
  background(0);
}
