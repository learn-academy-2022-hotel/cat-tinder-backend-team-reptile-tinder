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
    
    it "doesn't create a reptile without a name" do
      reptile_params = {
        reptile: {
          age: 7,
          enjoys: 'Walks on the beach',
          image: 'image link here'
        }
      }
    
      post '/reptiles', params: reptile_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"
    end
    
    it "doesn't create a reptile without an age" do
      reptile_params = {
        reptile: {
          name: 'Shakespeare',
          enjoys: 'Walks on the beach',
          image: 'image link here'
        }
      }
    
      post '/reptiles', params: reptile_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['age']).to include "can't be blank"
    end
    
    it "doesn't create a reptile without enjoys" do
      reptile_params = {
        reptile: {
          name: 'Shakespeare',
          age: 7,
          image: 'image link here'
        }
      }
    
      post '/reptiles', params: reptile_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['enjoys']).to include "can't be blank"
    end
    
    it "doesn't create a reptile without an image" do
      reptile_params = {
        reptile: {
          name: 'Shakespeare',
          age: 7,
          enjoys: 'Walks on the beach',
        }
      }
    
      post '/reptiles', params: reptile_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end
  end
  
  describe "PATCH /update" do
    it "updates a reptile" do
      reptile_params = {
        reptile: {
        name: 'Steve',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
     } 
    }

    post '/reptiles', params: reptile_params
    reptile = Reptile.first


    new_reptile_params = {
      reptile: {
        name: 'Shakespeare',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      }
    }
      
      patch  "/reptiles/#{reptile.id}", params: new_reptile_params

      expect(response).to have_http_status(200)
  
      rep =  Reptile.first
      expect(rep.name).to eq 'Shakespeare'
    end

    it "cannot modify without a name" do
      reptile_params = {
        reptile: {
        name: 'Steve',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      } 
    }
  
    post '/reptiles', params: reptile_params
    reptile = Reptile.first
  
  
      new_reptile_params = {
      reptile: {
        name: nil,
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      }
    }
      
      patch  "/reptiles/#{reptile.id}", params: new_reptile_params
  
      rep = JSON.parse(response.body)
      expect(response).to have_http_status(422)
  
      expect(rep['name']).to include "can't be blank"
    end
  
    it "cannot modify without an age" do
      reptile_params = {
        reptile: {
        name: 'Steve',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      } 
    }
  
    post '/reptiles', params: reptile_params
    reptile = Reptile.first
  
  
      new_reptile_params = {
      reptile: {
        name: 'Steve',
        age: nil,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      }
    }
      
      patch  "/reptiles/#{reptile.id}", params: new_reptile_params
  
      rep = JSON.parse(response.body)
      expect(response).to have_http_status(422)
  
      expect(rep['age']).to include "can't be blank"
    end
  
    it "cannot modify without an enjoys section" do
      reptile_params = {
        reptile: {
        name: 'Steve',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      } 
    }
  
    post '/reptiles', params: reptile_params
    reptile = Reptile.first
  
  
      new_reptile_params = {
      reptile: {
        name: 'Steve',
        age: 7,
        enjoys: nil,
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      }
    }
      
      patch  "/reptiles/#{reptile.id}", params: new_reptile_params
  
      rep = JSON.parse(response.body)
      expect(response).to have_http_status(422)
  
      expect(rep['enjoys']).to include "can't be blank"
    end
  
    it "cannot modify without an image" do
      reptile_params = {
        reptile: {
        name: 'Steve',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
      } 
    }
  
    post '/reptiles', params: reptile_params
    reptile = Reptile.first
  
  
      new_reptile_params = {
      reptile: {
        name: 'Steve',
        age: 7,
        enjoys: "Fun stuff",
        image: nil
      }
    }
      
      patch  "/reptiles/#{reptile.id}", params: new_reptile_params
  
      rep = JSON.parse(response.body)
      expect(response).to have_http_status(422)
  
      expect(rep['image']).to include "can't be blank"
    end
  end

  describe "DELETE /destroy" do
    it "deletes a reptile" do
      reptile_params = {
        reptile: {
        name: 'Steve',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
     } 
    }

    post '/reptiles', params: reptile_params
    reptile = Reptile.first

    delete "/reptiles/#{reptile.id}"

    expect(response).to have_http_status(200)
  end
end

end




