require 'spec_helper'

describe "Students" do
  describe "GET /alunos" do
    it "should have content 'Alunos'" do
      visit '/alunos'
      page.should have_content('Alunos')
    end
  end
end
