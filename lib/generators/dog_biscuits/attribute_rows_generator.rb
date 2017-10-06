# frozen_string_literal: true

class DogBiscuits::AttributeRowsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def banner
    say_status("info", "Generating _attribute_rows.html.erb", :blue)
  end

  def attribute_rows
    DogBiscuits.config.accepted_models.each do |model|
      attributes_file = File.join('app/views/hyrax', class_path, "#{model.underscore.pluralize}/_attribute_rows.html.erb")
      copy_file '_attribute_rows.html.erb', attributes_file

      injection = ''
      DogBiscuits.config.send("#{model.underscore}_properties").each do |term|
        # Append _label onto any controlled properties
        if "#{model}".constantize.controlled_properties.include? term
          injection += "\n<%= presenter.attribute_to_html(:#{term}_label) %>"
          if term.to_s.include? 'url'
            injection += "\n<%= presenter.attribute_to_html(:#{term}, render_as: :external_link) %>"
          elsif DogBiscuits.config.facet_properties.include? term
            injection += "\n<%= presenter.attribute_to_html(:#{term}, render_as: :faceted) %>"
          else
            injection += "\n<%= presenter.attribute_to_html(:#{term}) %>"
          end
        end

        inject_into_file attributes_file, after: '# display fields for show page' do
          injection unless attributes_file.include? injection
        end
      end
    end
  end
end
