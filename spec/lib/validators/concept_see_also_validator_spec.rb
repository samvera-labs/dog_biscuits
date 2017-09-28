# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::ConceptSeeAlsoValidator do
  let(:concept1) { FactoryGirl.build(:concept) }
  let(:concept2) { FactoryGirl.build_stubbed(:broader_concept) }
  let(:concept3) { FactoryGirl.build(:simple_concept) }

  before do
    concept1.broader << concept2
    concept1.see_also << concept2
    concept3.narrower << concept2
    concept3.see_also << concept2
  end

  it 'cannot have a see also that is also a broader' do
    expect { concept1.validate! }.to raise_error(ActiveFedora::RecordInvalid)
  end

  it 'cannot have a see also that is also a narrower' do
    expect { concept3.validate! }.to raise_error(ActiveFedora::RecordInvalid)
  end
end
