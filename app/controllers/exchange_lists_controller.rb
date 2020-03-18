class ExchangeListsController < ApplicationController

  def create
    @code_list = CodeList.find(params[:exchange_list][:code_list_id])
    if @code_list.authenticate(params[:exchange_list][:token])
      @exchange_list = current_user.exchange_lists.build(exchange_lists_params)
      if @exchange_list.save
        flash[:success] = "QRコードを生成しました。"
      end
    else
      flash[:danger] = "トークンが違います。"
    end
    redirect_to code_list_path(@code_list)
  end


  def show
    @exchange_list = ExchangeList.find(params[:id])
  end

  private
    def exchange_lists_params
      params.require(:exchange_list).permit(:token).merge(code_list_id: params[:exchange_list][:code_list_id])
    end
end
