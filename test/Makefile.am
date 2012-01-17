AM_CPPFLAGS = $(VSGI_CFLAGS) -I$(top_srcdir)/src

TESTS = app-test request-test response-test env-test
LDADD = $(top_builddir)/src/libvsgi-1.0.la $(VSGI_LIBS)
VAPI  = $(top_builddir)/src/vsgi-1.0.vapi

check_PROGRAMS = $(TESTS)

app_test_SOURCES = app_test.vala
app_test_LDADD = $(LDADD)
app_test_VALAFLAGS = $(VAPI)

request_test_SOURCES = request_test.vala
request_test_LDADD = $(LDADD)
request_test_VALAFLAGS = $(VAPI)

response_test_SOURCES = response_test.vala
response_test_LDADD = $(LDADD)
response_test_VALAFLAGS = $(VAPI)

env_test_SOURCES = env_test.vala
env_test_LDADD = $(LDADD)
env_test_VALAFLAGS = $(VAPI)

CLEANFILES = $(VSGI_TESTS) *.c *.stamp *.xml *.html *.in Makefile
