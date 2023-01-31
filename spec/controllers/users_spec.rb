require "rails_helper"
RSpec.describe "Users", :type => :request do
  describe 'GET #index' do
    before(:example) { get users_path }  # get(:index)
    it "creates a Widget and redirects to the Widget's page" do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  # it "does not render a different template" do
  #   get "/widgets/new"
  #   expect(response).to_not render_template(:show)
  # end
end