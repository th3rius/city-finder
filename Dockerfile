# Use ruby 2.7.0 as the base image
FROM ruby:2.7.0

# Set the working directory
WORKDIR /app

# Copy dependencies lists to the container
COPY Gemfile Gemfile.lock package.json yarn.lock ./

# Install application dependencies and a JavaScript runtime
RUN apt-get update && apt-get install -y nodejs npm \
    && gem install bundler \
    && bundle \
    && npm i -g yarn \
    && yarn --frozen-lockfile


# Copy source to the container
COPY . .

# Prepare the database and run the application
CMD rails db:setup && rails s --binding 0.0.0.0
