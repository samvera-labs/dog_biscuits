# frozen_string_literal: true

module DogBiscuits
  class Configuration
    attr_writer :creator_class
    def creator_class
      @creator_class ||= String
    end

    attr_writer :creator__resource_class
    def creator_resource_class
      @creator_resource_class ||= "DogBiscuits::Agent"
    end
  end
end
