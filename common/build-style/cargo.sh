#
# This helper is for building rust projects which use cargo for building
#

do_build() {
<<<<<<< HEAD
	: ${make_cmd:=cargo}
=======
	: ${make_cmd:=cargo auditable}
>>>>>>> upstream/master

	${make_cmd} build --release --target ${RUST_TARGET} ${configure_args}
}

do_check() {
<<<<<<< HEAD
	: ${make_cmd:=cargo}

	${make_cmd} test --release --target ${RUST_TARGET} ${configure_args} \
=======
	: ${make_cmd:=cargo auditable}

	${make_check_pre} ${make_cmd} test --release --target ${RUST_TARGET} ${configure_args} \
>>>>>>> upstream/master
		${make_check_args}
}

do_install() {
<<<<<<< HEAD
	: ${make_cmd:=cargo}
	: ${make_install_args:=--path .}

	${make_cmd} install --target ${RUST_TARGET} --root="${DESTDIR}/usr" \
		--locked ${configure_args} ${make_install_args}
=======
	: ${make_cmd:=cargo auditable}
	: ${make_install_args:=--path .}

	${make_cmd} install --target ${RUST_TARGET} --root="${DESTDIR}/usr" \
		--offline --locked ${configure_args} ${make_install_args}
>>>>>>> upstream/master

	rm -f "${DESTDIR}"/usr/.crates.toml
	rm -f "${DESTDIR}"/usr/.crates2.json
}
