#!/bin/sh
#
# changed_templates.sh

<<<<<<< HEAD
if command -v chroot-git >/dev/null 2>&1; then
	GIT_CMD=$(command -v chroot-git)
elif command -v git >/dev/null 2>&1; then
	GIT_CMD=$(command -v git)
fi

tip="$($GIT_CMD rev-list -1 --parents HEAD)"
case "$tip" in
	*" "*" "*) tip="${tip##* }" ;;
	*)         tip="${tip%% *}" ;;
esac

base="$($GIT_CMD merge-base FETCH_HEAD "$tip")" || {
=======
tip="$(git rev-list -1 --parents HEAD)"
case "$tip" in
	# This is a merge commit, pick last parent
	*" "*" "*) tip="${tip##* }" ;;
	# This is a non-merge commit, pick itself
	*)         tip="${tip%% *}" ;;
esac

base="$(git merge-base FETCH_HEAD "$tip")" || {
>>>>>>> upstream/master
	echo "Your branches is based on too old copy."
	echo "Please rebase to newest copy."
	exit 1
}

echo "$base $tip" >/tmp/revisions

/bin/echo -e '\x1b[32mChanged packages:\x1b[0m'
<<<<<<< HEAD
$GIT_CMD diff-tree -r --no-renames --name-only --diff-filter=AM \
=======
git diff-tree -r --no-renames --name-only --diff-filter=AM \
>>>>>>> upstream/master
	"$base" "$tip" \
	-- 'srcpkgs/*/template' |
	cut -d/ -f 2 |
	tee /tmp/templates |
	sed "s/^/  /" >&2
