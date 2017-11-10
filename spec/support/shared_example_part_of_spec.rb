# frozen_string_literal: true

shared_examples_for 'part_of' do
  it 'has part_of' do
    if described_class.is_a? ConferenceItem
      expect(stubby.part_of).to eq(['Proceedings of the Conference of Misery'])
    elsif described_class.is_a? JournalArticle
      expect(stubby.part_of).to eq(['The Journal of Woe'])
    end
  end

  it 'has part_of predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/partOf')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:part_of)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:part_of].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:part_of)))
  end
end
