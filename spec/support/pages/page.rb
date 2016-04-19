class Page
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def visit
    super path
    self
  end
end
