class SettingsController < ApplicationController
  def index
    @data = { employee_types: EmployeeType.all, account_types: BankAccountType.all }
    respond_to do |format|
      format.js
      format.html
    end
  end
end
