# METRCS README

This is an application to help you track activity on other websites.

### Ruby version
  * 5.1.X

### System dependencies
  * PostgreSQL
  * Devise
  * Puma server
  * SASS
  * Figaro

### Configuration
  * Both development and production environments have the mailer configured for SMTP using SendGrid". SendGrid login credentials are protected via Figaro.

  * All environments use postgreSQL for their database.

### Deployment
  * For deployment, the environment variables will not get pushed to Heroku
    automatically, since they are in an ignored file. Figaro documentation can
    be used to learn how to push environment variables to Heroku.

### Development
  * Command `rake db:reset` can be used on the command line to clear current data and repalce with what is in the "db/seeds.rb" file.

### Events API
  * The API accepts JSON-formatted AJAX requests from registered applications
    using client-side javascript snippets. One way to register an event would be
    to setup the registered app's applications.js file to contain a method that
    sends the AJAX request (e.g. `metrcs.report(event_name)`) and then
    calling it from the browser.
