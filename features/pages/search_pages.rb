class Search
  def initialize(browser)
    @browser = browser
    @course_by_teacher = @browser.a(href: 'https://www.estrategiaconcursos.com.br/cursos/professor/')
    @total_courses = @browser.div(class: 'item')
    @course_list = @browser.sections(class: %w[card-prod || js-card-prod])
    @filter_name = @browser.buttons(class: 'filter')[0]
  end

  def filter_course_by_teacher
    @course_by_teacher.wait_until(&:present?).click
  end

  def select_course_by_teacher(teacher)
    @browser.a(text: teacher).wait_until(&:present?).click
  end

  def select_random_course
    course = rand(1...@course_list.size)
    price = @course_list[course].div.text.split('R$ ')
    installments = price[0].scan(/\d+/)[0].to_i
    value_installments = price[1].tr('.', '').gsub(',', '.').to_f
    installments = 1 if installments.zero? # case doesnt exist installments in page of course
    @course_list[course].a.wait_until(&:present?).click
    [installments, value_installments]
  end

  def show_total_courses
    [@total_courses.text.split(' ')[0].to_i, @course_list.size]
  end

  def sort_sourses_asc_by_name
    2.times { @filter_name.click }
  end

  def select_all_courses_title
    courses = []
    @course_list.each { |list| courses << list.text}
    courses
  end
end
