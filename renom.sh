#!/bin/bash

# Recorrem tots els directoris de l'espai actual
for dir in */; do
    # Eliminem la barra inclinada final del nom del directori per gestionar-lo millor
    dir_name="${dir%/}"
    
    # Verifiquem si existeix el fitxer meta.json dins de la carpeta [4]
    if [ -f "$dir_name/meta.json" ]; then
        
        # Extraiem el camp publishedDate utilitzant jq [5, 6]
        # L'opció -r ens dóna el text net sense cometes [5, 7]
        raw_date=$(jq -r '.publishedDate' "$dir_name/meta.json")
        
        # Si la data no està buida, la processem
        if [ "$raw_date" != "null" ]; then
            # Transformem "2007-05-02T19:03:00" en "2007_05_02"
            # Primer tallem per la 'T' per quedar-nos amb la data i després canviem '-' per '_'
            clean_date=$(echo "$raw_date" | cut -d'T' -f1 | tr '-' '_')
            
            # Creem el nou nom combinant la data i el nom original
            new_name="${clean_date}_${dir_name}"
            
            # Renomenem el directori [4]
            echo "Renomenant: $dir_name -> $new_name"
            mv "$dir_name" "$new_name"
        fi
    fi
done
