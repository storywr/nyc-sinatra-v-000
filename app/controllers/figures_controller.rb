class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if params["new_landmark"] == nil
      @figure.landmarks << Landmark.find_by(id: params["figure][landmark_ids]"])
    else
      @figure.landmarks << Landmark.create(name: params["new_landmark"])
    end

    @figure.save
  end

  get "/figures/:id" do
    @figure = Figure.find_by(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by(params[:id])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if params["new_landmark"] == nil
      @figure.landmarks << Landmark.find_by(id: params["figure][landmark_ids]"])
    else
      @figure.landmarks << Landmark.create(name: params["new_landmark"])
    end

    @figure.save
    redirect to "figures/#{@figure.id}"
  end

end
