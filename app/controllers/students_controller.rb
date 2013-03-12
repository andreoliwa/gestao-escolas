class StudentsController < ApplicationController
  def index
    @students = Person.all_students
  end
end
