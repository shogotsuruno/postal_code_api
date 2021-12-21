module SearchesHelper
  require 'date'
  def time(num = 0)
    Date.today + num
  end
end
