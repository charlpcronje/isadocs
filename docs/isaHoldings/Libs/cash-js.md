# cash.js

> [cash.js Docs](https://kenwheeler.github.io/cash/#docs)

Minimalist replacement for jQuery

Adding Script to DOM

```html
<script src="cash.js"></script>
```

## `$()`

```js
$(selector,[context])=> collection
$(collection)=> self
$(DOM elements)=> collection
$(HTML)=> collection
```

This is the main selector method for cash. It returns an actionable collection of nodes.

## `$.each`

```js
$.each(collection, callback)=> collection
```

Iterates through a collection and calls the callback method on each.

## `$.extend`

```js
$.extend(target,source)=> object
```

Extends target object with properties from the source object.

## `$.matches`

```js
$.matches(element, selector)=> boolean
```

Checks a selector against an element, returning a boolean value for match.

## `$.parseHTML`

```js
$.parseHTML(htmlString)=> collection
```

Returns a collection from an HTML string.

## `$.fn`

```js
$.fn=> cash.prototype
```

The main prototype. Adding properties and methods will add it to all collections

## `add`

```js
add(element) => collection
add(selector) => collection
```

Returns a new collection with the element added to the end, will accept any amount of arguments and add them all in sequence.

## `addClass`

```js
addClass(className)=> collection
```

Adds the className argument to collection elements.

## `append`

```js
append(element)=> collection
```

Appends the target element to the first element in the collection.

## `appendTo`

```js
appendTo(element)=> collection
```

Adds the first element in a collection to the target element.

## `attr`

```js
attr(attrName)=> AttributeValue
attr(attrName, attrValue)=> collection
```.

Without attrValue, returns the attribute value of the first element in the collection. With attrValue, sets the attribute value of each element of the collection.

## `children`

```js
children()=> collection
children(selector)=> collection
```

Without a selector specified, returns a collection of child elements . With a selector, returns child elements that match the selector.

## `clone`

```js
clone()=> collection
```

Returns a clone of the collection.

## `closest`

```js
closest()=> collection
closest(selector)=> collection
```

Returns the closest matching selector up the DOM tree.

## `css`

```js
css(property)=> value
css(property,value)=> collection
css(object)=> collection
```

Returns a CSS property value when just property is supplied. Sets a CSS property when property and value are supplied, and set multiple properties when an object is supplied.

## `data`

```js
data(key)=> value
data(key,value)=> collection
```

Returns data attribute value when key is supplied. Sets data attribute value when both key and value are supplied.

## `each`

```js
each(callback)=> collection
```

Iterates over a collection with callback(value, index, array)

## `empty`

```js
empty()=> collection
```

Empties an elements interior markup.

## `eq`

```js
eq(index)=> collection
```

Returns a collection with the element at index.

## `filter`

```js
filter(function)=> collection
```

Returns the collection that results from applying the filter method.

## `find`

```js
find(selector)=> collection
```

Returns selector match descendants from the first element in the collection.

## `first`

```js
first()=> collection
```

Returns the first element in the collection.

## `get`

```js
get(index)=> domNode
```

Returns the element at the index.

## `has`

```js
has(selector)=> boolean
```

Returns boolean result of the selector argument against the collection.

## `hasClass`

```js
hasClass(className)=> boolean
```

Returns the boolean result of checking if the first element in the collection has the className attribute.

## `height`

```js
height()=> integer
```

Returns the height of the element.

## `html`

```js
html()=> HTML Text
html(HTML)=> HTML Text
```

Returns the HTML text of the first element in the collection, sets the HTML if provided.

## `index`

```js
index()=> Integer
index(element)=> Integer
```

Returns the index of the element in its parent if an element or selector isn't provided. Returns index within element or selector if it is.

## `innerHeight`

```js
innerHeight()=> integer
```

Returns the height of the element + padding

## `innerWidth`

```js
innerWidth()=> integer
```

Returns the width of the element + padding

## `insertAfter`

```js
insertAfter(element)=> collection
```

Inserts collection after specified element.

## `insertBefore`

```js
insertBefore(element)=> collection
```

Inserts collection before specified element.

## `is`

```js
is(selector)=> boolean
```

Returns whether the provided selector matches the first element in the collection.

## `last`

```js
last()=> collection
```

Returns last element in the collection.

## `ext`

```js
next()=> collection
```

Returns next sibling

## `not`

```js
not(selector)=> collection
```

Filters collection by false match on selector.

## `off`

```js
off(eventName,eventHandler)=> collection
```

Removes event listener from collection elements.

## `on`

```js
on(eventName,eventHandler)=> collection
on(eventName, delegate, eventHandler)=> collection
```

Adds event listener to collection elements. Event is delegated if delegate is supplied.

## `outerHeight`

```js
outerHeight()=> integer
outerHeight(margin)=> integer
```

Returns the outer height of the element. Includes margins if margin is set to true.

## `outerWidth`

```js
outerWidth()=> integer
outerWidth(margin)=> integer
```

Returns the outer width of the element. Includes margins if margin is set to true.

## `parent`

```js
parent()=> collection
```

Returns parent element.

## `parents`

```js
parents(selector)=> collection
```

Returns recursive parent by selector.

Prepends element to the first element in collection.

## `prependTo`

```js
prependTo(element)=> collection
```

Prepends first element in collection to the element.

## `prev`

```js
prev()=> collection
```

Returns the previous adjacent element.

## `prepend`

```js
prepend(element)=> collection
```

Prepends element to the first element in collection.

## `prop`

```js
prop(property)=> Property value
```

Returns property value.

## `ready`

```js
ready(callback)=> collection/span>
```

Calls callback method on DOMContentLoaded.

## `remove`

```js
remove()=> collection
```

Removes collection elements from the DOM.

## `removeAttr`

```js
removeAttr(attrName)=> collection
```

Removes attribute from collection elements

## `removeClass`

```js
removeClass(className)=> collection
```

Removes className from collection elements

## `removeData`

```js
removeData(name)=> collection
```

Removes data attribute from collection elements

## `serialize`

```js
serialize()=> String
```

When called on a form, serializes and returns form data.

## `siblings`

```js
siblings()=> collection
```

Returns a collection of sibling elements.

## `text`

```js
text()=> text
text(textContent)=> collection
```

Returns the inner text of the first element in the collection, sets the text if textContent is provided.

## `trigger`

```js
trigger(eventName)=> collection
```

Triggers supplied event on elements in collection.

## `val`

```js
val()=> value
val(value)=> collection
```

Returns an inputs value. If value is supplied, sets all inputs in collection's value to the value argument.

## `width`

```js
width()=> integer
```

Returns the width of the element.
