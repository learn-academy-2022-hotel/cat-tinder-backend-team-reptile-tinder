require 'rails_helper'

RSpec.describe "Reptiles", type: :request do
  describe "GET /index" do
    it "gets a list off all the reptiles" do
      Reptile.create(
        name: 'Shakespeare',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      )
      
      get '/reptiles'

      reptile = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(reptile.length).to eq 1
    end
  end
  
  
  describe "POST /create" do
    it "creates a reptile" do
      reptile_params = {
      reptile: {
        name: 'Shakespeare',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      }
    }
      
      post  '/reptiles', params: reptile_params

      expect(response).to have_http_status(200)
  
      reptile = Reptile.first

      expect(reptile.name).to eq 'Shakespeare'
    end
  end
  
  # describe "PATCH /update" do
  #   it "updates a reptile" do
  #     Reptile.create(
  #       name: 'Steve',
  #       age: 7,
  #       enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
  #       image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
  #     )
  #     reptile_params = {
  #     reptile: {
  #       name: 'Shakespeare',
  #       age: 7,
  #       enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
  #       image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
  #     }
  #   }
      
  #     patch  '/reptiles/', params: reptile_params

  #     expect(response).to have_http_status(200)
  
  #     reptile = Reptile.first

  #     expect(reptile.name).to eq 'Shakespeare'
  #   end
  # end



end




