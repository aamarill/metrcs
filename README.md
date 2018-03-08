# METRCS README
This is an application to help you track activity on other applications.
Simply add a bit of JavaScript to your application and you're all set.
There is one implementation example documented here on the "How to use"
section for an AngularJS app. Also, it is explained how you could analogously
use Metrcs on a Rails app.

## Ruby version
* 5.1.X

## System dependencies
* PostgreSQL
* Devise
* Puma server
* SASS
* Figaro

### Configuration
* Both development and production environments have the mailer configured for
  SMTP using SendGrid. SendGrid login credentials are protected via Figaro.

* All environments use postgreSQL for their database.

## Deployment
* This is currently hosted by Heroku (https://metrcs.herokuapp.com).

* For deployment, the environment variables will not get pushed to Heroku
  automatically, since they are in an ignored file. Figaro gem documentation
  can be used to learn how to push environment variables to Heroku.

* Remember to migrate the database to Heroku as needed. The database can be
  completely emptied out and/or seeded with your own data.

## Development
* `rake` commands can be used on the command line to clear current data
and replace with what is in the "db/seeds.rb" file.

## Events API
* The API accepts JSON-formatted HTTP requests using client-side javascript from
  registered applications.

* To see how you can track your app's behavior on Metrcs read the next section.

* To test the API you can send an HTTP request from anywhere and include a URL
  from a registered app on the `Origin` header of the request. The format
  would be following:

  `curl -v -H "Accept: application/json" -H "Origin: www.your-registered-application.com" -H "Content-Type: application/json" -X POST -d '{"name":"event"}'  http://localhost:3000/api/events`

  Here, `www.your-registered-application.com` should be the URL to the
  registered app you're tracking on Metrcs. Also, `event` should be the name
  of the event you are tacking (e.g. click, visit, sign-in etc).

  Note that you don't have to specify a user because Metrcs assumes that each
  URL is unique (owned) to a specific user. The Metrcs creator acknowledges this
  gives anyone the ability to modify anyone's data, however this is an issue outside the scope of this app, which is built for demonstration purposes only.

## How to use

### Use with AngularJS
* Create a new service/factory. In this service, define the method that will
  create your HTTP request. The input to this method will be the name of the
  event you wish to track (e.g. click, visit, sign-in etc). The method should
  take the input and use it to prepare the HTTP request and send it. Then,
  inject your service to any controller that will use the method.

  Here's an example of what the service could look like. This was added to a
  to-do app that can be found here: https://do-bettr.firebaseapp.com/.

  ```javascript
  (function(){

    function Metrcs(){

      Metrcs.report = function(eventName){
        var event = {event:{name: eventName}};
        var request = new XMLHttpRequest();
        request.open("POST", "https://metrcs.herokuapp.com/api/events", true);
        request.setRequestHeader('Content-Type', 'application/json');
        request.send(JSON.stringify(event));
      }

      return Metrcs
    }

    angular
      .module('do-bettr')
      .factory('Metrcs', [Metrcs])

  })();
  ```

### Use with Rails
* To use on Rails, the steps are similar to the AngularJS example above.
  Except, of course, you won't create a service. Instead, you can place all of
  the JavaScript code inside of the "app/assets/javascripts/applications.js"
  file. The only modification is the creation of an object to avoid this
  JavaScript colliding with JavaScript from your application. So, your code
  could look like this:

  ```javascript
  var metrcs = {};

  metrcs.report = function(eventName){
    var event = {event:{name: eventName}};
    var request = new XMLHttpRequest();
    request.open("POST", "https://metrcs.herokuapp.com/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  }
  ```

  This method is now available to be used anywhere in your application like
  this:


  `<a href="/about onclick="metrcs.report('about link clicked')">`
