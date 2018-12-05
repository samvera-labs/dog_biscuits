# frozen_string_literal: true

# Currently unused
shared_examples_for 'alternate_name' do
  it 'has alternate name' do
    expect(stubby.alternate_name).to eq(['Ziggy Stardust'])
  end
  it 'has alternate name predicate' do
    expect(rdf.should(include('http://schema.org/alternateName')))
  end
end
