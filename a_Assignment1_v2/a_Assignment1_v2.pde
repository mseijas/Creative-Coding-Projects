/******************************************
*****        MATIAS SEIJAS       **********
*****      September 30, 2014    **********
******************************************/


/******************************************
    VARIABLES
******************************************/



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
  new myDrop(random(0,255),random(0,255),255, random(0, width), random(0,height));
}



/******************************************
    INTERACTIONS
******************************************/

void mousePressed() { 
  new myDrop(random(0,255),random(0,255),255, mouseX, mouseY);
}

void keyPressed() {
  background(0);
}
