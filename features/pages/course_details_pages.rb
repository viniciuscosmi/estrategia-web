class CourseDetails

  def initialize(browser)
    @browser = browser
    @total_price = @browser.div(class: 'value')
  end

  def show_total_price
    @total_price.text.split('R$ ')[1].tr('.', '').gsub(',', '.').to_f
  end
end
