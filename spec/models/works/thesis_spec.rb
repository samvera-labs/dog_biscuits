# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Thesis do
  let(:thesis) { FactoryGirl.build(:thesis) }
  let(:main_file) { FactoryGirl.build_stubbed(:file_set) }
  let(:other_file) { FactoryGirl.build_stubbed(:file_set) }

  it 'is a thesis' do
    expect(thesis).to be_thesis
  end

  # Concerns
  it_behaves_like 'abstract'
  it_behaves_like 'advisor'
  it_behaves_like 'awarding_institution'
  it_behaves_like 'common_labels'
  it_behaves_like 'common_rights'
  it_behaves_like 'creator'
  it_behaves_like 'date_of_award'
  it_behaves_like 'department'
  it_behaves_like 'doi'
  it_behaves_like 'former_identifier'
  it_behaves_like 'qualification'
  it_behaves_like 'keyword_subject'
  it_behaves_like 'language'
  it_behaves_like 'main_file'

  describe '#rdftypes' do
    specify { thesis.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { thesis.type.should_not include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { thesis.type.should include('http://purl.org/ontology/bibo/Thesis') }
    specify { thesis.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { thesis.type.should_not include('http://purl.org/spar/fabio/JournalArticle') }
  end

  describe '#related objects' do
    before do
      thesis.members << main_file
      thesis.members << other_file
    end

    it 'has two members' do
      expect(thesis.members.size).to eq(2)
    end
  end
end
