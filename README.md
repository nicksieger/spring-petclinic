# Rails 3 + Spring Petclinic

This project showcases how you might use Rails 3 along with
Spring+Hibernate and existing Java sources from the [Spring
Petclinic][pc] application.

[pc]: http://static.springsource.org/docs/petclinic.html


## Getting started
First build the legacy petstore and download all Java dependencies using maven

    $ mvn package

Then run the rake target maven_classpath to setup the CLASSPATH

    $ rake maven_classpath

However the jruby-rake maven plugin used needs to be built from source it's not yet in the central repository. As a workaround edit the file config/initializers/classpath.rb so that it reflects your local maven repository location.

## Starting the server
    $ rails server

## Integration tests with cucumber
There are basic smoke tests in the features folder. Run them with

    $ rake cucumber


