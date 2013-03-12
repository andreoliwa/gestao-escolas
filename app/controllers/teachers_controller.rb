class TeachersController < ApplicationController
  def index
    @teachers = Person.all_teachers
  end
end
