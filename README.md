# README

Rails app for searching colleges using a government API and
displaying a google map of each one

* Ruby version
3.1.2

* System dependencies
Ruby

* Configuration
To run the app you can either use Docker or run it locally. There are 2 environment variables that need to bet. The CS_API_KEY and GOOGLE_API_KEY. You can add these api keys
to an .env file, or you can pass them to docker.

* Docker instructions
docker build -t college_search -f Dockerfile .
docker run -e CS_API_KEY='your cs api key' -e GOOGLE_API_KEY='your google api key' -p 3000:3000 college_search 

then hit http://localhost:3000

* Non Docker instructions
set the 2 required env variables described in the configuration and then run:

bundle install
bin/dev

then hit http://localhost:3000