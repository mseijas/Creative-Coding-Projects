import http.requests.*;

public void setup() 
{

PostRequest post = new PostRequest("https://ioqa.catchpoint.com/HawkUI/api/token");
post.addData("grant_type", "client_credentials");
post.addData("client_id", "R4-Bt-jR0MGwfPR6");
post.addData("client_secret", "f8a5082e-d540-43cf-a2e0-71b8d7e1807e");
post.send();
println("Reponse Content: " + post.getContent());
println("Reponse Content-Length Header: " + post.getHeader("Content-Length"));

/*JSONObject response = parseJSONObject(post.getContent());
println(response);*/


/*	
  GetRequest get = new GetRequest("http://connect.doodle3d.com/api/list.example");
  get.send(); // program will wait untill the request is completed
  println("response: " + get.getContent());

  JSONObject response = parseJSONObject(get.getContent());
  println("status: " + response.getString("status"));
  JSONArray boxes = response.getJSONArray("data");
  println("boxes: ");
  for(int i=0;i<boxes.size();i++) {
    JSONObject box = boxes.getJSONObject(i);
    println("  wifiboxid: " + box.getString("wifiboxid"));
  }*/
}
