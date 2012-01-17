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

## Specification

## VSGI.App

A VSGI application is an object instance that implements 
VSGI.App interface.

VSGI Middleware are VSGI Applications that can call other
VSGI Applications. Middleware can be stacked up into a
call chain to provide useful services to Requests and Responses.

## VSGI.Env

### Variables

The environment must be an instance of `GHashTable` that includes
CGI-like headers. The application is free to modify the environment.
The environment is required to include these variables except
when they’d be empty:

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

### The Input Stream

The input stream implements
[GLib.InputStream](http://www.valadoc.org/gio-2.0/GLib.InputStream.html)
interface which contains the raw HTTP POST data.

## The Response

Should implement VSGI.Response interface.

## The Request

Should implement VSGI.Request interface.
