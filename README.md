# Webedia blog

## Setup

You must create a database.yml based on database.example.yml.

This application uses Postgres, you must have it installed.

Also you must have yarn installed.

After all set, run:

to install ruby and rails dependencies
```
bundle install
```

to install JS and CSS dependencies
```
yarn install
```

then, run the migrations with
```
rake db:create
rake db:migrate
```

After that, run `rails s` to put your rails server to run

Run `rake db:seed` to create an Admin to test your website

Then access `http://localhost:3000/admin/login`

and enter the login with:

```
email: teste@email.com
password: teste123
```
