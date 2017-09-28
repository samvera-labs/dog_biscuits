# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::ExamPaper do
  let(:stubby) { FactoryGirl.build(:exam_paper) }
  let(:main_file) { FactoryGirl.build_stubbed(:file_set) }
  let(:other_file) { FactoryGirl.build_stubbed(:file_set) }

  after do
    stubby.destroy
  end

  it 'is an exam paper' do
    expect(stubby).to be_exam_paper
  end

  it_behaves_like 'creator'
  it_behaves_like 'contributor'
  it_behaves_like 'date'
  it_behaves_like 'description'
  it_behaves_like 'former_identifier'
  it_behaves_like 'language'
  it_behaves_like 'main_file'
  it_behaves_like 'module_code'
  it_behaves_like 'qualification'

  describe '#rdftypes' do
    specify { stubby.type.should include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { stubby.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
  end

  describe '#related objects' do
    before do
      stubby.members << main_file
      stubby.members << other_file
    end

    it 'has two members' do
      expect(stubby.members.size).to eq(2)
    end
  end
end
