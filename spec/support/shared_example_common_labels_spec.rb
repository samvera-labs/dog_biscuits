# frozen_string_literal: true

shared_examples_for 'common_labels' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has preflabel (authorities) or a title (works etc.)' do
    if stubby.authority?
      expect(stubby.preflabel).to eq('label')
    else
      expect(stubby.title).to eq(['The Importance of Being Unhappy'])
    end
  end
  it 'has the title or preflabel predicate' do
    if stubby.authority?
      expect(stubby.resource.dump(:ttl).should(include('http://www.w3.org/2004/02/skos/core#prefLabel')))
    else
      expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/title')))
    end
  end
end
