# Rufferal Backend

The Rails (ruby) backend which provisions REST APIs, Authentication including email, Google, and Apple, and other integrations such as 1:1 messaging

[project.com](https://project.com)

## Install

### Prereqs

- [Homebrew](https://brew.sh/)
  - ```shell
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
- rbenv
  - ```shell
    brew install postgresql
    ```
- Postgresql
  - ```shell
    brew install postgresql
    brew services start postgresql
    ```

### Clone the repository

```shell
git clone git@github.com:Ruffrl/rufferal-backend.git
cd rufferal-backend
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.2.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.2.2
rbenv local 3.2.2
ruby -v
=> 3.2.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
gem install bundler
bundle
```

### Set environment variables

#### Generate Devise secret

```shell
bundle exec rails secret

EDITOR='code --wait' rails credentials:edit
# If this errors due to "Adding config/master.key"
# Delete `config/credentials.yml.enc` and rerun command above
# PRIYA - how to overcome this for shared development?
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
rails db:create db:migrate db:seed
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

Visit http://localhost:3000/admin/users to see test API

- See also [frontend setup](https://github.com/Ruffrl/rufferal-frontend?tab=readme-ov-file#install)

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
