/*===================================
=            NODE MAP               =
=          Matias Seijas            =
=           Dec 16, 2014            =
===================================*/

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*; 
import de.fhpotsdam.unfolding.data.*; 
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.marker.MarkerManager;
import de.fhpotsdam.unfolding.providers.MBTilesMapProvider;
import org.geonames.*;  



/*==========  Variables  ==========*/

UnfoldingMap map;
MarkerManager<Marker> markerManager;
ToponymSearchCriteria searchCriteria = new ToponymSearchCriteria();

PFont sansSerif;
int legendY;

boolean fullScreen = false;                             // ** Uncomment for Window frame
//boolean fullScreen = true;                            // ** Uncomment for Full Screen



/*==========  Functions  ==========*/

void setup() {
  
  size(1024, 800, JAVA2D);                             // ** Uncomment for Window frame
  //size(displayWidth, displayHeight, JAVA2D);         // ** Uncomment for Full Screen
 
  frame.setBackground(new java.awt.Color(0, 20, 33)); 
  frameRate(60);
  noStroke(); 
  smooth();
  
  legendY = height-6;
  
  WebService.setUserName("matiseijas");
  
  String mbTilesString = sketchPath("data/nodemap.mbtiles");
  map = new UnfoldingMap(this, new MBTilesMapProvider(mbTilesString));
  MapUtils.createDefaultEventDispatcher(this, map);

  map.setBackgroundColor(color(0, 20, 33));
  map.zoomAndPanTo(2, new Location(42, 0));
  map.setZoomRange(2, 4);
  
  sansSerif = loadFont("SansSerif-11.vlw");
  textFont(sansSerif);
  textAlign(LEFT);
  textSize(11);
  
  ellipseMode(CORNER);
 
}


void draw() {
  
  map.draw();
 
  fill(0, 0, 0, 87);
  rect(0, legendY-15, width, 21);

  createMarker();
  
}


boolean sketchFullScreen() {
  return fullScreen;
}

