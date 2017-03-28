module DogBiscuits
  # validates that there is a preflabel (authorities) or title (works etc.)
  # For FileSets, title and/or preflabel are optional
  class HasLabelValidator < ActiveModel::Validator
    def validate(record)
      if !record.authority? and record.title.empty? and !record.file_set?
        record.errors[:title] << 'You must provide a title'
      elsif record.authority? and record.preflabel.nil? and !record.agent?
        record.errors[:preflabel] << 'You must provide a preflabel for authorities'
      elsif record.agent?
        validate_agents(record)
      end
    end

    # custom rules apply to agents as preflabel gets constructed from existing metadata
    def validate_agents(record)
      if record.current_person? and (record.given_name.nil? and record.family_name.nil? and record.preflabel.nil?)
        record.errors[:preflabel] << 'You must provide a preflabel, family name and/or given name for current person'
      elsif !record.current_person? and record.preflabel.nil?
          record.errors[:preflabel] << 'You must provide a preflabel for agents'
      end
    end
  end
end
