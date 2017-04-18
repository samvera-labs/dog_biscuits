# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::ConceptSchemeMemberValidator do
  let(:concept) { FactoryGirl.build(:concept) }
  let(:person) { FactoryGirl.build(:historic_person) }
  let(:scheme) { FactoryGirl.build(:concept_scheme) }
  let(:work) { FactoryGirl.build(:thesis) }

  it 'cannot have a work as a concept' do
    expect { scheme.concepts << work }.to raise_error(ActiveFedora::AssociationTypeMismatch)
  end

  it 'can have an authority as a concept' do
    expect { scheme.concepts << concept }.not_to raise_error
  end

  it 'can have an agent as a concept' do
    expect { scheme.people << person }.not_to raise_error
  end
end
