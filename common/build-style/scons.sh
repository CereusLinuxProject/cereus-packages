#
# This helper is for templates using scons.
#
do_build() {
	: ${make_cmd:=scons}

	${make_cmd} ${makejobs} CC=$CC CXX=$CXX CCFLAGS="$CFLAGS" \
		cc=$CC cxx=$CXX ccflags="$CFLAGS" \
		CXXFLAGS="$CXXFLAGS" LINKFLAGS="$LDFLAGS" \
		cxxflags="$CXXFLAGS" linkflags="$LDFLAGS" \
		RANLIB="$RANLIB" ranlib="$RANLIB" \
<<<<<<< HEAD
		prefix=/usr destdir=${DESTDIR} DESTDIR=${DESTDIR} \
=======
		prefix=/usr \
		${scons_use_destdir:+DESTDIR="${DESTDIR}"} \
		${scons_use_destdir:+destdir="${DESTDIR}"} \
>>>>>>> upstream/master
		${make_build_args} ${make_build_target}
}
do_install() {
	: ${make_cmd:=scons}
	: ${make_install_target:=install}

<<<<<<< HEAD
=======
	local _sandbox=

	if [ -z "$scons_use_destdir" ]; then _sandbox=yes ; fi

>>>>>>> upstream/master
	${make_cmd} ${makejobs} CC=$CC CXX=$CXX CCFLAGS="$CFLAGS" \
		cc=$CC cxx=$CXX ccflags="$CFLAGS" \
		CXXFLAGS="$CXXFLAGS" LINKFLAGS="$LDFLAGS" \
		cxxflags="$CXXFLAGS" linkflags="$LDFLAGS" \
		RANLIB="$RANLIB" ranlib="$RANLIB" \
<<<<<<< HEAD
		prefix=/usr destdir=${DESTDIR} DESTDIR=${DESTDIR} \
=======
		prefix=/usr \
		${scons_use_destdir:+DESTDIR="${DESTDIR}"} \
		${scons_use_destdir:+destdir="${DESTDIR}"} \
		${_sandbox:+--install-sandbox="${DESTDIR}"} \
>>>>>>> upstream/master
		${make_install_args} ${make_install_target}
}
