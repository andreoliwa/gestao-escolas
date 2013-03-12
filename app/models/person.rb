class Person < ActiveRecord::Base
  attr_accessible :born_at, :document, :male, :name, :student

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :male, :inclusion => { :in => [true, false], :message => 'Informe o sexo da pessoa' }
  validates :student, :inclusion => { :in => [true, false], :message => 'Informe o tipo da pessoa (estudante ou professor)' }

  def self.all_students
  	where(:student => true)
  end

  def self.all_teachers
  	where(:student => false)
  end
end
