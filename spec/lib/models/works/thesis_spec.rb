# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Thesis do
  let(:stubby) { FactoryBot.build(:thesis) }
  let(:main_file) { FactoryBot.build_stubbed(:file_set) }
  let(:other_file) { FactoryBot.build_stubbed(:file_set) }
  let(:rdf) { stubby.resource.dump(:ttl) }
  let(:solr_doc) { SolrDocument.new(stubby.to_solr) }

  after do
    stubby.destroy
  end

  it 'is a thesis' do
    expect(stubby).to be_thesis
  end

  # Concerns
  it_behaves_like 'abstract'
  it_behaves_like 'advisor'
  it_behaves_like 'bibliographic_citation'
  it_behaves_like 'awarding_institution'
  it_behaves_like 'common_labels'
  it_behaves_like 'common_rights'
  it_behaves_like 'creator'
  it_behaves_like 'date_created'
  it_behaves_like 'date_of_award'
  it_behaves_like 'department'
  it_behaves_like 'doi'
  it_behaves_like 'former_identifier'
  it_behaves_like 'qualification'
  it_behaves_like 'keyword'
  it_behaves_like 'language'
  it_behaves_like 'main_file'
  it_behaves_like 'subject'

  describe '#rdftypes' do
    specify { stubby.type.should include('https://bib.schema.org/Thesis') }
    specify { stubby.type.should_not include('http://purl.org/spar/fabio/JournalArticle') }
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
