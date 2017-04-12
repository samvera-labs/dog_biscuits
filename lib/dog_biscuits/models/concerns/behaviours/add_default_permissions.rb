# frozen_string_literal: true

# add the default depositor and default permissions for write
module DogBiscuits
  module AddDefaultPermissions
    extend ActiveSupport::Concern

    # Call this from within the calling app to add a depositor
    #   if no params are included the application looks for the DOGBISCUITS['depositor'] value
    #   this requires that the dog_biscuits generator has been run
    included do
      def apply_depositor(dep = nil)
        self.depositor = (dep ? dep : DOGBISCUITS['depositor'])
        edit_users ? edit_users << depositor : self.edit_users = [depositor]
      end
    end
  end
end
