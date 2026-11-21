# Aide-mémoire du terminal Linux 

## Se déplacer 

| Commande             Ce qu'elle fait                           Exemple
| -------------------|-----------------------------------------|-------------|
| `pwd`              |   Affiche le dossier où je suis         |      `pwd`  |
|--------------------|-----------------------------------------|-------------| 
|  ls                |   Affiche le contenu du dossier         |     ls      |
|--------------------|-----------------------------------------|-------------|
|  ls -l             |Le contenu en détail : taille, date…     |    ls -l    |
|--------------------|-----------------------------------------|-------------|
|  ls -a             |Le contenu, y compris les fichiers cachés|    ls -a    |
|--------------------|-----------------------------------------|-------------|
|   cd dev           |Entre dans le dossier  dev               |     cd dev  |
|--------------------|-----------------------------------------|-------------|
|    cd ..           |Remonte d’un niveau                      |      cd ..  |
|--------------------|-----------------------------------------|-------------|
|    cd              |Revient au dossier personnel             |    cd       |
|--------------------|-----------------------------------------|-------------|
|   mkdir projet     |Crée le dossier  projet                  | mkdir projet|
|--------------------|-----------------------------------------|-------------|
|   clear            |Efface l'ecran                           | clear       |
|--------------------|-----------------------------------------|-------------|
|    whoami          |Affiche votre nom d’utilisateur          |  whoami     |
|--------------------|-----------------------------------------|-------------|

## Fichiers et dossiers

| Commande        | Ce qu'elle fait                           | Copie un fichier                           |
|-----------------|-------------------------------------------|--------------------------------------------|
| mkdir photos    | mkdir photos                              | mkdir photos                               |  
|-----------------|----------------------------------------------------------------------------------------|
| mkdir -p projet/assets/images| Crée plusieurs niveaux de dossiers d’un coup| mkdir -projet/assets/images | 
|-----------------|---------------------------------------------|------------------------------------------|
| touch vide.txt  |Crée un fichier vide                         |touch vide.txt                            |
|-----------------|---------------------------------------------|------------------------------------------|
|echo "Bonjour" > notes.txt|Crée un fichier qui contient une ligne de texte  |echo "Bonjour" > notes.txt   |
|-----------------|----------------------------------------------------------|-----------------------------|
|  .txt           |  Texte simple                                            |  .txt                       |
|-----------------|----------------------------------------------------------|-----------------------------|
|  .md            |Texte au format Markdown                                  |  .md                        |
|-----------------|----------------------------------------------------------|-----------------------------|
|  .js            | Programme JavaScript                                     |  .js                        |
|-----------------|----------------------------------------------------------|-----------------------------|
|   .log          |Journal d’une application                                 |    .log                     |
|-----------------|----------------------------------------------------------|-----------------------------|
|   .tar.gz       | Archive compressée                                       |  .tar.gz                    |
|-----------------|----------------------------------------------------------|-----------------------------|
|  rmdir photos   |Supprime un dossier vide                                  |  rmdir photos               |
|-----------------|----------------------------------------------------------|-----------------------------|
## Lire et chercher 

## Branches

git branch: Liste les branches. Une étoile  *  montre celle où vous êtes 
 git switch -c ajout-section:  Crée la branche  ajout-section  et va dessus ( -c  : create) 
 git switch main:  Va sur la branche  main  
 git merge ajout-section: Fusionne la branche  ajout-section  dans la branche où vous 
êtes 
 git branch -d ajout-section:  Supprime la branche  ajout-section , une fois qu’elle est 
fusionnée 
 git log --oneline --graph -all:  Dessine l’historique avec toutes les branches