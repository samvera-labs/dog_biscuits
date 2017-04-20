# frozen_string_literal: true

module DogBiscuits
  # Validates that there is a rdfs label/preflabel (authorities) or title (works etc.)
  # FileSet is not validated - title and/or label are optional
  class LabelValidator < ActiveModel::Validator
    def validate(record)
      if record.work?
        validate_title(record)
      elsif record.collection?
        validate_title(record)
      elsif record.authority?
        validate_authority(record)
      end
    end

    def validate_authority(record)
      if record.concept?
        validate_label(record)
      elsif record.concept_scheme?
        validate_label(record)
      elsif record.project?
        validate_label(record)
      elsif record.agent?
        validate_agent(record)
      elsif record.place?
        validate_place(record)
      end
    end

    def validate_agent(record)
      if record.person?
        validate_person(record)
      elsif record.rdfs_label.blank? && record.name.blank?
        record.errors[:rdfs_label] << 'You must provide a rdfs label or name for agents'
      end
    end

    def validate_person(record)
      record.errors[:rdfs_label] << 'You must provide a rdfs label or name for people' if record.rdfs_label.blank? && record.given_name.blank? && record.family_name.blank? && record.name.blank?
    end

    def validate_place(record)
      record.errors[:rdfs_label] << 'You must provide a rdfs label or name for places' if record.rdfs_label.blank? && record.place_name.blank?
    end

    def validate_title(record)
      record.errors[:title] << 'You must provide a title' if record.title.blank?
    end

    def validate_label(record)
      record.errors[:rdfs_label] << 'You must provide a preflabel or rdfs label' if record.preflabel.blank? && record.rdfs_label.blank?
    end
  end
end
