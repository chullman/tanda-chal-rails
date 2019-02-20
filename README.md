# Tanda Challenge - Rails

**Requirements Specification:** [https://github.com/TandaHQ/work-samples/tree/master/adnat%20(backend)](https://github.com/TandaHQ/work-samples/tree/master/adnat%20(backend))

### Why?
The resulting product of this challenge, "Adnat", was developed as an assignment as a supplement for a technical interview with Tanda, Australia

## Working Demo

[https://tanda-chal-rails.herokuapp.com/](https://tanda-chal-rails.herokuapp.com/)

**Please raise an issue if you'd a reset of the database behind this demo**

## Development Environment Setup - Steps

(**Requirements:** Postgresql server, most likely running locally)

1. In cmd, run "bundle"
2. Setup Figaro for environment variable setup
  2. (a) In cmd, run "bundle exec figaro install"
  2. (b) In the resulting "config/application.yml" file, enter the following, substituting in your values

    development:
      database: "tanda-chal-dev"
      postgresql_port: "<YOUR POSTGRES SERVER PORT, MOST LIKELY 5432>"
      postgresql_username: "postgres"
      postgresql_secret: "<YOUR POSTGRES PASSWORD>"
      secret_key_dev: 780e1d8bbf78fce062f38ec02e08a8fc7a8d1e1bf8996907c8b6756f17e64946678d90d18e5f8ca5344e10142f6178897b37f42d72c79ff18953cb5490ab0d74
      gmail_username: "<YOUR GMAIL USERNAME>"
      gmail_password: "<YOUR GMAIL PASSWORD>"

(**IMPORTANT:** If using Gmail as your email sender, remember to change Google account security settings to allow insecure apps)

5. In cmd, run:
    rails db:create RAILS_ENV=development

    rails db:migrate

    rails db:seed

## ASSUMPTIONS FROM REQUIREMENT SPECS:

- Additional Gems: Devise and Figaro are allowed in the project
- Users can switch organisations without first needing to manually leave their existing one
- Break time is rounded to the nearest minute


### Developer: Christopher Hullman
