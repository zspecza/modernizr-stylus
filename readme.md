Modernizr-Stylus
---------

[![npm](http://img.shields.io/npm/v/modernizr-stylus.svg?style=flat)](http://badge.fury.io/js/modernizr-stylus)
[![tests](http://img.shields.io/travis/declandewet/modernizr-stylus/0.0.1.svg?style=flat)](https://travis-ci.org/declandewet/modernizr-stylus)

Modernizr-Stylus is a handy utility plugin for the Stylus CSS preprocessor that
makes feature detection with Modernizr.js a lot easier.

It turns this...:

```stylus
.test
  +yep(csstransforms, csstransforms3d)
    transform: translate3d(100px)
  +nope(csstransforms, csstransforms3d)
    left: 100px
```

...into this:

```stylus
.csstransforms.csstransforms3d .test
  transform: translate3d(100px)
.no-js .test,
.no-csstransforms .test,
.no-csstransforms3d .test
  left: 100px
```

### Installation

You can install Modernizr-Stylus through NPM:

```bash
$ npm install modernizr-stylus
```

### Usage

Modernizr-Stylus is a [Stylus](http://learnboost.github.io/stylus/) plugin, and can be integrated in any way that Stylus plugins normally are. If you are curious how to use Stylus plugins, feel free to check out [this guide](https://gist.github.com/jenius/8263065).

By default, Modernizr-Stylus' mixins will be included automatically into all parsed stylesheets when included as above. If you'd like to import Modernizr-Stylus manually in Stylus when you want to use it, you can pass `{ implicit: false }` to the Modernizr-Stylus call:

```js
modernizr({ implicit: false })
```

If you do it this way, you'll need to `@import` Modernizr-Stylus manually wherever you'd like access to the mixins:

```stylus
@import 'modernizr-stylus'

.test, .tes2
  +yep(boxshadow)
    box-shadow: 0 0 3px #000;

...etc...
```

### Miscellaneous

- Details on the license [can be found here](license.md)

### Credits
[Daniel Guillan](http://danielguillan.com/) - initial idea / scss mixins
