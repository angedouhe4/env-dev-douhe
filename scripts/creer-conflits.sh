#!/bin/bash
# Crée un dépôt Git d'entraînement qui contient des branches à fusionner, dont deux en conflit.
#
# Usage (dans Ubuntu, depuis le dossier où se trouve ce fichier) :
#   bash creer-conflits.sh       scénario 1 : le menu du maquis (séance 2)        → ~/dev/exo-conflits
#   bash creer-conflits.sh 2     scénario 2 : les portes ouvertes (séance 3)      → ~/dev/exo-conflits-2
#
# Dans chaque scénario, l'étudiant fusionne trois branches dans main, dans l'ordre affiché à la fin :
# la première se fusionne toute seule, les deux suivantes provoquent un conflit.
set -e

SCENARIO="${1:-1}"

# Les commits de préparation sont signés « Formateur IFRAN », même si Git n'est pas encore configuré
export GIT_AUTHOR_NAME="Formateur IFRAN" GIT_AUTHOR_EMAIL="formateur@ifran.example"
export GIT_COMMITTER_NAME="Formateur IFRAN" GIT_COMMITTER_EMAIL="formateur@ifran.example"

case "$SCENARIO" in
  1)
    DOSSIER="$HOME/dev/exo-conflits"
    FICHIER="menu.md"
    ORDRE="horaires, puis prix, puis boissons"
    ;;
  2)
    DOSSIER="$HOME/dev/exo-conflits-2"
    FICHIER="programme.md"
    ORDRE="date, puis salle, puis contact"
    ;;
  *)
    echo "Scénario inconnu : $SCENARIO (choisir 1 ou 2)"
    exit 1
    ;;
esac

if [ -e "$DOSSIER" ]; then
  echo "Le dossier $DOSSIER existe déjà."
  echo "Pour recommencer, supprimez-le d'abord : rm -rf $DOSSIER"
  exit 1
fi

mkdir -p "$DOSSIER"
cd "$DOSSIER"
git init -q -b main

# Écrit le contenu reçu sur l'entrée standard dans le fichier, puis enregistre un commit
ecrire_et_enregistrer() {
  cat > "$FICHIER"
  git add "$FICHIER"
  git commit -q -m "$1"
}

if [ "$SCENARIO" = 1 ]; then
  ecrire_et_enregistrer "Crée le menu du maquis" <<'FIN'
# Menu du maquis Chez Awa

Ouvert du lundi au samedi, de 11 h à 22 h.

## Plats

- Attiéké poisson : 1500 FCFA
- Garba : 1000 FCFA
- Alloco : 500 FCFA
FIN

  git switch -q -c horaires
  sed -i.bak 's/^Ouvert du lundi au samedi, de 11 h à 22 h\.$/Ouvert tous les jours, de 10 h à 23 h./' "$FICHIER" && rm -f "$FICHIER.bak"
  git commit -q -am "Ouvre le maquis tous les jours"

  git switch -q main
  git switch -q -c prix
  sed -i.bak 's/^- Garba : 1000 FCFA$/- Garba : 1200 FCFA/' "$FICHIER" && rm -f "$FICHIER.bak"
  git commit -q -am "Augmente le prix du garba à 1200 FCFA"

  git switch -q main
  git switch -q -c boissons
  printf '\n## Boissons\n\n- Bissap : 300 FCFA\n- Gnamakoudji : 300 FCFA\n' >> "$FICHIER"
  git commit -q -am "Ajoute les boissons"

  git switch -q main
  sed -i.bak 's/^- Garba : 1000 FCFA$/- Garba : 1100 FCFA/' "$FICHIER" && rm -f "$FICHIER.bak"
  git commit -q -am "Augmente le prix du garba à 1100 FCFA"
  printf '\n## Contact\n\nTéléphone : 07 00 00 00 00\n' >> "$FICHIER"
  git commit -q -am "Ajoute le numéro de téléphone"
else
  ecrire_et_enregistrer "Crée le programme des portes ouvertes" <<'FIN'
# Journée portes ouvertes de l'IFRAN

Samedi 14 février, de 9 h à 16 h.

## Programme

- 9 h : accueil des visiteurs
- 10 h : présentation des formations
- 14 h : démonstration de projets étudiants
FIN

  git switch -q -c date
  sed -i.bak 's/^Samedi 14 février, de 9 h à 16 h\.$/Samedi 21 février, de 9 h à 16 h./' "$FICHIER" && rm -f "$FICHIER.bak"
  git commit -q -am "Déplace la journée au 21 février"

  git switch -q main
  git switch -q -c salle
  sed -i.bak 's/^- 10 h : présentation des formations$/- 10 h : présentation des formations (amphithéâtre)/' "$FICHIER" && rm -f "$FICHIER.bak"
  git commit -q -am "Indique la salle de la présentation"

  git switch -q main
  git switch -q -c contact
  printf '\n## Contact\n\nportesouvertes@ifran.example\n' >> "$FICHIER"
  git commit -q -am "Ajoute l'adresse de contact"

  git switch -q main
  sed -i.bak 's/^- 10 h : présentation des formations$/- 10 h 30 : présentation des formations/' "$FICHIER" && rm -f "$FICHIER.bak"
  git commit -q -am "Décale la présentation à 10 h 30"
  printf '\n## Inscription\n\nGratuite, sur place.\n' >> "$FICHIER"
  git commit -q -am "Ajoute les informations d'inscription"
fi

echo "Le dépôt d'entraînement est prêt : $DOSSIER"
echo "Vous êtes sur la branche main."
echo "Fusionnez les branches dans main, dans cet ordre : $ORDRE."
