#!/bin/bash

#####

echo "Generating .pot file..."

xgettext --files-from=POTFILES.in --from-code=UTF-8 --output=add-on-desktop@maestroschan.fr/locale/add-on-desktop.pot

#####

IFS='
'
liste=`ls ./locale/`
prefix="./locale"

for dossier in $liste
do
	if [ "$dossier" != "add-on-desktop.pot" ]; then
		echo "Updating translation for: $dossier"
		msgmerge -N $prefix/$dossier/LC_MESSAGES/add-on-desktop.po $prefix/add-on-desktop.pot > $prefix/$dossier/LC_MESSAGES/add-on-desktop.temp.po
		mv $prefix/$dossier/LC_MESSAGES/add-on-desktop.temp.po $prefix/$dossier/LC_MESSAGES/add-on-desktop.po
		echo "Compiling translation for: $dossier"
		msgfmt $prefix/$dossier/LC_MESSAGES/add-on-desktop.po -o $prefix/$dossier/LC_MESSAGES/add-on-desktop.mo
	fi
done

#####

exit 0
