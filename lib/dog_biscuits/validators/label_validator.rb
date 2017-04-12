# frozen_string_literal: true

module DogBiscuits
  # validates that there is a preflabel (authorities) or title (works etc.)
  # For FileSets, title and/or preflabel are optional
  class LabelValidator < ActiveModel::Validator
    def validate(record)
      if record.work?
        validate_title(record)
      elsif record.collection?
        validate_title(record)
      elsif record.authority?
        validate_authority(record)
      end
      # record.errors[:title] << 'fuck off'
    end

    def validate_authority(record)
      if record.agent?
        validate_agent(record)
      else
        validate_preflabel(record) unless record.place?
      end
    end

    def validate_agent(record)
      record.errors[:preflabel] << 'You must provide a preflabel or name for agents' if record.preflabel.blank? && (record.name.blank? || (record.given_name.blank? && record.family_name.blank?))
    end

    def validate_title(record)
      record.errors[:title] << 'You must provide a title' if record.title.blank?
    end

    def validate_preflabel(record)
      record.errors[:preflabel] << 'You must provide a preflabel for authorities' if record.preflabel.blank?
    end
  end
end
