
/*==========  Variables  ==========*/

JSONObject jsonSettings;
String serverPath;



/*==========  Functions  ==========*/

void initSettings() {
  jsonSettings = loadJSONObject("settings.json");
  
  serverPath = jsonSettings.getString("server-path");
  
  println("Listening on: " + serverPath);
}
