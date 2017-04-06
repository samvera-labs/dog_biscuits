# frozen_string_literal: true

# add the default depositor and default permissions for write
module DogBiscuits
  module AddDefaultPermissions
    extend ActiveSupport::Concern

    # call this from within the calling app to add a depositor
    #   if no params are included the application looks for the DOGBISCUITS['depositor'] value
    #   this requires that the dog_biscuits depositor generator has been run
    included do
      def apply_depositor(dep = nil)
        self.depositor = if dep.nil?
                           DOGBISCUITS['depositor']
                         else
                           dep
                         end
        self.edit_users += [depositor]
      end
    end
  end
end
