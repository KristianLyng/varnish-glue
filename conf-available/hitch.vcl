sub vcl_recv {
    # Redirect HTTP to HTTPS
    if (std.port(server.ip) != 443) {
        set req.http.location = "https://" + req.http.host + req.url;
        return(synth(301));
    }
}
