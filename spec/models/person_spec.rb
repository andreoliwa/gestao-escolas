require 'spec_helper'

describe "A person" do
  it "should have a valid name (2 chars minimum)" do
    assert ! Person.new(:name => "I", :male => true, :student => true).save()
    assert Person.new(:name => "John", :male => true, :student => true).save()
  end

  it "should be a male or a female" do
    assert ! Person.new(:name => "John", :student => true).save()
    assert Person.new(:name => "John", :male => true, :student => true).save()
  end

  it "should be a student or a teacher" do
    assert ! Person.new(:name => "John", :male => true).save()
    assert Person.new(:name => "John", :male => true, :student => true).save()
  end

  it "should have a list of students and teachers" do
    Person.create(:name => "John", :male => true, :student => true)
    Person.create(:name => "Mary", :male => false, :student => true)
    Person.create(:name => "Mr. Jones", :male => true, :student => false)
    Person.create(:name => "Lacey", :male => false, :student => true)
    Person.create(:name => "Mr. Smith", :male => true, :student => false)
    assert_equal 3, Person.all_students.count
    assert_equal 2, Person.all_teachers.count
  end

  it "should have an optional document" do
    assert Person.new(:name => "John", :male => true, :student => true, :document => "123456").save()
  end

  it "should have an optional birth date" do
    assert Person.new(:name => "John", :male => true, :student => true, :born_at => "1980-01-01").save()
  end

  it "should have a valid birth date (at least before the current date)" do
    assert ! Person.new(:name => "John", :male => true, :student => true, :born_at => Date.today).save()
  end
end

describe "A teacher" do
  it "should be at least 21 years old" do
    assert Person.new(:name => "Mr. Old Enough", :male => true, :student => false, :born_at => "1980-01-01" ).save()
    assert Person.new(:name => "Mr. Young Man", :male => true, :student => false, :born_at => Date.today.years_ago(21) ).save()
    assert ! Person.new(:name => "Mr. Baby", :male => true, :student => false, :born_at => Date.today.years_ago(1) ).save()
  end
end

describe "A student" do
  it "should be at least 5 years old" do
    assert Person.new(:name => "Barbie", :male => false, :student => true, :born_at => "1980-01-01" ).save()
    assert Person.new(:name => "Jolie", :male => false, :student => true, :born_at => Date.today.years_ago(5) ).save()
    assert ! Person.new(:name => "Cry Baby", :male => true, :student => true, :born_at => Date.today.years_ago(4) ).save()
  end
end
