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

## Deploying to Heroku

Create a new [Heroku] application:

```sh
$ heroku apps:create share-andrewgarner
Creating share-andrewgarner... done, stack is cedar
http://share-andrewgarner.herokuapp.com/ | git@heroku.com:share-andrewgarner.git
Git remote heroku added
```

Configure the free [Redis To Go][redistogo] addon:

```sh
$ heroku addons:add redistogo
Adding redistogo on share-andrewgarner... done, v2 (free)
Use `heroku addons:docs redistogo` to view documentation.
```

Configure a custom domain:

```sh
$ heroku domains:add share.andrewgarner.com
Adding share.andrewgarner.com to share-andrewgarner... done
```

Configure authentication:

```sh
$ heroku config:add SHARE_USERNAME=user SHARE_PASSWORD=pass
Setting config vars and restarting share-andrewgarner... done, v3
SHARE_USERNAME: pass
SHARE_PASSWORD: user
```

Push to Heroku:

```sh
$ git push heroku master
Counting objects: 33, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (32/32), done.
Writing objects: 100% (33/33), 4.87 KiB, done.
Total 33 (delta 9), reused 0 (delta 0)
-----> Heroku receiving push
-----> Ruby/Rack app detected
-----> Using Ruby version: ruby-1.9.3
-----> Installing dependencies using Bundler version 1.2.1
       Running: bundle install --without development:test --path vendor/bundle --binstubs bin/ --deployment
       Fetching gem metadata from http://rubygems.org/.....
       Installing addressable (2.2.8)
       Installing thor (0.16.0)
       Installing foreman (0.59.0)
       Installing rack (1.4.1)
       Installing tilt (1.3.3)
       Installing sinatra (1.2.8)
       Installing guillotine (1.3.0)
       Installing kgio (2.7.4) with native extensions
       Installing raindrops (0.10.0) with native extensions
       Installing redis (3.0.1)
       Installing unicorn (4.3.1) with native extensions
       Using bundler (1.2.1)
       Your bundle is complete! It was installed into ./vendor/bundle
       Cleaning up the bundler cache.
-----> Discovering process types
       Procfile declares types     -> web
       Default types for Ruby/Rack -> console, rake
-----> Compiled slug size: 11.7MB
-----> Launching... done, v8
       http://share-andrewgarner.herokuapp.com deployed to Heroku
To git@heroku.andrewgarner:share-andrewgarner.git
 * [new branch]      master -> master
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
[heroku]: http://www.heroku.com/
[redistogo]: https://addons.heroku.com/redistogo/
