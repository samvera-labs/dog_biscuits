# frozen_string_literal: true

shared_examples_for 'subject' do
  # the class that includes the concern

  # let(:sub) { FactoryGirl.build_stubbed(:simple_concept) }
  let(:rdf) { stubby.resource.dump(:ttl) }

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
end
