<p align="center">
  <img src="https://github.com/th3rius/city-finder/assets/43160711/47f92d78-e0bb-4c3a-8edc-7a493fabb308" alt="CityFinder" />
</p>

<p align="center">
  <b>CityFinder</b><br>
  Search and discover Brazilian cities
</p>

## Table of contents

* [Prologue](#prologue)
* [Get up and running](#get-up-and-running)
    * [Running the application manually](#running-the-application-manually)
    * [Running the application with docker-compose:](#running-the-application-with-docker-compose-)
* [Running automated tests](#running-automated-tests)
* [Check code quality with RuboCop and overcommit](#check-code-quality-with-rubocop-and-overcommit)
* [Epilogue](#epilogue)

## Prologue

CityFinder is a small Rails application that allows you to search for Brazilian cities. It's a technical exam
for [Embarca](embarca.ai).
The full list of application requirements can be found in the `TESTE BACK-END RUBY.pdf`.
The application uses a PostgreSQL database for full-text search containing all 5.570 cities in Brazil, along with their
IBGE code and state.

## Get up and running

### Running the application manually

You need a few requirements installed and configured on your machine:

* A PostgreSQL database
* Ruby 2.7.0
* Node.js (or another [ExecJS](https://github.com/rails/execjs) JavaScript environment)
* Bundler
* Yarn

You need to tail Rails about your database. Use the environment variable `DATABASE_URL` to configure the connection URL.
For convenience, you can use a `.env` file to load environment variables automatically. To do so,
copy `.env.local.example`
to `.env.local` and make the necessary changes.

```shell
$ export DATABASE_URL=DATABASE_URL=postgresql://postgres:mystrongdatabasepassword@localhost:5432/city_finder
```

To get started, first install all the application dependencies:

```shell
# Install gems:
$ bundle
# Install npm packages (you need warn installed):
$ rails yarn:install
```

Now, prepare the database:

```shell
# Creates the database, loads the schema, and initializes with
# the seed data (use db:reset to also drop the database first)
$ rails db:setup
```

Finally, start the application with:
```shell
$ rails s
```

You can now visit the application at [http://localhost:3000](http://localhost:3000).

### Running the application with docker-compose:

You'll need Docker and docker-compose installed on your machine. After that, simply run:

```shell
$ docker-compose up -d
```

and docker-compose will take care of building, preparing a database and setting everything up for you.

## Running automated tests

Again, make sure your database is configured through the environment variable `DATABASE_URL`. If you want to configure a
separate database for the test environment,
you can use the `.env.test.local` to set up environment variables for the test environment only.

```shell
# (Optional) if you wish to setup a different database for the test environment, run:
$ rails db:setup RAILS_ENV=test
```

Then, run the test suite:

```shell
$ rails spec
```

## Check code quality with RuboCop and overcommit

You can run [RuboCop](https://github.com/rubocop/rubocop) for static code analysis from your terminal:

```shell
$ rails rubocop
```

Some code offenses can be fixed automatically:

```shell
# Autocorrect RuboCop offenses (only when it's safe)
$ rails rubocop:autocorrect
# Autocorrect RuboCop offenses (safe and unsafe)
$ rails rubocop:autocorrect_all
```

You can also use [overcommit](https://github.com/sds/overcommit) to automatically run RuboCop and other code-quality
checks
in a git pre-commit hooks and avoid you from committing bad code. Install the hooks with:

```shell
$ overcommit --install
```

# Epilogue

If you live in Brazil, make sure to check out [Embarca](https://www.embarca.ai/)! Embarca is a marketplace that sells
bus tickets for anywhere in Brazil with competitive prices.
Also, chat with me on [@therius@mastodon.social](https://mastodon.social/@therius)!
