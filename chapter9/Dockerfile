FROM ruby:2.5
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global --delete frozen 1
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ["./chapter.rb"]
CMD ["./document_test.rb"]
CMD ["rspec", "document_spec.rb"]
