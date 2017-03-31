require 'spec_helper'

# TODO: test concerns and validators only once; only test concept specific stuff here

describe DogBiscuits::Concept do
  let(:scheme) { FactoryGirl.build(:concept_scheme) }
  let(:scheme1) { FactoryGirl.build_stubbed(:concept_scheme) }
  let(:concept1) { FactoryGirl.build(:concept) }
  let(:concept2) { FactoryGirl.build_stubbed(:broader_concept) }
  let(:concept3) { FactoryGirl.build(:concept) }
  let(:thesis) {FactoryGirl.build(:thesis) }

  it 'is a concept' do
    expect(concept1).to be_concept
  end

  # Concerns
  it_behaves_like 'skos_labels'
  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'owl_same_as'
  it_behaves_like 'common_labels'
  it_behaves_like 'rdfs_see_also'

  describe '#metadata' do
    specify { concept1.type.should include('http://www.w3.org/2004/02/skos/core#Concept') }
    specify { concept1.definition.should eq('my definition is this') }
    specify { concept1.skos_note.should eq('notes') }
  end

  describe '#predicates' do
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#definition') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#note') }
  end

  describe '#related objects' do
    # http://stackoverflow.com/questions/2937326/populating-an-association-with-children-in-factory-girl
    it 'is related to the parent scheme' do
      expect(concept1.concept_scheme.preflabel).to eq('label')
    end

    it 'is a top concept' do
      concept3.top_concept_of << scheme1
      expect(concept3.topconcept?).to be_truthy
    end

    it 'scheme has a top concept' do
      concept3.top_concept_of << scheme1
      expect(scheme1.has_top_concept.first).to eq(concept3)
    end

    it 'is not a top concept' do
      expect(concept1.topconcept?).to be_falsey
    end

    before(:each) do
      concept1.broader << concept2
    end

    it 'has broader concept' do
      expect(concept1.broader.first.preflabel).to eq('broader object')
    end

    it 'has narrower concept' do
      expect(concept2.narrower.first.preflabel).to eq('label')
    end

    # TODO test exact and close
  end
end
