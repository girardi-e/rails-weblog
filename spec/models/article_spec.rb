require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'when creating a new instance of an article' do

    it 'cannot have an empty title' do
      article = Article.new(
        title: '',
        body: 'Im on Rails'
      )
      expect(article).to_not be_valid

      article.title = 'Hello Rails'
      expect(article).to be_valid
    end

    it 'has a title at least 2 characters long' do
      article = Article.new(
        title: 'R',
        body: "I'm on Rails!"
      )
      expect(article).to_not be_valid

      article.title = 'RA'
      expect(article).to be_valid
    end

    it 'has a title at most 40 characters long' do
      article = Article.new(
        title: 'This is an amazing article about how to create a Rails app.',
        body: "I'm on Rails!"
      )
      expect(article).to_not be_valid

      article.title = 'Welcome to Rails!'
      expect(article).to be_valid
    end

    it 'cannot have an empty body' do
      article = Article.new(
        title: 'Hello Rails!',
        body: ''
      )
      expect(article).to_not be_valid

      article.body = "I'm on Rails!"
      expect(article).to be_valid
    end

    it 'has a body at least 10 characters long' do
      article = Article.new(
        title: 'Hello Rails!',
        body: 'Rails'
      )
      expect(article).to_not be_valid
      article.body = 'This is how you create tests.'
      expect(article).to be_valid
    end

    it 'has a body at most 200 characters long' do
      article = Article.new(
        title: 'Hello Rails!',
        body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
               Donec interdum, risus ut ultricies fringilla, dui eros tincidunt
               erat, eu ultrices nisl neque quis leo.
               Praesent sit amet varius odio. Duis lacinia neque sapien,
               nec blandit ante faucibus sed. Nam porta efficitur elementum.
               Sed vel facilisis lorem. Cras id elementum nibh.'
      )
      expect(article).to_not be_valid
      article.body = 'This is a valid body.'
      expect(article).to be_valid
    end
  end
end
