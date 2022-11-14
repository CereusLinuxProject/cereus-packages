hostmakedepends+=" cargo"

<<<<<<< HEAD
=======
if ! [[ "$pkgname" =~ ^cargo-auditable(-bootstrap)?$ ]]; then
	hostmakedepends+=" cargo-auditable"
fi

>>>>>>> upstream/master
if [ "$CROSS_BUILD" ]; then
	makedepends+=" rust-std"
fi

build_helper+=" rust"
