# This hook applies patches from "patches" directory.

_process_patch() {
	local _args= _patch= i=$1

	_args="-Np1"
	_patch=${i##*/}

<<<<<<< HEAD
	if [ -f $PATCHESDIR/${_patch}.args ]; then
		_args=$(<$PATCHESDIR/${_patch}.args)
	elif [ -n "$patch_args" ]; then
		_args=$patch_args
	fi
	cp -f $i "$wrksrc"

	# Try to guess if its a compressed patch.
	if [[ $f =~ .gz$ ]]; then
		gunzip "$wrksrc/${_patch}"
		_patch=${_patch%%.gz}
	elif [[ $f =~ .bz2$ ]]; then
		bunzip2 "$wrksrc/${_patch}"
		_patch=${_patch%%.bz2}
	elif [[ $f =~ .diff$ ]]; then
		:
	elif [[ $f =~ .patch$ ]]; then
=======
	if [ -f "$PATCHESDIR/${_patch}.args" ]; then
		_args=$(<"$PATCHESDIR/${_patch}.args")
	elif [ -n "$patch_args" ]; then
		_args=$patch_args
	fi
	cp -f "$i" "$wrksrc"

	# Try to guess if its a compressed patch.
	if [[ $i =~ .gz$ ]]; then
		gunzip "$wrksrc/${_patch}"
		_patch=${_patch%%.gz}
	elif [[ $i =~ .bz2$ ]]; then
		bunzip2 "$wrksrc/${_patch}"
		_patch=${_patch%%.bz2}
	elif [[ $i =~ .diff$ ]]; then
		:
	elif [[ $i =~ .patch$ ]]; then
>>>>>>> upstream/master
		:
	else
		msg_warn "$pkgver: unknown patch type: $i.\n"
		return 0
	fi

	cd "$wrksrc"
	msg_normal "$pkgver: patching: ${_patch}.\n"
<<<<<<< HEAD
	patch -s ${_args} -i ${_patch} 2>/dev/null
=======
	patch -s ${_args} <"${_patch}" 2>/dev/null
>>>>>>> upstream/master
}

hook() {
	if [ ! -d "$wrksrc" ]; then
		return 0
	fi
	if [ -r $PATCHESDIR/series ]; then
		while read -r f; do
			_process_patch "$PATCHESDIR/$f"
		done < $PATCHESDIR/series
	else
		for f in $PATCHESDIR/*; do
<<<<<<< HEAD
			[ ! -f $f ] && continue
			if [[ $f =~ ^.*.args$ ]]; then
				continue
			fi
			_process_patch $f
=======
			[ ! -f "$f" ] && continue
			if [[ $f =~ ^.*.args$ ]]; then
				continue
			fi
			_process_patch "$f"
>>>>>>> upstream/master
		done
	fi
}
