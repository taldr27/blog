require "rails_helper"
RSpec.describe "Users", :type => :request do
  describe 'GET #users/index' do
    before(:example) { get('/users#index') }
    it "expect to have 'ok' status " do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it "should render correct placeholder in the page" do
      assert_select "h1", "Users index are coming soon!"
    end
  end
  describe 'GET #users/show' do
    before(:example) { get('/users/:id') }
    it "expect to have 'ok' status " do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it "should render correct placeholder in the show users page" do
      assert_select "h1", "Showing users!"
    end
  end
end