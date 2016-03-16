# Blocmetrics

Blocmetrics is a simple API tracking tool and report generator that can be used to monitor activity on web apps.

It contains:
  - Client-side Javascript snippet that allows users to track events on their website.
  - Server-side API that captures and saves those events.
  - Rails application that charts and displays events for the user.

# Configuration

1) Sign up and register your application(s).
2) Add to your application.js folder:
```javascript
  var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = { name: eventName };
    var request = new XMLHttpRequest();
    request.open("POST","http://http://safe-retreat-72649.herokuapp.com/api/events",true);
    request.setRequestHeader('Content-Type','application/json');
    request.send(JSON.stringify(event));
  };
```
3) Add and customize for each page you want tracked:
```html
<script type="text/javascript">
   $(document).on("ready page:load", function () {
      blocmetrics.report("page_view");
    })
 </script>
 ```

 That's it!
