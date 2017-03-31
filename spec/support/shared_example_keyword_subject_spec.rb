shared_examples_for 'keyword_subject' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @sub = FactoryGirl.build_stubbed(:simple_concept)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    #@stubby.subject_resource << @sub
  end
  it 'has subject' do
    #expect(@stubby.subject_resource.first).to eq(@sub)
  end
  it 'has keyword' do
    expect(@stubby.keyword).to eq(['northern misery'])
  end
  it 'has subject predicate' do
    #expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/subject')))
  end
  it 'has dc11.subject predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/subject')))
  end
  it 'has _value_tesim in the solr response' do
    #expect(@stubby.to_solr.should(include('subject_value_tesim')))
  end
end
