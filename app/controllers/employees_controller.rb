# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[edit update destroy]

  def index
    @employees = Employee.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @employee = Employee.build
    respond_to :js
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to :js
    if @employee.save
      flash[:notice] = 'Colaborador cadastrado com sucesso.'
    else
      render :new
    end
  end

  def edit
    respond_to :js
  end

  def update
    respond_to :js
    if @employee.update(employee_params)
      flash[:notice] = 'Colaborador atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    respond_to :js
    @employee.toggle!(:archived)
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :start_date,
      :end_date,
      :employee_type_id,
      person_attributes: %i[
        name
        rg
        cpf
        email
        birth_date
        phone
      ],
      address_attributes: %i[
        id
        street
        number
        complement
        district
        zip_code
        city
        state
      ],
      bank_account_attributes: %i[
        id
        name
        branch
        account_number
        bank_account_type_id
      ],
      employment_record_card_attribues: %i[
        id
        pis_pasep
        number
        series
        state
      ]
    )
  end
end
