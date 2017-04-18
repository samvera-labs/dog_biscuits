# frozen_string_literal: true

shared_examples_for 'keyword_subject' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:sub) { FactoryGirl.build_stubbed(:simple_concept) }

  before do
    stubby.subject_resource << sub
  end
  it 'has subject (internal object)' do
    expect(stubby.subject_resource.first).to eq(sub)
  end
  it 'has subject (external)' do
    expect(stubby.subject).to eq(['Official Heading for Woe'])
  end
  it 'has keyword' do
    expect(stubby.keyword).to eq(['northern misery'])
  end
  it 'has dc subject predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/subject')))
  end
  it 'has dc11 subject predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/subject')))
  end
  it 'has mods subject predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://www.loc.gov/mods/rdf/v1#subjectTopic')))
  end
  # Don't test for _value in solr - no models use this at the moment
end
