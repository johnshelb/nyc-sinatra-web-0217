class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name:params["figure"]["name"], title_ids:params["figure"]["title_ids"], landmark_ids:params["figure"]["landmark_ids"])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params["title"])
      @figure.save
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
      @figure.save
    end
  end

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params["figure"]["name"])
    if !params["landmark"]["name"].empty?
        @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
        @figure.save
    redirect to "/figures/#{params[:id]}"
  end
end
