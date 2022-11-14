#
# This helper is for templates using GNU Makefiles.
#
do_build() {
	: ${make_cmd:=make}

	if [ -z "$make_use_env" ]; then
		${make_cmd} \
			CC="$CC" CXX="$CXX" LD="$LD" AR="$AR" RANLIB="$RANLIB" \
			CPP="$CPP" AS="$AS" OBJCOPY="$OBJCOPY" OBJDUMP="$OBJDUMP" \
			CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS" \
<<<<<<< HEAD
			${makejobs} ${make_build_args} ${make_build_target}
	else
=======
			PREFIX=/usr prefix=/usr \
			${makejobs} ${make_build_args} ${make_build_target}
	else
		export PREFIX=/usr prefix=/usr
>>>>>>> upstream/master
		${make_cmd} ${makejobs} ${make_build_args} ${make_build_target}
	fi
}

do_check() {
	if [ -z "$make_cmd" ] && [ -z "$make_check_target" ]; then 
		if make -q check 2>/dev/null; then
			:
		else
			if [ $? -eq 2 ]; then
				msg_warn 'No target to "make check".\n'
				return 0
			fi
		fi
	fi

	: ${make_cmd:=make}
	: ${make_check_target:=check}

<<<<<<< HEAD
	${make_cmd} ${make_check_args} ${make_check_target}
=======
	${make_check_pre} ${make_cmd} ${makejobs} ${make_check_args} ${make_check_target}
>>>>>>> upstream/master
}

do_install() {
	: ${make_cmd:=make}
	: ${make_install_target:=install}

<<<<<<< HEAD
	${make_cmd} STRIP=true PREFIX=/usr DESTDIR=${DESTDIR} ${make_install_args} ${make_install_target}
=======
	${make_cmd} STRIP=true PREFIX=/usr prefix=/usr DESTDIR=${DESTDIR} ${make_install_args} ${make_install_target}
>>>>>>> upstream/master
}
