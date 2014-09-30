/******************************************
*****        MATIAS SEIJAS       **********
*****      September 30, 2014    **********
******************************************/


/******************************************
    VARIABLES
******************************************/
boolean autoMode = false;


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
  if (autoMode == true) {
    new myDrop(random(0,255),random(0,255),255, random(0, width), random(0,height));
  }
}



/******************************************
    INTERACTIONS
******************************************/

void mousePressed() { 
  new myDrop(random(0,255),random(0,255),255, mouseX, mouseY);
}

void keyPressed() {
  // ** Clear ** //
  if (key == 'a') {
    background(0);
  }
  
  // ** Pause ** //
  if (key == 's') {
    autoMode = true;
    //noLoop();
  }
  
  // ** Play ** //
  if (key == 'd') {
    autoMode = false;
    //loop();
  }
}
