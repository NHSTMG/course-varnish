vcl 4.0;

backend dn {
    .host = "www.dn.no";
    .port = "80";
}

sub vcl_recv {
    set req.backend_hint = dn;
    set req.http.host = "www.dn.no";
}