shared_examples_for 'main_file' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::').last
    @stubby = FactoryGirl.build(model_str.underscore.to_sym) # , :with_before_save_callback)
    @main = FactoryGirl.build_stubbed(:file_set)
    @stubby.mainfile << @main
  end

  it 'has main file' do
    expect(@stubby.mainfile.first).to eq(@main)
  end

  # main file is added to members
  it 'has one member' do
    @stubby.add_member
    expect(@stubby.members.size).to eq(1)
  end
  it 'has one member when member is added a second time' do
    @stubby.add_member
    expect(@stubby.members.size).to eq(1)
  end
end
