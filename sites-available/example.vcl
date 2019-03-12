# Example of a reasonable site definition

# Define the backend
backend example {
    .host = "example.com";
    .port = "80";
}

# Modify the _client_ request, before 
sub vcl_recv {
    if (req.http.host ~ "^(www\.)?example\.com$") {
        set req.http.X-test = "Set a header";
        unset req.http.Cookie;
        unset req.http.Authorize;
        set req.backend_hint = example;
    }
}

# Modify the backend response - if it's 200 OK and less than 5s ttl, force
# cache. 
sub vcl_backend_response {
    if (bereq.http.host ~ "^(www\.)?example\.com$") {
        if (beresp.status == 200 && beresp.ttl < 5s) {
            set beresp.ttl = 20s;
        }
    }
}

