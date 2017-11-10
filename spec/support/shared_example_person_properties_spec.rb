# frozen_string_literal: true

shared_examples_for 'person_properties' do
  describe '#person metadata' do
    specify { stubby.prefix.should eq('Spaceman') }
    specify { stubby.family_name.should eq('Bowie') }
    specify { stubby.given_name.should eq('David') }
    specify { stubby.suffix.should eq('PhD') }
    specify { stubby.gender.should eq('Fluid') }
    specify { stubby.nationality.should eq('Martian') }
    specify { stubby.birth_date.should eq('1947') }
    specify { stubby.death_date.should eq('2016') }
    specify { stubby.birth_place.should eq('Brixton') }
    specify { stubby.death_place.should eq('Manhattan') }
    specify { stubby.knows.should eq(['Mick Ronson']) }
    specify { stubby.affiliation.should eq(['NASA']) }
    specify { stubby.member_of.should eq(['The Spiders From Mars']) }
  end

  describe '#person predicates' do
    specify { rdf.should include('http://xmlns.com/foaf/0.1/familyName') }
    specify { rdf.should include('http://xmlns.com/foaf/0.1/givenName') }
    specify { rdf.should include('http://schema.org/honorificPrefix') }
    specify { rdf.should include('http://schema.org/honorificSuffix') }
    specify { rdf.should include('http://xmlns.com/foaf/0.1/gender') }
    specify { rdf.should include('http://schema.org/nationality') }
    specify { rdf.should include('http://schema.org/deathDate') }
    specify { rdf.should include('http://schema.org/birthDate') }
    specify { rdf.should include('http://schema.org/deathPlace') }
    specify { rdf.should include('http://schema.org/birthPlace') }
    specify { rdf.should include('http://schema.org/memberOf') }
    specify { rdf.should include('http://schema.org/affiliation') }
    specify { rdf.should include('http://xmlns.com/foaf/0.1/knows') }
  end
end
