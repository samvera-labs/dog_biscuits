# frozen_string_literal: true

shared_examples_for 'language' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has language' do
    expect(stubby.language).to eq(['English'])
  end
  it 'has language predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/language')))
  end

  it 'has language code' do
    expect(stubby.language_code).to eq(['en-GB'])
  end
  it 'has language code predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/language')))
  end
end
