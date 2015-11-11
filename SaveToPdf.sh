#!/bin/bash
# auteur: ledudulela
# version: 1.1
# màj: 2015-06-27 22:30
# objet: Convertit les fichiers sélectionnés en Pdf
OLD_IFS="$IFS"
IFS='
'
arrFilePaths=( $CAJA_SCRIPT_SELECTED_FILE_PATHS )
IFS="$OLD_IFS"
for selectedFile in "${arrFilePaths[@]}"
do
	fname=$(basename "$selectedFile")
	fbase=$(basename "$selectedFile" | awk -F "." '{print $1}')
	fext=$(basename "$selectedFile" | awk -F "." '{print $NF}')
	if [ $fext = "jpeg" ]
	then
		fsfx="_jpeg"
	else
		fsfx=""
	fi
	if [ $fext = "pdf" ]
	then
		zenity --info --title="Conversion" --text="Ce fichier est déjà un Pdf.\n"	
	else
		lpr -P PDF "$selectedFile"
		zenity --info --title="Conversion" --text="Conversion de $fname terminée.\n"
		fpdf="$HOME/PDF/$fbase$fsfx.pdf"
		ffinal="$fbase.pdf"
		if [ -f $ffinal ] # si le fichier fichier existe et n'est pas un répertoire
		then
			zenity --question --title="Conversion" --text="Le fichier $ffinal existe déjà.\n Voulez vous le remplacer ?"
			if [ $? = 0 ]
			then
				mv -f $fpdf "./$ffinal"
			fi
		else
			mv -f $fpdf "./$ffinal"
		fi
	fi
done
exit

