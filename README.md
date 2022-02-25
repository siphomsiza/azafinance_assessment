# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Ruby version
* ruby-3.0.0
### Post JSON data using Curl 
**posting on heroku** 
curl --header "Content-Type: application/json"   --request POST   --data '{"transaction":{"subject":"xyz","input_amount":"3000.00","customer_id":"1","input_currency_code":"ZAR","input_currency_symbol":"R","output_currency_code":"USD" ,"output_currency_symbol":"$" ,"output_amount": "200.00"}}'   https://azafinance-assessment.herokuapp.com/transactions
**posting on lacalhost**
curl --header "Content-Type: application/json"   --request POST   --data '{"transaction":{"subject":"xyz","input_amount":"3000.00","customer_id":"1","input_currency_code":"ZAR","input_currency_symbol":"R","output_currency_code":"USD" ,"output_currency_symbol":"$" ,"output_amount": "200.00"}}'   http://localhost:3000/transactions

### How to run the test using rspec

* bundle exec rspec spec/models/transaction_spec.rb
* bundle exec rspec spec/requests/get_transactions_spec.rb
* bundle exec rspec spec/requests/post_transaction_spec.rb
* bundle exec rspec spec/requests/get_transaction_spec.rb

### `Heroku API Url`

Open [https://azafinance-assessment.herokuapp.com/transactions](https://azafinance-assessment.herokuapp.com/transactions) or [https://azafinance-assessment.herokuapp.com/transactions/1](https://azafinance-assessment.herokuapp.com/transactions/1) to view it in Json format.

### `Heroku Url`

Open [https://azafinance-assessment-nodejs.herokuapp.com/](https://azafinance-assessment-nodejs.herokuapp.com/) to view it in the browser.

* ...
