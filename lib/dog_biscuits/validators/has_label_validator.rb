# frozen_string_literal: true

module DogBiscuits
  # TODO: REFACTOR
  # validates that there is a preflabel (authorities) or title (works etc.)
  # For FileSets, title and/or preflabel are optional
  class HasLabelValidator < ActiveModel::Validator
    def validate(record)
      if record.work?
        validate_title(record)
      elsif record.collection?
        validate_title(record)
      elsif record.authority?
        validate_record(record)
      end
    end

    def validate_record(record)
      case record
      when record.person?
        validate_person(record)
      when record.organisation?
        validate_organisation(record)
      when record.group?
        validate_group(record)
      when record.place?
        validate_preflabel(record)
      else
        validate_preflabel(record)
      end
    end

    # custom rules apply to agents as preflabel gets constructed from existing metadata
    def validate_person(record)
      record.errors[:preflabel] << 'You must provide a preflabel or name for people' if record.preflabel.blank? && record.first_name.blank? && record.given_name.blank?
    end

    def validate_organisation(record)
      record.errors[:preflabel] << 'You must provide a preflabel or name for organisations/groups' if record.preflabel.blank? && record.name.blank?
    end

    def validate_title(record)
      record.errors[:title] << 'You must provide a title' if record.title.blank?
    end

    def validate_preflabel(record)
      record.errors[:preflabel] << 'You must provide a preflabel for authorities' if record.preflabel.blank?
    end
  end
end
