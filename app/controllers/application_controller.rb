class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    # send them back as a JSON array
    bakeries = Bakery.all.to_json
  end

  get '/bakeries/:id' do
    # returns a single bakery as JSON with its baked goods nested in an array. 
    # Use the id from the URL to look up the correct bakery. 
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # returns an array of baked goods as JSON, 
    # sorted by price in descending order. 
    by_price = BakedGood.all.order(price: :desc).to_json
  end

  get '/baked_goods/most_expensive' do
    # returns the single most expensive baked good as JSON.
    most_expensive = BakedGood.all.order(price: :desc).first.to_json
  end

end
