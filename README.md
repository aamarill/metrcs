# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration
  - Bloc's rails 5 setup guide was used to initialize the rails app.

  - Both development and production environments have the "action_mailer" configured
    for SMTP using "sendgrid". Sendgrid login is protected via the "Figaro" gem.

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  - For deployment, the environment variables will not get pushed to Heroku
    automatically, since they are in an ignored file. Figaro documentation can be
    used to larn how to push environment variables to Heroku.

* Events API
  - The API accepts JSON-formatted AJAX requests from registered applications
    using client-side javascript snippets. One way to register an event would be
    to setup the registered app's applications.js file to contain a method that
    sends the AJAX request (e.g. `blocmetrics.report(event_name)`) and then
    calling it from the browser.


* ...
