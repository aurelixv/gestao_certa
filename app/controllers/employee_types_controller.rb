class EmployeeTypesController < ApplicationController
  def new
    @employee_type = EmployeeType.new
    respond_to :js
  end

  def create
    @employee_type = EmployeeType.new(employee_type_params)
    respond_to :js
    if @employee_type.save
      flash[:success] = 'Cargo criado com sucesso.'
    else
      render :new
    end
  end

  private

  def employee_type_params
    params.require(:employee_type).permit(:title)
  end
end
