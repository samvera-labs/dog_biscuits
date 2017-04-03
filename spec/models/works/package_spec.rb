require 'spec_helper'

describe DogBiscuits::Package do

  let(:package) { FactoryGirl.build(:package) }


  it 'is a package' do
    expect(package).to be_package
  end

  it_behaves_like 'archivematica'
  it_behaves_like 'simple_versions'

  describe '#rdftypes' do
    specify { package.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { package.type.should include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { package.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
    specify { package.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { package.type.should_not include('http://purl.org/spar/fabio/JournalArticle') }
  end

  describe '#predicates' do
    # none
  end

end
