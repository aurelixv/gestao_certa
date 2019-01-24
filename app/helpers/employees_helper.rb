module EmployeesHelper
  def set_archived_status(employee)
    title, icon = if employee.archived?
              ['Desarquivar', 'fa-arrow-circle-up text-success']
            else
              ['Arquivar', 'fa-archive text-danger']
            end

    html = "<i class='fas #{icon} fa-lg' style='vertical-align: -.1867em;'></i>"
    link_to employee, method: :delete, remote: true, title: title do
      html.html_safe
    end
  end
end
