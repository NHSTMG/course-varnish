#
# This is an example VCL file for Varnish.
#
# It does not do anything by default, delegating control to the
# builtin VCL. The builtin VCL is called when there is no explicit
# return statement.
#
# See the VCL chapters in the Users Guide at https://www.varnish-cache.org/docs/
# and https://www.varnish-cache.org/trac/wiki/VCLExamples for more examples.

# Marker to tell the VCL compiler that this VCL has been adapted to the
# new 4.0 format.
vcl 4.0;

# Default backend definition. Set this to point to your content server.
backend default {
    .host = "127.0.0.1";
    .port = "80";
}

sub vcl_recv {
    # Happens before we check if we have this in cache already.
    #
    # Typically you clean up the request here, removing cookies you don't need,
    # rewriting the request, etc.

    unset req.http.Cookie;

    if(req.url == "/synth/error/") {
        return(synth(418, "This is an error"));
    } else if(req.url == "/synth/content/") {
        return(synth(720));
    } else if(req.url == "/synth/redirect/") {
        return(synth(721));
    }
}

sub vcl_backend_response {
    # Happens after we have read the response headers from the backend.
    #
    # Here you clean the response headers, removing silly Set-Cookie headers
    # and other mistakes your backend does.
}

sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #
    # You can do accounting or modifying the final object here.
}


import std;

sub vcl_synth {

  if(resp.status == 720) {

    // Respond with the file: /home/ubuntu/shared/synth/content.html

    set resp.status = 404;
    synthetic(std.fileread("/home/ubuntu/shared/synth/content.html"));
    return (deliver);
    
  } else if(resp.status == 721) {

    set resp.http.Location = "/synth/content/";
    set resp.status = 302;
    return (deliver);

  }
}