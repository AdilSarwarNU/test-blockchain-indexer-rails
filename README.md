# Test Blockchain Indexer Rails App

## Prerequisites
The setups steps expect following tools installed on the system.

* Github

* Ruby 2.5.7

* Rails 6.0.3

##### Check out the repository
git clone git@github.com:AdilSarwarNU/test-blockchain-indexer-rails.git

# Installation
Follow these easy steps to install and start the app:

## Set up Rails app
First, install the gems required by the application:
> bundle install

Next, create and execute the database migrations/schema setup:
> rake db:create

> rake db:setup

> rails db:migrate

Now, Create testing user in rails console
1. Open rails console 
> rails c
2. Create user by adding this command
> User.create(name: "Testing user", email: "testing.user@gmail.com", password: "Password", password_confirmation: "Password")

## Start the app
Go to terminal in project directory and enter this
> rails s

You can find your app now by pointing your browser to http://localhost:3000. If everything worked you can log into FrontEnd App with your Phrase user account.
