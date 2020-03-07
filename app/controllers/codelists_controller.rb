class CodelistsController < ApplicationController
  def index
    @codelists = Codelist.paginate(page: params[:page])
  end
end
