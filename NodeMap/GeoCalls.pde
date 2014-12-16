
/*==========  Variables  ==========*/

double toponymLongitude;
double toponymLatitude;

String lastSearch = null;



/*==========  Functions  ==========*/

void coordinateLookup(String searchName) {
  
  if (lastSearch == null || lastSearch.equals(searchName) == false) {
      
      lastSearch = searchName;
      
      searchCriteria.setQ(searchName);
      searchCriteria.setMaxRows(1);
    
      try {
          println("*** Coordinate lookup call ***");        
          ToponymSearchResult searchResult = WebService.search(searchCriteria);     // a toponym search result returned by the geonames webservice
     
          for (Toponym toponym : searchResult.getToponyms()) {
              //println(toponym.getName() + " " + toponym.getCountryName() + " " + toponym.getLongitude() + " " + toponym.getLatitude()); // prints the search results
              toponymLongitude = toponym.getLongitude();
              toponymLatitude = toponym.getLatitude();
          }
     
      } catch (Exception e) {
          e.printStackTrace();
      } 
      
  }
  
}

double getLatitude() {
    return toponymLatitude;
}

double getLongitude() {
  return toponymLongitude;
}
