class CategoriesController < ApplicationController

  def create
    check_category_to_redirect
  end

end
