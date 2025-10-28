# Guide d'envoie des email avec openSSL 


## Création des emails

**Commande de création :**
```bash
docker exec CONTAINER-ID james-cli AddUser user@domain.tld password
```

Pour plus de détails : [Documentation James CLI](https://james.staged.apache.org/james-project/3.9.0/servers/distributed/operate/cli.html)

### Exemple Comptes de test

| Email | Encodage base64 | Mot de passe | Encodage base64 |
|--------|------------------|---------------|------------------|
| alae@localhost | `YWxhZUBsb2NhbGhvc3Q=` | password | `cGFzc3dvcmQ=` |
| test@localhost | — | password | — |

---

##  Connexion au serveur mail

### Connexion avec OpenSSL
```bash
openssl s_client -connect localhost:465 -tls1_2 -crlf -ign_eof
```

### Commandes SMTP
```bash
EHLO localhost
```


### Authentification
```bash
AUTH LOGIN
```
> Saisir le nom d’utilisateur et le mot de passe encodés en base64.

---

## Envoi d’un email
```bash
MAIL FROM:<alae@localhost>
RCPT TO:<test@localhost>
DATA
From: alae@localhost
To: rcpt@localhost
Subject: Test email

Bonjour, c'est un email pour test.
.
```
> Le **point (`.`)** suivi d’un **Entrée** confirme l’envoi du message.

