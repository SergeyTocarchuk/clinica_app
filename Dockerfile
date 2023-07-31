# syntax=docker/dockerfile:1

FROM ruby:3.1-slim as base

################################################################################
# Create a stage for building/compiling the application.
#
# The following commands will leverage the "base" stage above to generate
# a "hello world" script and make it executable, but for a real application, you
# would issue a RUN command for your application's build process to generate the
# executable. For language-specific examples, take a look at the Dockerfiles in
# the Awesome Compose repository: https://github.com/docker/awesome-compose
FROM base as build

# Set the working directory inside the container
WORKDIR /app
COPY aptfile aptfile

# Layer 4. Updating and installing the necessary software for the Web server. Cleaning to reduce image size.
# hadolint ignore=DL3008
RUN apt-get update -qq && xargs apt-get install --no-install-recommends -yq < aptfile && export DEBIAN_FRONTEND=noninteractive \
  && apt-get clean && apt-get autoclean && apt-get clean all \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the project dependencies
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the rest of the application code into the container
COPY . .

# Set the default command to start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
