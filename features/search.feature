
Feature: Verify search by teacher

@price_courses
Scenario: Search course by teacher
Given that the search for a course by teacher is selected
When select the teacher "Ena Loiola"
And select a course
Then should return a correct value of course

@quantity_courses
Scenario: Quantity courses by teacher
Given that the search for a course by teacher is selected
When select the teacher "Ena Loiola" 
Then should return the right quantity of courses

@sort_courses
Scenario: Sort courses asc by name
Given that the search for a course by teacher is selected
When select the teacher "Ena Loiola"
And sort courses asc by name
Then should return the course sorted by name

Scenario: Sort courses desc by name
Given that the search for a course by teacher is selected
When select the teacher "Ena Loiola"
And sort courses desc by name
Then should return the course sorted by name

Scenario: Sort courses asc by price
Given that the search for a course by teacher is selected
When select the teacher "Ena Loiola"
And sort courses asc by price
Then should return the course sorted by price

Scenario: Sort courses desc by price
Given that the search for a course by teacher is selected
When select the teacher "Ena Loiola"
And sort courses desc by price
Then should return the course sorted by price

Scenario: Filter courses
Given that the search for a course by teacher is selected
When select the teacher "Ena Loiola"
And filter courses with 'assinatura'
Then should return the course filtered