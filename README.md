# README

<strong> Projet du jour THP - un Eventbrite-like: EventSharp</strong> <br />
Application permettant de suivre l'agenda des évènements! <br />
EventSharp est disponible en ligne: https://intense-anchorage-39011.herokuapp.com/

## Ruby version
* Ruby 2.5.1
* Rails 5.2.4

## Comment lancer les tests
* $ bundle install
* $ rails db:create
* $ rails db:migrate
* $ rails db:migrate:status
* $ rails db:seed
* $ rails server

Si jamais vous rencontrez 'user already connected on localhost', petite manip :

* $ lsof -wni tcp:4567  <br /> 
trouver le nb PIB

Puis faire : <br />

* $ kill -9 [PIB]

## Points réalisés
* 2.1. Branchement de Bootstrap
* 2.2. Branchement de Devise
* 2.3. Faire les premières views
* 2.3.1. La page d'accueil
* 2.3.2. La page profil d'un utilisateur
* 2.3.3. Création d'un événement
* 2.3.4. Afficher un événement