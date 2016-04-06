Requirements
======

* Bundler 10.x
* Rails 4.2
* Ruby 2.x

Set up
====

`bundle install && rake db:setup`

The setup step will seed some data to the db if you'd like to play with it.

Running tests
====
` rspec spec`

Show me something
======

```bash
rails s
open http://localhost:3000/models/audi_a8/model_types?auth_token=ivegotthepower
```
