#!/usr/bin/env bash

# Script to check git status and auto commit any changes to Github

#Dir with git repo 
REPO="$HOME/.itgmania/Save"

cd "$REPO" || exit

rm -f .git/index.lock
git merge --abort 2>/dev/null || true
git rebase --abort 2>/dev/null || true

timeout 120 bash -c '
#Check for changes
	if git status --porcelain | grep -q .; then
		git add .
		git commit -m "Auto backup: $(date '+%Y-%m-%d')"
		git push --force
		echo "finished backing up itgmania"

	else 
		echo "no changes"
		exit 0
	fi
'
