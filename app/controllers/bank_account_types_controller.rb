class BankAccountTypesController < ApplicationController
  def new
    @account_type = BankAccountType.new
    respond_to :js
  end

  def create
    @account_type = BankAccountType.new(account_type_params)
    respond_to :js
    if @account_type.save
      flash[:notice] = 'Tipo de Conta criada com sucesso.'
    else
      render :new
    end
  end

  private

  def account_type_params
    params.require(:bank_account_type).permit(:title)
  end
end
