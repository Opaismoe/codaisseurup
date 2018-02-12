class Api::CategoriesController < ApplicationController
  def index
    render status: 200, json: {
      events: Category.all
    }.to_json
  end
end
