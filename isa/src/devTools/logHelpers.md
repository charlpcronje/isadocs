# ISA Dev Tools - Log Helpers

The following log helpers are available in Global Scope:
> Please note: in the init.php there is a constant called `LOG_HELPERS` that is set to `true` and there is a check for a setting in `php.ini` for a variable called `ENV`

If both of these are not set to `true` and `dev` respectively the log helpers will simply do nothing, this is so that if you forget your debug code in some files that it does not break the code execution on any other environments

You can also force the log helpers to be available by adding `?log=1` or` &log=1` to the url. 

This will set a cookie called logCookie that will switch on all the log helpers for

- The current `window`
- Ajax Calls
- `iframes` within that `window`

> To switch it back off again, add `?log=0` or `&log=0` to the `url`


```php
/**
 * Dump and Die, will do a var_dump and die() with some extra helpful information like the class name it was called from and the line number and the file name
 */
function dd($var) {
    //---
}

/**
 * Same as dd but will continue with the code execution
 */
function ddc($var) {
    //---
}

/**
 * Same is dd but does a print_r instead if a var_dump 
 */
function pd($var) {
    //---
}

/**
 * This will tell you where the file you are currently working on is being included.
 */
function fileIncludeOrigin(){
    //---
}

/**
 * Gives you the implementation of a method
 */
function getMethodParams($class,$method) {
    //---
}

/**
 * Gives you the implementation of a function
 */
function getFunctionParams($function) {
    //---
}

/**
 * Gives you the properties of a class, which are static, protected, private and public
 */
function classProperties(&$object) {
    //---
}

/**
 * Gives you the class name of the class that called the class you are currently in
 */
function getCallingClass() {
    //---
}

/** 
 * Find Class Ancestors (Parents and Parents of Parents)
 */
function getAncestors($class) {
    s/---
}

/**
 * Check if $object is valid $class instance
 */
function isInstanceOf($object, $class) {    
    //---
}

/**
 * This function will return clean variable info
 */
function cleanVarInfo($var, $indent = '&nbsp;&nbsp;', $indent_close_bracket = '') {
    //---
}

/**
 * This function will return true if $str is valid function name (made out of alpha numeric characters + underscore)
 */
function isValidFunctionName($str) {
    //---
}
```

