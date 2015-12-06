#! /bin/bash

# copy dotfiles in files/ to the base of the user home directory

FILE_DIR="files"

if ! [ -d "$FILE_DIR" ]; then
	echo "run this script within the base of the git repository."
	exit
fi

cd $FILE_DIR

for FILE in *; do
	if [ -f $FILE ]; then
		echo "copying $FILE..."
		if [ -f  "$HOME/.$FILE" ]; then
			echo "$FILE already exists. backing up..."
			mv "$HOME/.$FILE" "$HOME/.$FILE""_$(date +%F)"
		fi
		cp "$FILE" "$HOME/.$FILE"
	fi
done

cd ../

echo "done."
