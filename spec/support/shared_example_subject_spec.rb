# frozen_string_literal: true

shared_examples_for 'subject' do
  # let(:sub) { FactoryBot.build_stubbed(:simple_concept) }

  # before do
  #   stubby.subject_resource << sub
  # end
  # it 'has subject (internal object)' do
  #   expect(stubby.subject_resource.first).to eq(sub)
  # end
  it 'has subject (external)' do
    expect(stubby.subject).to eq(['Official Heading for Woe'])
  end
  # it 'has dc subject predicate' do
  #   expect(rdf.should(include('http://purl.org/dc/terms/subject')))
  # end
  it 'has dc11 subject predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/subject')))
  end
  # TODO: Test for _label in solr when models use it

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:subject)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:subject].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:subject)))
  end
end
