class Person < ActiveRecord::Base
  attr_accessible :born_at, :document, :male, :name, :student

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :male, :inclusion => { :in => [true, false], :message => 'Informe o sexo da pessoa' }
  validates :student, :inclusion => { :in => [true, false], :message => 'Informe o tipo da pessoa (estudante ou professor)' }

  validate :born_before_today
  def born_before_today
    if ! born_at.blank? and born_at >= Date.today
      errors.add(:born_at, 'deve ser anterior a data atual')
    end
  end

  validate :teacher_must_be_21
  def teacher_must_be_21
    if ! student and ! born_at.blank? and born_at > Date.today.years_ago(21)
      errors.add(:born_at, 'professores devem ter mais de 21 anos')
    end
  end

  validate :student_must_be_5
  def student_must_be_5
    if student and ! born_at.blank? and born_at > Date.today.years_ago(5)
      errors.add(:born_at, 'alunos devem ter mais de 5 anos')
    end
  end

  def self.all_students
  	where(:student => true)
  end

  def self.all_teachers
  	where(:student => false)
  end
end
