# share.andrewgarner.com

My very own URL shortener based on [guillotine].


## Usage

Shorten a URL:

```sh
$ curl -X POST http://share.andrewgarner.com --user user:pass -i -F"url=https://github.com/andrewgarner/share.andrewgarner.com"
...
Location: http://share.andrewgarner.com/o2pbXA
```

Shorten a URL with custom code:

```sh
$ curl -X POST http://share.andrewgarner.com --user user:pass -i -F"url=https://github.com/andrewgarner/share.andrewgarner.com" -F"code=gh"
..
Location: http://share.andrewgarner.com/gh
```


## Requirements

* [Git]
* [Ruby]
* [Bundler]


## Installation

Clone the repository:

```sh
$ git clone andrewgarner:share.andrewgarner.com.git
```

Install dependencies using [Bundler]:

```sh
$ bundle
```

Start the application:

```sh
$ foreman start
```

## Authors

- [Andrew Garner](http://github.com/andrewgarner/)


## Copyright

Copyright (c) 2012 Andrew Garner. See LICENSE for details.


[git]: http://git-scm.com/
[ruby]: http://www.ruby-lang.org/
[bundler]: http://gembundler.com/
[foreman]: http://ddollar.github.com/foreman/
[guillotine]: http://techno-weenie.net/guillotine/
