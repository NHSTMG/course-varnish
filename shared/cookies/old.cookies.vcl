vcl 4.0;

backend course_backend {
    .host = "localhost";
    .port = "80";
}

sub vcl_recv {
    set req.backend_hint = course_backend;
}
