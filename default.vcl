# This is the top-level config for varnish-glue.
# You should not make significant changes here, instead, make them in
# either conf-available/ or sites-available/, then use the appropriate
# scripts to, well, enable it.

vcl 4.0;
import std;

include "/etc/varnish/auto-includes.vcl";
