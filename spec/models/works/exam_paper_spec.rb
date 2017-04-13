# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::ExamPaper do
  let(:exam) { FactoryGirl.build(:exam_paper) }
  let(:main_file) { FactoryGirl.build_stubbed(:file_set) }
  let(:other_file) { FactoryGirl.build_stubbed(:file_set) }

  it 'is an exam paper' do
    expect(exam).to be_exam_paper
  end

  it_behaves_like 'creator'
  it_behaves_like 'collections_category'
  it_behaves_like 'contributor'
  it_behaves_like 'date'
  it_behaves_like 'description'
  it_behaves_like 'former_identifier'
  it_behaves_like 'language'
  it_behaves_like 'main_file'
  it_behaves_like 'module_code'
  it_behaves_like 'qualification'

  describe '#rdftypes' do
    specify { exam.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { exam.type.should_not include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { exam.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
    specify { exam.type.should include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { exam.type.should_not include('http://purl.org/spar/fabio/JournalArticle') }
  end

  describe '#predicates' do
    # none
  end

  describe '#related objects' do
    before do
      exam.members << main_file
      exam.members << other_file
    end

    it 'has two members' do
      expect(exam.members.size).to eq(2)
    end
  end
end
