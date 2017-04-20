# frozen_string_literal: true

module DogBiscuits
  module CommonLabels
    extend ActiveSupport::Concern
    include DogBiscuits::SkosLabels
    include DogBiscuits::RdfsLabel
  end
end
