ACLOCAL_AMFLAGS = -I./.autocrap

SUBDIRS = src test

pkgconfig_DATA= vsgi-1.0.pc
pkgconfigdir = $(libdir)/pkgconfig

vsgidocdir = ${prefix}/doc/vsgi
vsgidoc_DATA = README.md COPYING

EXTRA_DIST = $(vsgidoc_DATA) ./autogen.sh
DISTCLEANFILES =

CLEANFILES = *.log *.status \
	./configure vsgi-1.0.pc libtool \
	Makefile.in aclocal.m4 Makefile
