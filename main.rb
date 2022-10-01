require './app'

def main(app = App.new)
  input = app.query_method
  if input <= 6 && input >= 0
    app.return_method(input)
  else
    app.return_error
  end

  main(app) unless input == 7
end
