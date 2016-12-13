class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure_name"])

    if params["new_title"] == nil
      @figure.titles << Title.find_by(id: params["figure][title_ids]"])
    else
      @figure.titles << Title.create(name: params["new_title"])
    end

    if params["new_landmark"] == nil
      @figure.landmarks << Landmark.find_by(id: params["figure][landmark_ids]"])
    else
      @figure.landmarks << Landmark.create(name: params["new_landmark"])
    end

    @figure.save
  end







end
