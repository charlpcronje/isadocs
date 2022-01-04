# PHP Route Class

Uses Regular Expressions and anonymous functions to create a simple and fast routing system.

- supports dynamic path parameters
- Special 404 and 405 routes as well as methods like GET, POST, PUT, DELETE, etc.

`Route::add()` method is used to add new routes.
The first argument takes the path segment. You can also use RegExp in there to parse out variables.
All matching variables will be pushed to the handler method defined in the second argument.
The third argument will match the request method. The default method is 'get'.

## Example

```php
// Require the class
include 'Route.php';

// Use this namespace
use devTools\Route;

// Add the first route
Route::add('/user/([0-9]*)/edit', function($id) {
  echo 'Edit user with id '.$id.'<br>';
}, 'get');

// Run the router
Route::run('/');
```

```php
// Add your first route
Route::add('/', function() {
  echo 'Welcome :-)';
});

// Run the router
Route::run('/');
```

## Use a different base path

If your script lives in a subfolder (e.g. /api/v1) set this base path in your run method:

```php
Route::run('/api/v1');
```

Do not forget to edit the base path in .htaccess too if you are on Apache2.

## Use return instead of echo

You don't have to use `echo` to output your content. You can also use the `return` statement. Everything that gets returned is echoed automatically.

```php
// Add your first route
Route::add('/', function() {
  return 'Welcome :-)';
});
```

## Use arrow functions

Since PHP 7.4 you can also use arrow functions to output your content. So you can easily use variables from outside and you can write shorter code.
Please be aware that an Arrow function must always return a value. Therefore you cannot use `echo` directly in here.
You can find an example in index.php. However, this is deactivated, as it only works from PHP 7.4.

```php
Route::add('/arrow/([a-z-0-9-]*)', fn($foo) => 'This is a working arrow function example. Parameter: '.$foo );
```

## Return all known routes

This is useful, for example, to automatically generate test routes or help pages.

```php
$routes = Route::getAll();
foreach($routes as $route) {
  echo $route['expression'].' ('.$route['method'].')';
}
```

