AM_CPPFLAGS = $(VSGI_CFLAGS)

lib_LTLIBRARIES = libvsgi-1.0.la

libvsgi_1_0_la_VALAFLAGS = \
	--library vsgi \
	--gir Vsgi-1.0.gir \
	--vapi vsgi-1.0.vapi \
	-H vsgi.h

libvsgi_1_0_la_SOURCES = $(wildcad *.vala)

libvsgi_1_0_la_LIBADD = $(VSGI_LIBS)

CLEANFILES = *.c *.gir *.vapi *.h *.stamp *.in Makefile
