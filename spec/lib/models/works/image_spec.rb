# frozen_string_literal: true

require 'spec_helper'

describe Image do
  let(:stubby) { FactoryBot.build(:image) }
  let(:rdf) { stubby.resource.dump(:ttl) }
  let(:solr_doc) { SolrDocument.new(stubby.to_solr) }

  after do
    stubby.destroy
  end

  it 'is a image' do
    expect(stubby).to be_image
  end

  it_behaves_like 'height'
  it_behaves_like 'width'

  describe '#rdftypes' do
    specify { stubby.type.should include('http://purl.org/dc/dcmitype/Image') }
    specify { stubby.type.should_not include('https://bib.schema.org/Thesis') }
  end
end
