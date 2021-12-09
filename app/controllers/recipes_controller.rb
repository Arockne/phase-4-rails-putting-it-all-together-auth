class RecipesController < ApplicationController
  def index
    user = User.find(session[:user_id])
    recipes = user.recipes
    render json: recipes, status: :created, include: :user
  end

  def create
    user = User.find(session[:user_id])
    recipe = user.recipes.create!(recipe_params)
    render json: recipe, status: :created, include: :user
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end
end
