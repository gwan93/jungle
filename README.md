# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Goals Of This Project:

The goals of this project were:
- Become familiar with Ruby and the Rails framework
- Learn how to navigate an existing code-base
- Use existing code style and approach to implement new features in unfamiliar territory
- Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
- A simulation of the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution


## Features Added

- Correctly display dollar figures ($x,xxx.yy format)
- Show a different cart page when no items have been added to the cart
- Add a sold out badge to items that are out of stock
- The orders page now shows the items that the user ordered (rather than a generic thank you page)
- Add administrator authentication to add/edit products and product categories
- Add a count of current products and categories within the administrator dashboard
- Add new routing and views for an 'About Us' page
- Add user authentication
- Add RSpec testing for Product and User models
- Add Capybara BDD test framework

## Screenshots
!["Screenshot of Home Page"](https://github.com/gwan93/jungle/blob/master/docs/Jungle-main-page.png?raw=true)
!["Screenshot of Product Page"](https://github.com/gwan93/jungle/blob/master/docs/Jungle-product-page.png?raw=true)
!["Screenshot of Cart Page"](https://github.com/gwan93/jungle/blob/master/docs/Jungle-cart-page.png?raw=true)



## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Future Development
- Email receipts to be sent when an order is successfully placed
- Star ratings for products
- Inventory adjustment as items are sold

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
