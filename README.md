# Rails 3 + Spring Petclinic

This project showcases how you might use Rails 3 along with
Spring+Hibernate and existing Java sources from the [Spring
Petclinic][pc] application.

[pc]: http://static.springsource.org/docs/petclinic.html


## Getting started
First create the database

    $ mysql -u root
    > create database petclinic;

Then build the legacy petstore and download all Java dependencies using maven

    $ mvn package

## Starting the server
    $ rails server

## Integration tests with cucumber
There are some basic smoke tests in the features folder. Run them with

    $ rake cucumber


