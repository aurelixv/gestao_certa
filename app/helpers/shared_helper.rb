module SharedHelper
  def alert_class(name)
    return 'alert-success' if name == 'success'
    return 'alert-danger' if name == 'alert'
    return 'alert-info' if name == 'notice'

    name
  end
end


