Ouvrir une ligne de comande dans windows

Se placer à la racine du dossier contenant ce fichier

# docker compose build

	docker compose up -d

Dans l'application docker une stack est apparue

# Ouvrir la ligne de commande du container symfony_bts
	
	git config --global user.email "mail"
	git config --global user.name "nom"

	cd /home/symfo
		symfony new ./ --version=6.0 --php=8.1 --webapp

	nano /home/symfo/.env
		Commenter la ligne non commentée commençant par DATABASE_URL (attention au multiligne)
		DATABASE_URL="mysql://root:password@mysql-symfony:3306/symfony?serverVersion=8&charset=utf8mb4"

	symfony server:start --port=80 -d 

	symfony server:stop

# Avoir une base
	
   Créer un controler 

	symfony console make:controller

   Créer une Entité 

	symfony console make:entity

   Faire une migration 

	symfony console make:migration
	symfony console doctrine:migrations:migrate


# Easy admin 
	
   Installer 

	composer require easycorp/easyadmin-bundle


   Avoir un dashboard

	symfony console make:admin:dashboard

   Avoir un Crud 

	symfony console make:admin:crud


# Permission 

	symfony console make:user User

	   -> Rôles : ["ROLE_ADMIN"] // dans la base de donnée

   Pour tester le hash 

	security:hash-password

   Créer un login
	symfony console make:auth

	   -> LoginAuthenticator

