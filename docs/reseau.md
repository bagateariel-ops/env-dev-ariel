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

## Les ports

| Port | Service                                   | Exemple d'URL           |
| ---- | ----------------------------------------- | ----------------------- |
| 80   | HTTP (web non chiffré par défaut)         | `http://example.com`    |
| 443  | HTTPS (web chiffré TLS par défaut)        | `https://example.com`   |
| 8000 | Serveur web de développement / test local | `http://localhost:8000` |

## Diagnostiquer une erreur

Les 4 questions, dans l'ordre :

1. Le nom est-il trouvé ? → `nslookup <nom>`
2. Le port est-il ouvert / en écoute ? → `ss -tln`
3. La connexion répond-elle avec les bons en-têtes ? → `curl -I http://<hôte>:<port><chemin>`
4. La ressource existe-t-elle et est-elle bien placée sur le serveur ? → vérifier le chemin / fichier dans le dossier du site et le code HTTP (`200` vs `404`)

### Exemple : une panne que j'ai réparée

- **Symptôme :** L'image du logo ne s'affiche pas dans le navigateur et l'onglet Réseau (`F12`) indique une erreur `404` sur le chemin demandé, alors que `logo.svg` existe bien à la racine du projet.
- **Étape :** Étape 4 — Réponse du serveur / ressource demandée.
- **Cause :** Le HTML demande le logo dans un sous-dossier (ex. `images/logo.svg`), alors que `logo.svg` se trouve directement à la racine du dossier du site.
- **Correction :** Création du sous-dossier attendu (`mkdir -p images`) et copie du fichier (`cp logo.svg images/logo.svg`) sans modifier le HTML.
- **Vérification :** Rechargement de la page : le logo s'affiche et la requête passe au statut `200`.
