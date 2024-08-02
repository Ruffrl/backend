# Rufferal Backend

The Rails (ruby) backend which provisions REST APIs, Authentication including email, Google, and Apple, and other integrations such as 1:1 messaging

[project.com](https://project.com)

## Install

Setup assumes you have a MacOS

### Prereqs

- [Homebrew](https://brew.sh/)
  - ```shell
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
- rbenv
  ```shell
  brew install rbenv
  rbenv init
  # Restart terminal or source your profile
  ```
- Postgresql
  ```shell
  brew install postgresql
  # port: 5432
  brew services start postgresql
  # brew services stop postgresql
  # brew services restart postgresql
  ```
- nginx
  ```shell
  brew install nginx
  # Mine installed here `/opt/homebrew/etc/nginx/nginx.conf`
  # port: 8080
  # You can visit http://localhost:8080/ to confirm installation
  # It should automatically strt
  # brew services start nginx
  # brew services restart nginx
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

blarg

#### Add credentials

```shell
# bundle exec rails secret

EDITOR='code --wait' rails credentials:edit
# If this errors due to "Adding config/master.key"
# Delete `config/credentials.yml.enc` and rerun command above
# PRIYA - how to overcome this for shared development?
```

This should open an encypted `yml` file

Add the following

```yml
# Other secrets...

# Google Omniauth
google_client_id: (copy and paste secret here)
google_client_secret: (copy and paste the generated secret here)
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
# port: 5000
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

## Notes

### Auth routes

`rails routes | grep -e sessions -e registrations -e authentications -e passwords -e identity`
OR
`rails routes | grep -v /rails`

```
***********************************************************************************************************************************
PREFIX                          VERB            URI PATTERN                                     CONTROLLER#ACTION
***********************************************************************************************************************************
login                           POST            /login(.:format)                                sessions#create
-----------------------------------------------------------------------------------------------------------------------------------
sign_up                         POST            /sign_up(.:format)                              registrations#create
-----------------------------------------------------------------------------------------------------------------------------------
sessions                        GET             /sessions(.:format)                             sessions#index
-----------------------------------------------------------------------------------------------------------------------------------
session                         GET             /sessions/:id(.:format)                         sessions#show
-----------------------------------------------------------------------------------------------------------------------------------
                                DELETE          /sessions/:id(.:format)                         sessions#destroy
-----------------------------------------------------------------------------------------------------------------------------------
edit_password                   GET             /password/edit(.:format)                        passwords#edit
-----------------------------------------------------------------------------------------------------------------------------------
password                        PATCH           /password(.:format)                             passwords#update
-----------------------------------------------------------------------------------------------------------------------------------
                                PUT             /password(.:format)                             passwords#update
-----------------------------------------------------------------------------------------------------------------------------------
authentications_events          GET             /authentications/events(.:format)               authentications/events#index
-----------------------------------------------------------------------------------------------------------------------------------
edit_identity_email             GET             /identity/email/edit(.:format)                  identity/emails#edit
-----------------------------------------------------------------------------------------------------------------------------------
identity_email                  PATCH           /identity/email(.:format)                       identity/emails#update
-----------------------------------------------------------------------------------------------------------------------------------
                                PUT             /identity/email(.:format)                       identity/emails#update
-----------------------------------------------------------------------------------------------------------------------------------
identity_email_verification     GET             /identity/email_verification(.:format)          identity/email_verifications#show
-----------------------------------------------------------------------------------------------------------------------------------
                                POST            /identity/email_verification(.:format)          identity/email_verifications#create
-----------------------------------------------------------------------------------------------------------------------------------
new_identity_password_reset     GET             /identity/password_reset/new(.:format)          identity/password_resets#new
-----------------------------------------------------------------------------------------------------------------------------------
edit_identity_password_reset    GET             /identity/password_reset/edit(.:format)         identity/password_resets#edit
-----------------------------------------------------------------------------------------------------------------------------------
identity_password_reset         PATCH           /identity/password_reset(.:format)              identity/password_resets#update
-----------------------------------------------------------------------------------------------------------------------------------
                                PUT             /identity/password_reset(.:format)              identity/password_resets#update
-----------------------------------------------------------------------------------------------------------------------------------
                                POST            /identity/password_reset(.:format)              identity/password_resets#create
***********************************************************************************************************************************
```

## Other User/Account routes

`rails routes | grep profiles`
OR
`rails routes | grep -v /rails`

```
***********************************************************************************************************************************
PREFIX                          VERB            URI PATTERN                                     CONTROLLER#ACTION
***********************************************************************************************************************************
profiles                        GET             /profiles(.:format)                             profiles#index
-----------------------------------------------------------------------------------------------------------------------------------
                                POST            /profiles(.:format)                             profiles#create
-----------------------------------------------------------------------------------------------------------------------------------
profile                         GET             /profiles/:id(.:format)                         profiles#show
-----------------------------------------------------------------------------------------------------------------------------------
                                PATCH           /profiles/:id(.:format)                         profiles#update
-----------------------------------------------------------------------------------------------------------------------------------
                                PUT             /profiles/:id(.:format)                         profiles#update
-----------------------------------------------------------------------------------------------------------------------------------
                                DELETE          /profiles/:id(.:format)                         profiles#destroy
***********************************************************************************************************************************
```

## Admin/Health routes

`rails routes | grep admin`
OR
`rails routes | grep -v /rails`

```
***********************************************************************************************************************************
PREFIX                          VERB            URI PATTERN                                     CONTROLLER#ACTION
***********************************************************************************************************************************
admin_rails_health_check        GET             /admin/up(.:format)                             rails/health#show
-----------------------------------------------------------------------------------------------------------------------------------
admin_users                     GET             /admin/users(.:format)                          admin/users#index
***********************************************************************************************************************************
```
