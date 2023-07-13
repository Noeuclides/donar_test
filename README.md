# README
This project uses rails 7.

## Installation

1) Clone this repository

2) Install ruby dependencies

```bash
$ bundle install
```

## Usage

### Set up environment

1) Set up database

1) Create and Run migrations in database:

```bash
$ rails db:drop db:create db:migrate db:test:prepare
```

2) Build tailwind
```bash
$ rails tailwindcss:build
```

3) Run specs (unit tests)

```bash
$ rspec
```
or
```bash
$ bundle exec rspec
```

4) Run seeds (there it is the admin login credentials)

```bash
$ rails db:seed --trace
```

5) Run the server
```bash
$ rails s
```

6) In another console tab run tailwind:watch tasks:
```bash
$ rails tailwindcss:watch
```

Then go to http://localhost:3000/donaton to donate

And go to http://localhost:3000/admin/donations to manage donations