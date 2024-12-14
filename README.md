# Prerequisites
* Ruby version 2.7
* Rails 5.2.8
# Basic use libraries installation
* sudo apt update
* sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils gnupg2 rar uudeview mpack arj cabextract file-roller
# Actual Development Setup
* sudo apt-get install curl git gitk
* curl -L get.rvm.io | bash -s stable
# Other dependencies
* sudo apt-get install build-essential openssl libreadline6-dev
* rvm install 2.7
* rvm install 3.0
   (Now we will install nvm for node version managaement, it will help when you will move to different projects)
    (Follow instructions here: https://github.com/nvm-sh/nvm#install--update-script )
* (restart terminal)
* nvm install 14
* gem -v
* rvm list
* rvm -v
* gem install bundler
* gem install bundler -v 1.17
* gem install rails
* bundle (only if you are in a rails project directory, skip otherwise)
If you are facing any issue regarding installation kindly check this:
  https://gist.github.com/ziaulrehman40/0e3afe55d5d1f93e5bfb02f5a117567c#rvm
# For simple instalation of postgress installation
* sudo apt install postgresql pgadmin4
# Check out the repository
 git clone git@github.com:Meerab-Zafar/BillingAndPaymentApp.git
# Install dependencies
Using Bundler run:
bundle install
# Create and setup the database
 Run the following commands to create and setup the database.
* bundle exec rake db:create
* bundle exec rake db:setup
# Start the Rails server
You can start the rails server using the command given below.
* bundle exec rails s
And now you can view the site with the URL http://localhost:3000
