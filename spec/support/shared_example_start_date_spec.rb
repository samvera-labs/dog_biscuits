# frozen_string_literal: true

shared_examples_for 'start_date' do
  it 'has start_date' do
    expect(stubby.start_date).to eq(['1-1-2016'])
  end
  it 'has predicate' do
    expect(rdf.should(include('http://schema.org/startDate')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:start_date))) if stubby.work?
  end
end
