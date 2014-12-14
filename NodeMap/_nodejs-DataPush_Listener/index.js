var http = require('http');
var querystring = require('querystring');

var lastReq;


function processPost(request, response, callback) {
    var queryData = "";
    if(typeof callback !== 'function') return null;

    if(request.method == 'POST') {
        request.on('data', function(data) {
            queryData += data;
            if(queryData.length > 1e6) {
                queryData = "";
                response.writeHead(413, {'Content-Type': 'text/plain'}).end();
                request.connection.destroy();
            }
        });

        request.on('end', function() {
            request.post = tryParseJSON(queryData);
            lastReq = queryData;

            callback();
        });

    } else {
        response.writeHead(405, {'Content-Type': 'text/plain'});
        response.end();
    }
}

function tryParseJSON(str) {
	try {
		return JSON.parse(str);
	} catch (ex) {
		return querystring.parse(str);
	}
}

http.createServer(function(request, response) {
    if(request.method == 'POST') {
        processPost(request, response, function() {
            console.log(request.post);
            
            // Use request.post here
            response.writeHead(200, "OK", {'Content-Type': 'text/plain'});
            response.end();

        });
    } else {
        
        if(lastReq) {
        	response.writeHead(200, {
        		'Content-Length': lastReq.length,
        		'Content-Type': 'text/plain'
        	});

        	response.write(lastReq);
        } else {
        	response.writeHead(200, "OK", {'Content-Type': 'text/plain'});
        }

        response.end();
    }

}).listen(process.env.PORT || 3000);
console.log("Listening on 3000, or " + process.env.PORT);