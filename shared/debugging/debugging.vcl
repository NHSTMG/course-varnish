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

# We need to import the std VMOD for logging
import std;

sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #
    # You can do accounting or modifying the final object here.

    // An example of logging
    std.log("Now we're in vcl_deliver. The URL is: " + req.url);

    // Add log line with "URL: " + the request URL

    // Add log line with "UA: " + the User-Agent header of the request

    std.log("UA: " + req.http.User-Agent);

    // Add hit counter header to the response
    // for hits, add: "X-Cache: HIT #" + the number of hits so far
    // for misses, add: "X-Cache: MISS"

    // Also log a line with "HIT#: " + the number of hits

    if (obj.hits > 0) {
      set resp.http.X-Cache = "HIT #" + obj.hits;

      std.log("HIT#: " + obj.hits);

    } else {
      set resp.http.X-Cache = "MISS";
    }

}

