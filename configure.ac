AC_INIT([vsgi],[0.1.0],[self@antono.info],[vsgi])

AC_CONFIG_MACRO_DIR([.autocrap])
AC_CONFIG_AUX_DIR([.autocrap])

AC_CONFIG_SRCDIR([Makefile.am])
AM_INIT_AUTOMAKE([dist-bzip2 foreign])

AC_PROG_CC
AM_PROG_CC_C_O
AC_DISABLE_STATIC
LT_INIT

AC_PATH_PROG(VALAC, valac, valac)
AC_SUBST(VALAC)
AC_SUBST(CFLAGS)
AC_SUBST(CPPFLAGS)
AC_SUBST(LDFLAGS)
AC_SUBST(VALAFLAGS)

GOBJECT_INTROSPECTION_CHECK([1.30.0])

GLIB_REQUIRED=2.12.0

PKG_CHECK_MODULES(VSGI, glib-2.0 >= $GLIB_REQUIRED gobject-2.0 >= $GLIB_REQUIRED)
AC_SUBST(VSGI_CFLAGS)
AC_SUBST(VSGI_LIBS)
AC_PATH_PROG(PKG_CONFIG, pkg-config, no)

if test "x$PKG_CONFIG" = "xno"; then
	AC_MSG_ERROR([Cannot find the "pkg-config" program in your PATH])
fi

AC_PATH_PROG(VAPIGEN, vapigen, no)
if test "x$VAPIGEN" = "xno"; then
	AC_MSG_ERROR([Cannot find the "vapigen" binary in your PATH])
fi

VAPIDIR=`echo ${datadir}/vala/vapi`
AC_SUBST(VAPIDIR)

AC_CONFIG_FILES([Makefile test/Makefile src/Makefile vsgi-1.0.pc])
AC_OUTPUT

echo ""
echo "     Vala Server Gateway Interface"
echo ""
echo "       vapidir: ${VAPIDIR}"
echo "        prefix: ${prefix}"
echo ""
