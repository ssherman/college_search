# README

Rails app for searching colleges using a government API and
displaying a google map of each one

* Ruby version
3.1.2

* System dependencies
Ruby

* Configuration
To run the app you can either use Docker or run it locally. There are 3 environment variables that need to bet. The CS_API_KEY, GOOGLE_API_KEY, and SECRET_KEY_BASE. You can add these api keys
to an .env file, or you can pass them to docker.

* Docker instructions
docker build -t college_search -f Dockerfile .
docker run -e CS_API_KEY='your cs api key' -e GOOGLE_API_KEY='your google api key' -e SECRET_KEY_BASE='foo' -p 3000:3000 college_search

then hit http://localhost:3000

* Non Docker instructions
set the 3 required env variables described in the configuration and then run:

bundle install
bin/dev

then hit http://localhost:3000

* Notes

I spent 2 hours on this, so there's lots of room for improvement. 
- more test coverage on error conditions
- a couple of style glitches. This was my first time using the Tailwind CSS framework, and I spent the vast majority of the time on that :)
- paging... This would not be difficult but I ran out of time
- Caching of results, since I highly doubt this data changes much over time