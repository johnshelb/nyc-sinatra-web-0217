class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @new_landmark=Landmark.create(params["landmark"])
  end

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark=Landmark.find(params[:id])
    erb :'landmarks/show'
  end




  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params["landmark"]["name"])
    @landmark.year_completed=params["landmark"]["year_completed"]
    @landmark.save
    redirect to "/landmarks/#{params[:id]}"
  end

end
