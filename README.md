# VSGI - Vala Server Gateway Interface

Unified Web Server Interface for Vala.

## Prior Art

- [WSGI](http://www.wsgi.org/)
  [spec](http://www.python.org/dev/peps/pep-0333/)
  for Python
- [Rack](http://rack.rubyforge.org/)
  [spec](http://rack.rubyforge.org/doc/SPEC.html)
  for Ruby
- [JSGI](http://wiki.commonjs.org/wiki/JSGI)
  [spec](http://wiki.commonjs.org/wiki/JSGI/Level0/A/Draft2)
  for CommonJS


## Goals

The goal of this standartization is stackable apps/middleware:

```
   Request   Response
      |         |
    (App1)   (App1)
      |         |
     ...       ...
      |         |
    (AppN)   (AppN)
      \......../

```

First column is Request processing and second is Resposne
processing.

In this scheme `App1` may perform Etag generation, `App2`
may handle HTTP authentication `App3` may perform request
logging and so on. App = Middleware in this case. Each app
may stop the chain and return response if needed. This way
each VSGI conforming App may be dropped in your VSGI app
and reused consistently.

This allows us to mount modules on different urls as (pseudocode):

    app.use(CookieSessionStore)
    app.use(HttpCaching)
    app.mount('/login', AuthenticationApp)
    app.mount('/forum', ForumApp)


Also. It should be possible to mout VSGI middleware/apps into existing
python/ruby/javascript apps with thin integration for JSGI, Rack and WSGI.





## Specification

```vala
interface VSGI.App {
    public virtual void process_request(Request req);
    public virtual void process_response(Response res);
}
```


In real apps it should work like:

```vala
var apps = new Array<VSGI.App>();

// ... setup and push some apps

var req = new VSGI.Request();

foreach (app in apps) {
   app.process_request (req);
}

var res = new VSGI.Response();

foreach (app in apps.reverse()) {
   app.process_response(res);
}
```


In each case `Request` and `Response` are adapter specific
but work consistently for CGI, FastCGI, uWSGI, SCGI and Soup.

Internally `Request` and `Response` modify variables from
`VSGI.Environment`.


## VSGI.Envirnoment

### Variables

The environment must be an instance of
[GLib.HashTable][HashTable] that includes CGI-like headers. The
application is free to modify the environment.  The environment is
required to include these variables except when they’d be empty:

- REQUEST\_METHOD: The HTTP request method, such as "GET" or "POST".
  This cannot ever be an empty string, and so is always required.
- SCRIPT\_NAME:	The initial portion of the request URL’s "path" that
  corresponds to the application object, so that the application
  knows its virtual "location". This may be an empty string, if the
  application corresponds to the "root" of the server.
- PATH\_INFO: The remainder of the request URL’s "path", designating
  the virtual "location" of the request’s target within the application.
  This may be an empty string, if the request URL targets the application
  root and does not have a trailing slash. This value may be
  percent-encoded when I originating from a URL.
- QUERY\_STRING: The portion of the request URL that follows the ?,
  if any. May be empty, but is always required!
- SERVER\_NAME, SERVER\_PORT: When combined with SCRIPT\_NAME
  and PATH\_INFO, these variables can be used to complete the URL.
  Note, however, that HTTP\_HOST, if present, should be used in
  preference to SERVER\_NAME for reconstructing the request URL.
  SERVER\_NAME and SERVER\_PORT can never be empty strings, and so
  are always required.
- HTTP\_Variables: Variables corresponding to the client-supplied
  HTTP request headers (i.e., variables whose names begin with HTTP_).
  The presence or absence of these variables should correspond with
  the presence or absence of the appropriate HTTP header in the request.


## The Response

Should implement VSGI.Response interface.

## The Request

Should implement VSGI.Request interface.


[HashTable]: http://www.valadoc.org/glib-2.0/GLib.HashTable.html
