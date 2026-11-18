# Aide-mémoire du terminal Linux

## Se déplacer

| Commande | Ce qu'elle fait               | Exemple    |
| -------- | ----------------------------- | ---------- |
| `pwd`    | Affiche le dossier où je suis | `pwd`      |
| `cd`     | Change de dossier             | `cd ~/dev` |

## Fichiers et dossiers

| Commande | Ce qu'elle fait  | Exemple          |
| -------- | ---------------- | ---------------- |
| `cp`     | Copie un fichier | `cp a.txt b.txt` |

## Lire et chercher

## Lire et chercher

| Commande | Ce qu'elle fait                  | Exemple               |
| :------- | :------------------------------- | :-------------------- |
| `cat`    | Affiche tout le fichier          | `cat notes.txt`       |
| `less`   | Affiche le fichier page par page | `less notes.txt`      |
| `head`   | Affiche les premières lignes     | `head -n 5 notes.txt` |
| `tail`   | Affiche les dernières lignes     | `tail -n 5 notes.txt` |
| `wc`     | Compte les lignes d'un fichier   | `wc -l notes.txt`     |
| `grep`   | Cherche un mot dans un fichier   | `grep ERROR app.log`  |
| `find`   | Retrouve un fichier par son nom  | `find . -name "*.js"` |

## Branches

| Commande     | Ce qu'elle fait                 | Exemple      |
| ------------ | ------------------------------- | ------------ |
| `git branch` | Liste les branches de mon depot | `git branch` |

## Astuce de ariel
`git log --oneline --graph` dessine l'historique avec les branches.