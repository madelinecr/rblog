# README

RBlog is the software that runs my blog, bpace.info

## Run Server

    rails server

## Run Tests

    guard

## Testing with rspec

This app uses `rspec-rails`, `capybara`, `rails-controller-testing`
`factory_girl`, `shoulda-matchers`, `html_validation` and more for the
specs written.

### Controllers

Specs for testing controllers are stored in the controllers folder.
These are pretty straight-forward and test the individual lines of code
in the controllers.

### Features

Feature specs are a bit more complicated. They test application behavior
from the frontend using webrat and optionally selenium to step through the
app's behavior, a line at a time.

### Helpers

Specs for testing helpers. Pretty straight-forward. Similar to controller specs.

### Models

Specs for testing models. Pretty straight-forward. Similar to controller specs.

### Views

These specs only test the site as it appears from a signed out user. Any more
complicated behavior will be tested in a feature spec.
