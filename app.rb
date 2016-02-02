require 'sinatra'
require 'sinatra/reloader'
require './helper_methods.rb'

enable :sessions

get '/' do
  erb :index, layout: :main_layout
end

post '/' do
  session[:names] = params[:names]
  session[:number] = params[:number]
  session[:method] = params[:method]
  @names_input = session[:names]
  @names = @names_input.split(",")
  @number = session[:number].to_i

  if params[:method] == "n_per_team"
    @teams = TeamRandomizer.per_team(@names, @number)
  elsif params[:method] == "team_count"
    @teams = TeamRandomizer.team_count(@names, @number)
  else
    erb :index, layout: :main_layout
  end

  session[:teams] = @teams
  erb :index, layout: :main_layout
end
