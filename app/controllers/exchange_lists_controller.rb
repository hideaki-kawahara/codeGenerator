class ExchangeListsController < ApplicationController

  def create
    @exchange_list = current_user.exchange_lists.build(exchange_lists_params)
    if @exchange_list.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @code_list = CodeList.find(params[:exchange_list][:code_list])
      render 'code_lists/show'
    end
  end


  def show
    @exchange_list = ExchangeList.find(params[:id])
  end

  private
    def exchange_lists_params
      params.require(:exchange_list).permit(:token).merge(code_list_id: params[:exchange_list][:code_list])
    end
end
