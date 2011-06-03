Overview
========

This is sample Rails application that demonstrates usage of

* [Backbone.js](http://documentcloud.github.com/backbone/)
* [CoffeeScript](http://jashkenas.github.com/coffee-script/)
* [Jasmine](http://pivotal.github.com/jasmine/)

This demo was used during [RailsWayCon 2011](http://railswaycon.com/2011/sessions#session-17838) conference presentation [Rails-like JavaScript using CoffeeScript, Backbone.js and Jasmine](http://www.slideshare.net/rsim/railslike-javascript-using-coffeescript-backbonejs-and-jasmine-8196890).

Source code is based on original [Todos application](http://documentcloud.github.com/backbone/docs/todos.html) by [Jérôme Gravel-Niquet](https://github.com/jeromegn).

Running application
===================

Install gems, run migrations and start application with

    bundle install
    rake db:migrate
    rails server

And then visit `http://localhost:3000`.

Running tests
=============

Run `rake jasmine` and then visit `http://localhost:8888` to execute Jasmine tests and see results.

Application source code
=======================

Backbone.js models and views written in CoffeeScript are located in `app/coffeescripts` directory and Jasmine tests are located in `spec/coffeescripts` directory.
