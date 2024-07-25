# Rufferal Backend

The Rails (ruby) backend which provisions REST APIs, Authentication including email, Google, and Apple, and other integrations such as 1:1 messaging

[project.com](https://project.com)

## Install

### Clone the repository

```shell
git clone git@github.com:<FILL ME OUT>/project.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby <FILL ME OUT>`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install <FILL ME OUT>
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
gem install bundler
gem install rails

brew install postgresql
brew services start postgresql

bundle
```

### Set environment variables

#### Generate Devise secret

```shell
bundle exec rails secret

EDITOR='code --wait' rails credentials:edit
```

This should open an encypted `yml` file

Add the following

```yml
# Other secrets...  
# Used as the base secret for Devise-JWT 
devise_jwt_secret_key: (copy and paste the generated secret here)
```

<!-- Using [Figaro](https://github.com/laserlemon/figaro): -->

<!-- See [config/application.yml.sample](https://github.com/juliendargelos/project/blob/master/config/application.yml.sample) and contact the developer: [contact@juliendargelos.com](mailto:contact@juliendargelos.com) (sensitive data). -->

### Initialize the database

```shell
rails db:{create,migrate,seed}
```

<!-- ### Add heroku remotes

Using [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli):

```shell
heroku git:remote -a project
heroku git:remote --remote heroku-staging -a project-staging
``` -->

## Serve

```shell
rails s
```

<!-- ## Deploy

### With Heroku pipeline (recommended)

Push to Heroku staging remote:

```shell
git push heroku-staging
```

Go to the Heroku Dashboard and [promote the app to production](https://devcenter.heroku.com/articles/pipelines) or use Heroku CLI:

```shell
heroku pipelines:promote -a project-staging
```

### Directly to production (not recommended)

Push to Heroku production remote:

```shell
git push heroku
``` -->
