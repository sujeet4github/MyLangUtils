# Flask Web Development by Miguel Grinberg

## Introduction

Step 1. installed virtual env using:
> python3 -m venv venv

Step 2: installed flask
> pip install flash

## Hello, Flask!

Lesson: Introduction - Simple Routes and Routes with Arguments
  folders: (1a 1b)

## Templates

Lesson: Using Jinja2 Templates
Flask uses a template engine called Jinja2. Template with for-loops,
data structures, conditionals and macros.
folders:
  2a : Simple
  2b : rendering lists
  2c : expand to add more data, in a dictionary
  2d : add highlight's using template conditions
  2e : refactor template using Jinja2 macros


Install Flask-Bootstrap
> pip install flask-bootstrap

Lesson: Using Flask-Bootstrap
Bootstrap is an opensource framework with pre-defined css and js files to create attractive website. [http://getbootstrap.com/]
  2f : changes in macros.html, index.html to use blocks/class

Lesson: Custom Error Pages
  2g : added error handler route, common base.html

Lesson: Using Page Links
  2h : in base.html, replace href='#' with href="{{ url_for('index') }}"
    url_for is reverse route lookup

Lesson: Working with Web Forms
  3a : supports a POST request

Install Flask-WTF [http://flask-wtf.readthedocs.io/en/stable/index.html]
> pip install flask-wtf

Lesson: Form Management and Validation with Flask-WTF
  3b : WT-Forms features - validations, fields,
      xref-attack protection using tokens

Lesson: Rendering forms using Flask-Bootstrap
  3c : simplify code

> pip install flask-uploads

Lesson: File uploads
  3d : lesson not working in python3.6, esp validations http://flask-wtf.readthedocs.io/en/stable/form.html

## Flask In Depth

Lesson: Understanding Contexts
  4a : Using Flask `session` context object, to count number of visits.

Lesson: Request Dispatching (under the covers)
  cd 1b
  python console:
  >> from hello import app
  >> app.url_map

Lesson: Request Hooks
4b : request hooks and the `g` context object

Lesson: Responses
  4c : example of many ways to create responses to requests

## Databases
  5a : relational databases and Flask-SQLAlchemy extension

## User Logins
  6a : password hashing

  6b : logging users in and out with flask-login extension

## Scalable Application Structure
  7a : refactoring of single script 6b into a scalable project structures

## Testing
Lesson: unit tests and code coverage
  8a : unit tests

Lesson: End-to-end testing with Flask test client
  8b : testing routes using flask test client

  8c : additonal tests based on coverage reports

## Deployment
  9a : production mode change to send emails to administrators when a crash occurs.

  9b : example application to deploy to Heroku

  9c : Example application to deploy to Linux Server.
