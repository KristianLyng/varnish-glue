# Generic function to enable redirect from vcl_recv
sub vcl_synth {
        if (resp.status == 301 || resp.status == 302) {
                set resp.http.location = req.http.location;
                return (deliver);
        }
}

