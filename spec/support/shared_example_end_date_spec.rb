# frozen_string_literal: true

shared_examples_for 'end_date' do
  it 'has end_date' do
    expect(stubby.end_date).to eq(['10-1-2016'])
  end
  it 'has predicate' do
    expect(rdf.should(include('http://schema.org/endDate')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:end_date))) if stubby.work?
  end
end
