# Script SaveToPdf
Objet: A partir du gestionnaire de fichiers Caja, convertit le fichier sélectionné en PDF.

Dépendances: zenity

--

Le script est à placer de préférence dans le répertoire /usr/local/bin/ 

**Pour être appelé depuis le gestionnaire de fichiers:**

Par exemple pour Caja, en créant un lien symbolique vers /usr/local/bin/SaveToPdf.sh

dans le répertoire /home/utilisateur/.config/caja/scripts

et en nommant ce lien symbolique "Convertir en PDF", il apparaitra en faisant un
 clic-droit sur un fichier dans Caja, un sous-menu Scripts > Convertir en PDF

*ln -s "/usr/local/bin/SaveToPdf.sh" "$HOME/.config/caja/scripts/Convertir en PDF"*

