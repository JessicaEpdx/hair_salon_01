#HairTies
###created by: Jessica Engel

HairTies is an administrative system that allows salon owners to track stylists & clients.


Users can add names into the system, and attach clients to their stylists.

developed with ruby 2.2.0p0


####Setup
_______

Gemfile is included in root folder.

Make sure to bundle gems before using HairTies:

    $ gem install bundler
    $ bundle


Database will need to be created using postgres/sql:

    $ postgres

    Leave this running in its own window

    In a new tab:

    $ psql


To create database follow these instructions after postgres is running:

    username=# CREATE DATABASE hair_salon;
    username=# \c hair_salon;
    hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
    hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
    hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;


####Debug
________

For bug issues contact Jessicaepdx@gmail.com


####License
_________


The MIT License (MIT)

Copyright (c) 2015 Epicodus
