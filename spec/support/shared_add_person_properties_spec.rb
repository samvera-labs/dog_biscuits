# frozen_string_literal: true

shared_examples_for 'add_person_properties' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

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
    specify { stubby.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/familyName') }
    specify { stubby.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/givenName') }
    specify { stubby.resource.dump(:ttl).should include('http://schema.org/honorificPrefix') }
    specify { stubby.resource.dump(:ttl).should include('http://schema.org/honorificSuffix') }
    specify { stubby.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/gender') }
    specify { stubby.resource.dump(:ttl).should include('http://schema.org/nationality') }
    specify { stubby.resource.dump(:ttl).should include('http://schema.org/deathDate') }
    specify { stubby.resource.dump(:ttl).should include('http://schema.org/birthDate') }
    specify { stubby.resource.dump(:ttl).should include('http://schema.org/deathPlace') }
    specify { stubby.resource.dump(:ttl).should include('http://schema.org/birthPlace') }
    specify { stubby.resource.dump(:ttl).should include('http://schema.org/memberOf') }
    specify { stubby.resource.dump(:ttl).should include('http://schema.org/affiliation') }
    specify { stubby.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/knows') }
  end
end
