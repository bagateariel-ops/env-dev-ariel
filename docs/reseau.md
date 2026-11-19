# Fiche réseau

## Mes adresses IP

| Machine                | Adresse IP     | Privée ou publique ? |
| ---------------------- | -------------- | -------------------- |
| Mon Ubuntu             | 172.27.145.148 | Privée               |
| Mon ordinateur (Wi-Fi) | 172.16.51.7    | Privée               |
| Ma connexion Internet  | (non publiée)  | Publique             |

## Résultats du DNS

| Nom de domaine  | Adresse IP    |
| --------------- | ------------- |
| `github.com`    | 140.82.121.3  |
| `wikipedia.org` | 185.15.59.224 |

## Les outils réseau

| Commande          | Ce qu'elle fait                                                                    |
| ----------------- | ---------------------------------------------------------------------------------- |
| `hostname -I`     | Affiche l'adresse IP de mon Ubuntu                                                 |
| `ping -c 4 <nom>` | Envoie 4 requêtes ICMP à `<nom>` pour tester la connectivité et mesurer la latence |
| `nslookup <nom>`  | Interroge le serveur DNS pour résoudre le nom de domaine `<nom>` en adresse IP     |
