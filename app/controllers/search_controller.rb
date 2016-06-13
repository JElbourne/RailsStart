class SearchController < ApplicationController
  def index
    # @projects = Project.search(name_cont: params[:q]).result
    # @videos = Video.search(name_cont: params[:q]).result
  end
end
