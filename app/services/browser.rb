class Browser
  def initialize(**attributes)
    Watir.default_timeout = 10
    @browser = Watir::Browser.new
  end
end
