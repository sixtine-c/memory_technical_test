# README


## Installation

* Ruby version: 2.7.4 Rails version : 6.0.4.7

* clone or fork the repo : https://github.com/sixtine-c/memory_technical_test

* please don't forget to bundle:

  ```bash
    bundle install
    yarn install
  ```

* Create the DB with following commands:
  ```bash
    rails db:create
    rails db:migrate
    rails db:seed
  ```

* Launch the server:
   ```bash
    rails s
  ```
*  App Endpoint: \
  http://localhost:3000

## App result
<img src="/app/assets/images/screenshot-app.png" height="400" />

## Main limits today

* Work on the performance of the seed & the app, as it's really slow to load (for All countries mostly)

* I did not push it on Heroku due to this performance limit
