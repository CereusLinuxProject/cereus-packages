#
# This helper is for Raku package templates.
#

do_check() {
<<<<<<< HEAD
	RAKULIB=lib prove -r -e raku t/
=======
	RAKULIB=lib ${make_check_pre} prove -r -e raku t/
>>>>>>> upstream/master
}

do_install() {
	export RAKUDO_LOG_PRECOMP=1
	export RAKUDO_RERESOLVE_DEPENDENCIES=0
	raku-install-dist \
		--to=${DESTDIR}/usr/lib/raku/vendor \
		--for=vendor \
		--from=.
}
