#!/usr/bin/env bash

#Dir with git repo 
REPO="$HOME/.itgmania/Save"

cd "$REPO" || exit

#Check for changes
if git status --porcelain | grep -q .; then
	git add .
	git commit -m "Auto backup: $(date '+%Y-%m-%d')"
	git push --force
	echo "finished backing up itgmania"
fi

else 
	echo "no changes"
	exit 0
fi
