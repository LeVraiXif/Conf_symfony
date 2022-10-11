# Installation de Symfony

## docker compose build

	docker compose up -d

## Dans le Docker

Ouvrir la ligne de commande du container symfony_bts

	cd /home/symfo
		symfony new ./ --version=6.0 --php=8.1 --webapp

	nano /home/symfo/.env
		Commenter la ligne non commentée commençant par DATABASE_URL (attention au multiligne)
		DATABASE_URL="mysql://root:password@mysql-symfony:3306/symfony?serverVersion=8&charset=utf8mb4"

## Lancer et couper le serveur 

	symfony server:start --port=80 -d 

	symfony server:stop

## Configurer Git 

	git config --global user.email "mail"
	git config --global user.name "nom"
	
## Avoir une base
	
   Créer un controler 

	symfony console make:controller

   Créer une Entité 

	symfony console make:entity

   Créer un Form
   
   	symfony console make:form

   Faire une migration 

	symfony console make:migration
	symfony console doctrine:migrations:migrate


## Easy admin 
	
   Installer 

	composer require easycorp/easyadmin-bundle


   Avoir un dashboard

	symfony console make:admin:dashboard

   Avoir un Crud 

	symfony console make:admin:crud

## Faire une page d'inscription 

	symfony console make:registration-form
	
	nano bin/config/packages/security.yml
		access_control: 
			{path: ^/admin, roles: ROLE_ADMIN} // le /admin uniquement accessible par le ROLE_ADMIN
		

### Permission 

	symfony console make:user User

	   -> Rôles : ["ROLE_ADMIN"] // dans la base de donnée

   Pour tester le hash 

	symfony console security:hash-password

  Créer un login
  
	symfony console make:auth

	   -> LoginAuthenticator
	   

## Vider le Cache

	Symfony console cache:clear

## Autre
	Symfony console debug:router
