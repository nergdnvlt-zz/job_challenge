# README
[Live Production Site](https://job-challenge-tl.herokuapp.com/)


Pitch:
This app uses GitHub's Job API to grab job listings from certain cities and then evaluate the percentage of those listings by language and full time vs part time.

### Table Of Contents
- [Versions/Prerequisites](#versions-prerequisites)
- [Setup](#setup)
- [The Test Suite](#the-test-suite)
- [Spinning Up A Server](#spinning-up-a-server)
- [Authors](#authors)

### Versions/Prerequisites
---
##### Main:
To Install and run this application please be aware of the following versions and requirements:
- Postgresql 10+
- Rails 5+
- Ruby 2.4+

###### Secondary:
- ActiveRecord
- PG
- Puma

### Setup
---
- First clone down this repository and change directory into the project directory:
```
git clone git@github.com:nergdnvlt/job_challenge.git
cd fiver
```
- Then in your command line run bundle to install the gem dependencies:
```
bundle
```
- Now setup your database and run the migrations to properly set up your database tables:
```
rake db:create
rake db:migrate
```
- It's now time to seed the database with the required data:
```
rake db:seed
```
- At this point the project is set up. Explore at will.

<br>

### The Test Suite
---

#### Test Information

##### Test Suite Components:
- DatabaseCleaner
- FactoryBot
- Rspec
- ShouldaMatchers

#### Test Documentation and Tweaks

- For additional documentation and the individual tests as the suite runs:
```
--format=documentation
```
- Additional Useful Flags:
```
--order=random
--color
```

##### About The Tests:
 The test suite includes test for the following:
- Model Level Testing/Unit Testing<br>
- Feature Testing/Integration Testing
- Service Testing<br>

These tests can be found in the following folder:
```
spec/models/
spec/features/
spec/services/
```

##### Running The Suite:
- In order to run the test suite, from the root project folder simply run:
```
rspec
```

<br>

### Spinning Up a Server
___

- Next spin up your server:
```
rails s
```
<br>


### Authors
- [Tyler Lundgren](https://github.com/nergdnvlt)
