require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #create" do
    it "param match" do
      get :create, params: { email: ENV['SCRIVITO_EMAIL'],
                             password: ENV['SCRIVITO_PASSWORD'] }
      expect(session[:user]).to eq ENV['SCRIVITO_EMAIL']
    end
    it "param unmatch" do
      get :create
      expect(flash[:alert]).to be_present
    end
  end
  describe "GET #destroy" do
    it 'user login' do
      session[:user] = ENV['SCRIVITO_EMAIL']
      get :destroy
      expect(flash[:success]).to be_present
      expect(session[:user]).to eq nil
    end
    it 'user not login' do
      get :destroy
      expect(flash[:danger]).to be_present
    end
  end
end
