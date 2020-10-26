Given 'that the search for a course by teacher is selected' do
  @browser.goto(CONFIG['hosts'])
  @page.call(Search).filter_course_by_teacher
end

When('select the teacher {string}') do |teacher|
  @page.call(Search).select_course_by_teacher(teacher)
end

When('select a course') do
  @value_course_list = @page.call(Search).select_random_course
  @total_price = @page.call(CourseDetails).show_total_price
end

When('sort courses asc by name') do
  @page.call(Search).sort_sourses_asc_by_name
  @course_list =@page.call(Search).select_all_courses_title
end

Then('should return a correct value of course') do
  expect((@value_course_list[0] * @value_course_list[1]).round(2)).to eq(@total_price.round(2)), "The price
  total #{@total_price.round(2)} is different of installments #{(@value_course_list[0] * @value_course_list[1]).round(2)}!"
end

Then('should return the right quantity of courses') do
  total_courses = @page.call(Search).show_total_courses
  expect(total_courses[1]).to eq(total_courses[0]), "The listed quantity of courses #{total_courses[1]} is different of total courses #{total_courses[0]}!"
end

Then('should return the course sorted by name') do
  expect(@course_list).to contain_exactly(@course_list.sort), "The sort is incorrect!"
end
