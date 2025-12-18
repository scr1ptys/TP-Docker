# Étape 2 : Nginx + PHP-FPM + MariaDB

## Objectif
Mettre en place 3 containers en communication :
- **HTTP** : Serveur Nginx sur le port 8080
- **SCRIPT** : Interpréteur PHP-FPM avec extension mysqli
- **DATA** : Base de données MariaDB

## Exécution

```bash
chmod +x launch.sh
./launch.sh
```

## Vérification

1. Page d'accueil : http://localhost:8080/
2. Test BD (compteur s'incrémente) : http://localhost:8080/test.php
