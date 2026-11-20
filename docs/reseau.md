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

## Le trajet d'une requête

Quand je tape `https://github.com` dans mon navigateur :

1. **Saisie de l'URL** : J'entre l'adresse web dans mon navigateur (le client) pour lui indiquer quel site je veux visiter.
2. **Résolution DNS** : Le navigateur interroge un serveur DNS pour traduire le nom de domaine `github.com` en son adresse IP (par exemple `140.82.121.3`).
3. **Connexion au serveur** : Grâce à cette adresse IP, mon ordinateur établit une connexion réseau avec le serveur web de GitHub.
4. **Sécurisation (HTTPS)** : Le serveur présente son certificat de sécurité. Mon navigateur vérifie qu'il est valide pour chiffrer tous nos futurs échanges.
5. **Envoi de la requête HTTP** : Une fois la connexion sécurisée, mon navigateur envoie une requête `GET /` pour demander la page d'accueil.
6. **Réception de la réponse** : Le serveur renvoie le code `200 OK` accompagné du code HTML de la page, que mon navigateur affiche (avant de demander les images et les fichiers CSS).

## Les codes de réponse HTTP

| Code | Nom                   | Ce qu'il veut dire                                                               | Exemple que j'ai vu                                               |
| ---- | --------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| 200  | OK                    | Tout s'est bien passé, le serveur renvoie la ressource demandée.                 | `curl -I https://github.com` (ou la page d'accueil de Wikipédia)  |
| 301  | Moved Permanently     | Redirection permanente : la page a changé d'adresse et renvoie vers la nouvelle. | `curl -I http://github.com` (redirige vers `https://github.com/`) |
| 404  | Not Found             | Erreur client : la page ou la ressource demandée n'existe pas sur ce serveur.    | `https://github.com/page-qui-nexiste-pas-ifran`                   |
| 500  | Internal Server Error | Erreur serveur : le serveur a rencontré un bug interne en traitant la demande.   | (pas vu)                                                          |
