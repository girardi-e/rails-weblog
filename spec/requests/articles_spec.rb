require 'rails_helper'

RSpec.describe '/articles', type: :request do

  let(:valid_attributes) do
    {
      id: 1,
      title: 'Hello Rails!',
      body: 'Im on Rails!'
    }
  end

  let(:invalid_attributes) do
    {
      id: 'a',
      title: 'H',
      body: 'Rails'
    }
  end

  describe 'get/index' do
    it 'renders a successful response' do
      article = Article.new(valid_attributes)
      article.save
      get '/articles'
      expect(response).to have_http_status(200)
    end
  end
end