On top of that you could use a library like [View on GitHub](https://github.com/hoaproject/Regex) to generate working example links for the different expressions.

## Enable case sensitive routes, trailing slashes and multi match mode

The second, third and fourth parameters of `Route::run('/', false, false, false);` are set to false by default.
Using this parameters you can switch on and off several options:

- Argument 1: You can enable case sensitive mode by setting the second parameter to true.
- Argument 2: By default the router will ignore trailing slashes. Set this parameter to true to avoid this.
- Argument 3: By default the router will only execute the first matching route. Set this parameter to true to enable multi match mode.

## More Examples

```php
use devTools\Route;

include 'Route.php';

// Define a global basepath
define('BASEPATH','/');

// If your script lives in a subfolder you can use the following example Do not forget to edit the basepath in .htaccess if you are on apache 
// define('BASEPATH','/api/v1');

function navigation() {
  echo '
  Navigation:
  <ul>
      <li><a href="'.BASEPATH.'">home</a></li>
      <li><a href="'.BASEPATH.'index.php">index.php</a></li>
      <li><a href="'.BASEPATH.'user/3/edit">edit user 3</a></li>
      <li><a href="'.BASEPATH.'foo/5/bar">foo 5 bar</a></li>
      <li><a href="'.BASEPATH.'foo/bar/foo/bar">long route example</a></li>
      <li><a href="'.BASEPATH.'contact-form">contact form</a></li>
      <li><a href="'.BASEPATH.'get-post-sample">get+post example</a></li>
      <li><a href="'.BASEPATH.'test.html">test.html</a></li>
      <li><a href="'.BASEPATH.'blog/how-to-use-include-example">How to push data to included files</a></li>
      <li><a href="'.BASEPATH.'phpOnfo">PHP Info</a></li>
      <li><a href="'.BASEPATH.'äöü">Non english route: german</a></li>
      <li><a href="'.BASEPATH.'الرقص-العربي">Non english route: arabic</a></li>
      <li><a href="'.BASEPATH.'global/test123">Inject variables to local scope</a></li>
      <li><a href="'.BASEPATH.'return">Return instead of echo test</a></li>
      <li><a href="'.BASEPATH.'arrow/test123">Arrow function test (please enable this route first)</a></li>
      <li><a href="'.BASEPATH.'aTrailingSlashDoesNotMatter">aTrailingSlashDoesNotMatter</a></li>
      <li><a href="'.BASEPATH.'aTrailingSlashDoesNotMatter/">aTrailingSlashDoesNotMatter/</a></li>
      <li><a href="'.BASEPATH.'theCaseDoesNotMatter">theCaseDoesNotMatter</a></li>
      <li><a href="'.BASEPATH.'thecasedoesnotmatter">thecasedoesnotmatter</a></li>
      <li><a href="'.BASEPATH.'this-route-is-not-defined">404 Test</a></li>
      <li><a href="'.BASEPATH.'this-route-is-defined">405 Test</a></li>
      <li><a href="'.BASEPATH.'known-routes">known routes</a></li>
  </ul>
  ';
}

// Add base route (startpage)
Route::add('/', function() {
  navigation();
  echo 'Welcome :-)';
});

// Another base route example
Route::add('/index.php', function() {
  navigation();
  echo 'You are not really on index.php ;-)';
});

// Simple test route that simulates static html file
Route::add('/test.html', function() {
  navigation();
  echo 'Hello from test.html';
});

// This example shows how to include files and how to push data to them
Route::add('/blog/([a-z-0-9-]*)', function($slug) {
  navigation();
  include('[filename-here].php');
});

// This route is for debugging only
// It simply prints out some php infos
// Do not use this route on production systems!
Route::add('/phpinfo', function() {
  navigation();
  phpinfo();
});

// Get route example
Route::add('/contact-form', function() {
  navigation();
  echo '<form method="post"><input type="text" name="test"><input type="submit" value="send"></form>';
}, 'get');

// Post route example
Route::add('/contact-form', function() {
  navigation();
  echo 'Hey! The form has been sent:<br>';
  print_r($_POST);
}, 'post');

// Get and Post route example
Route::add('/get-post-sample', function() {
  navi();
    echo 'You can GET this page and also POST this form back to it';
    echo '<form method="post"><input type="text" name="input"><input type="submit" value="send"></form>';
    if (isset($_POST['input'])) {
        echo 'I also received a POST with this data:<br>';
        print_r($_POST);
    }
}, ['get','post']);

// Route with regexp parameter
// Be aware that (.*) will match / (slash) too. For example: /user/foo/bar/edit
// Also users could inject SQL statements or other un-trusted data if you use (.*)
// You should better use a saver expression like /user/([0-9]*)/edit or /user/([A-Za-z]*)/edit
Route::add('/user/(.*)/edit', function($id) {
  navigation();
  echo 'Edit user with id '.$id.'<br>';
});

// Accept only numbers as parameter. Other characters will result in a 404 error
Route::add('/foo/([0-9]*)/bar', function($var1) {
  navigation();
  echo $var1.' is a great number!';
});

// Crazy route with parameters
Route::add('/(.*)/(.*)/(.*)/(.*)', function($var1,$var2,$var3,$var4) {
  navigation();
  echo 'This is the first match: '.$var1.' / '.$var2.' / '.$var3.' / '.$var4.'<br>';
});

// Long route example
// By default this route gets never triggered because the route before matches too
Route::add('/foo/bar/foo/bar', function() {
  echo 'This is the second match (This route should only work in multi match mode) <br>';
});

// Route with non english letters: german example
Route::add('/äöü', function() {
  navigation();
  echo 'German example. Non english letters should work too <br>';
});

// Route with non english letters: arabic example
Route::add('/الرقص-العربي', function() {
  navigation();
  echo 'Arabic example. Non english letters should work too <br>';
});

// Use variables from global scope
// You can use for example use() to inject variables to local scope
// You can use global to register the variable in local scope
$foo = 'foo';
$bar = 'bar';
Route::add('/global/([a-z-0-9-]*)', function($param) use($foo) {
  global $bar;
  navigation();
  echo 'The param is '.$param.'<br/>';
  echo 'Foo is '.$foo.'<br/>';
  echo 'Bar is '.$bar.'<br/>';
});

// Return example
// Returned data gets printed
Route::add('/return', function() {
  navigation();
  return 'This text gets returned by the add method';
});

// Arrow function example
// Note: You can use this example only if you are on PHP 7.4 or higher
// $bar = 'bar';
// Route::add('/arrow/([a-z-0-9-]*)', fn($foo) => navi().'This is a working arrow function example. <br/> Parameter: '.$foo. ' <br/> Variable from global scope: '.$bar );

// Trailing slash example
Route::add('/aTrailingSlashDoesNotMatter', function() {
  navigation();
  echo 'a trailing slash does not matter<br>';
});

// Case example
Route::add('/theCaseDoesNotMatter',function() {
  navigation();
  echo 'the case does not matter<br>';
});

// 405 test
Route::add('/this-route-is-defined', function() {
  navigation();
  echo 'You need to patch this route to see this content';
}, 'patch');

// Add a 404 not found route
Route::pathNotFound(function($path) {
  // Do not forget to send a status header back to the client
  // The router will not send any headers by default
  // So you will have the full flexibility to handle this case
  header('HTTP/1.0 404 Not Found');
  navigation();
  echo 'Error 404 :-(<br>';
  echo 'The requested path "'.$path.'" was not found!';
});

// Add a 405 method not allowed route
Route::methodNotAllowed(function($path, $method) {
  // Do not forget to send a status header back to the client
  // The router will not send any headers by default
  // So you will have the full flexibility to handle this case
  header('HTTP/1.0 405 Method Not Allowed');
  navigation();
  echo 'Error 405 :-(<br>';
  echo 'The requested path "'.$path.'" exists. But the request method "'.$method.'" is not allowed on this path!';
});

// Return all known routes
Route::add('/known-routes', function() {
  navigation();
  $routes = Route::getAll();
  echo '<ul>';
  foreach($routes as $route) {
    echo '<li>'.$route['expression'].' ('.$route['method'].')</li>';
  }
  echo '</ul>';
});

// Run the Router with the given Basepath
Route::run(BASEPATH);

// Enable case sensitive mode, trailing slashes and multi match mode by setting the params to true
// Route::run(BASEPATH, true, true, true);
```
