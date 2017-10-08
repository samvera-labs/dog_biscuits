class SingularizeInput < MultiValueInput

  # Code adapted from https://github.com/curationexperts/laevigata/blob/master/app/inputs/committee_member_input.rb
  # To use; copy https://github.com/samvera/hydra-editor/blob/master/app/views/records/edit_fields/_default.html.erb
  #   to the local field you want to singularize, eg. view in app/views/records/edit_fields/_{field_name}.html.erb
  #   and change multi_value to singularize

  # Overriding method from hydra-editor:
  # Display single value only.
  def collection
    @collection ||= begin
      val = object[attribute_name]
      val.reject { |value| value.to_s.strip.blank? } + ['']
    end
  end

  # Overriding method from hydra-editor:
  # Since we are just using a single value, we don't need to
  # wrap the fields with <ul> and <li> tags, so just yield
  # with no wrapper tags.
  def outer_wrapper
    yield
  end

  # Overriding method from hydra-editor:
  # Since we are just using a single value, we don't need to
  # wrap the fields with <ul> and <li> tags, so just yield
  # with no wrapper tags.
  def inner_wrapper
    yield
  end
end