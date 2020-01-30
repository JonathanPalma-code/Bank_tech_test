# Bank tech test

![image](https://user-images.githubusercontent.com/55409351/73471187-dc5a4600-4380-11ea-8a0c-7b40ff5e337e.png)

Bank tech test
An un-timed tech-test with the following requirements:

## Specification:
* Requirements
You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).
* Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
## User Stories:
```
As a user
So that I can keep track of my transactions in the future
I would like to have an empty statement with a header: date, credit, debit and balance.

As a user
So that I can have money on my account
I would like to make a deposit

As a user
So that I don't regret any mistake actions that I may do
I would like to raise an error when putting a wrong amount

As a user
So that I can buy a jumper
I would like the price of it to be deducted from my account

As a user
So that I don't have a negative balance
I would like to raise an error when withrawing a wrong amount

As a user
So that I can see all my transactions
I would like see a full statement of actions, including the date and balance
```
## Technologies:
### Built with:
* [Ruby](https://www.ruby-lang.org/en/)
### Tested with:
* [Rubocop](https://docs.rubocop.org/en/stable/)
* [RSpec](https://rspec.info/)
* [Simplecov](https://rubygems.org/gems/simplecov/versions/0.12.0)

## Installation / Usage

* To install:
```
$ git clone https://github.com/JonathanPalma-code/Bank_tech_test
$ cd Bank_tech_test
$ gem install bundle
$ bundle
```
* To use:
```
> require './lib/account.rb'

> account = Account.new
> account.credit(1500)
> account.debit(1000)
> account.print_statement
```

### To run test use:
```
bundle exec rspec
```
### To run linter:
```
bundle exec rubocop
```
### Running IRB:

![image](https://user-images.githubusercontent.com/55409351/73473337-7ff92580-4384-11ea-9583-5a471968e1e7.png)

