# Étape 1 : Nginx + PHP-FPM

## Objectif
Mettre en place 2 containers en communication directe :
- **HTTP** : Serveur Nginx sur le port 8080
- **SCRIPT** : Interpréteur PHP avec FPM

## Exécution

```bash
chmod +x launch.sh
./launch.sh
```

## Vérification

Ouvrir un navigateur et accéder à : **http://localhost:8080/**

Vous devez voir le résultat de `phpinfo()`.
