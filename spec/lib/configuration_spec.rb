# frozen_string_literal: true

RSpec.describe DogBiscuits::Configuration do
  subject { described_class.new }

  # it { is_expected.to respond_to(:creator_class) }
  # it { is_expected.to respond_to(:creator_class=) }

  # frozen, no writers
  it { is_expected.to respond_to(:available_models) }
  it { is_expected.to respond_to(:base_properties) }
  it { is_expected.to respond_to(:common_properties) }
  it { is_expected.to respond_to(:required_properties) }

  # readers
  it { is_expected.to respond_to(:all_properties) }
  it { is_expected.to respond_to(:authorities_add_new) }
  it { is_expected.to respond_to(:facet_properties) }
  it { is_expected.to respond_to(:facet_only_properties) }
  it { is_expected.to respond_to(:index_properties) }
  it { is_expected.to respond_to(:singular_properties) }
  it { is_expected.to respond_to(:property_mappings) }
  it { is_expected.to respond_to(:conference_item_properties) }
  it { is_expected.to respond_to(:conference_item_properties_required) }
  it { is_expected.to respond_to(:published_work_properties) }
  it { is_expected.to respond_to(:published_work_properties_required) }
  it { is_expected.to respond_to(:journal_article_properties) }
  it { is_expected.to respond_to(:journal_article_properties_required) }
  it { is_expected.to respond_to(:exam_paper_properties) }
  it { is_expected.to respond_to(:exam_paper_properties_required) }
  it { is_expected.to respond_to(:thesis_properties) }
  it { is_expected.to respond_to(:thesis_properties_required) }
  it { is_expected.to respond_to(:dataset_properties) }
  it { is_expected.to respond_to(:dataset_properties_required) }
  it { is_expected.to respond_to(:package_properties) }
  it { is_expected.to respond_to(:package_properties_required) }
  it { is_expected.to respond_to(:digital_archival_object_properties) }
  it { is_expected.to respond_to(:digital_archival_object_properties_required) }

  # writers
  it { is_expected.to respond_to(:all_properties=) }
  it { is_expected.to respond_to(:authorities_add_new=) }
  it { is_expected.to respond_to(:facet_properties=) }
  it { is_expected.to respond_to(:facet_only_properties=) }
  it { is_expected.to respond_to(:index_properties=) }
  it { is_expected.to respond_to(:singular_properties=) }
  it { is_expected.to respond_to(:property_mappings=) }
  it { is_expected.to respond_to(:conference_item_properties=) }
  it { is_expected.to respond_to(:conference_item_properties_required=) }
  it { is_expected.to respond_to(:published_work_properties=) }
  it { is_expected.to respond_to(:published_work_properties_required=) }
  it { is_expected.to respond_to(:journal_article_properties=) }
  it { is_expected.to respond_to(:journal_article_properties_required=) }
  it { is_expected.to respond_to(:exam_paper_properties=) }
  it { is_expected.to respond_to(:exam_paper_properties_required=) }
  it { is_expected.to respond_to(:thesis_properties=) }
  it { is_expected.to respond_to(:thesis_properties_required=) }
  it { is_expected.to respond_to(:dataset_properties=) }
  it { is_expected.to respond_to(:dataset_properties_required=) }
  it { is_expected.to respond_to(:package_properties=) }
  it { is_expected.to respond_to(:package_properties_required=) }
  it { is_expected.to respond_to(:digital_archival_object_properties=) }
  it { is_expected.to respond_to(:digital_archival_object_properties_required=) }
end
