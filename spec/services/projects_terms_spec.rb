require 'spec_helper'

describe DogBiscuits::Terms::ProjectsTerms do

  let(:terms) { described_class.new('projects') }

  it 'has no terms' do
    terms.all.should eq([])
  end

  let(:project) { FactoryGirl.create(:project) }
  let(:projects) { FactoryGirl.create(:projects) }

  it 'has one term' do
    projects.projects << project
    terms.all.length.should eq(1)
  end

  it 'has term hash' do
    projects.projects << project
    terms.all.should eq([{:id=>"#{project.id}", :label=>"A scientific study into misery (id: identifier_test)", :definition=>nil}])
  end

  it 'does not find the term by id' do
    projects.projects << project
    terms.find('not-a-real-id').should eq([])
  end

  it 'finds the term by id' do
    projects.projects << project
    terms.find(project.id).first[:label].should eq('A scientific study into misery (id: identifier_test)')
  end

  it 'returns one result' do
    projects.projects << project
    terms.search('misery').length.should eq(1)
  end

  it 'returns no results' do
    projects.projects << project
    terms.search('fake search').length.should eq(0)
  end

  it 'finds the id by the label' do
    projects.projects << project
    terms.find_id('A scientific study into misery (id: identifier_test)').should eq(project.id)
  end

  it 'finds the label by the id' do
    projects.projects << project
    terms.find_value_string(project.id).should eq(['A scientific study into misery (id: identifier_test)'])
  end

  it 'returns all for options list' do
    projects.projects << project
    terms.select_all_options.should eq([["A scientific study into misery (id: identifier_test)", "#{project.id}"]])
  end

end