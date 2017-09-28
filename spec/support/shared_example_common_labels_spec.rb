# frozen_string_literal: true

shared_examples_for 'common_labels' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has preflabel (authorities) or a title (works etc.)' do
    if stubby.authority?
      expect(stubby.preflabel).to eq('label')
    else
      expect(stubby.title).to eq(['The Importance of Being Unhappy'])
    end
  end
  it 'has the title or preflabel predicate' do
    if stubby.authority?
      expect(rdf.should(include('http://www.w3.org/2004/02/skos/core#prefLabel')))
    else
      expect(rdf.should(include('http://purl.org/dc/terms/title')))
    end
  end
end
