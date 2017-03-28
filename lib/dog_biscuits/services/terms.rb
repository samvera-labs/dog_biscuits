module DogBiscuits
  module Terms
    include Qa::Authorities::WebServiceBase

    # Sub-set of Current Organisations
    class DepartmentTerms < TermsService
      def terms_list
        'departments'
      end
    end
    # class QualificationNameTerms < TermsService
    #   def terms_list
    #     'qualification_names'
    #   end
    # end
    class CurrentPersonTerms < TermsService
      def terms_list
        'current_people'
      end
    end
    class CurrentOrganisationTerms < TermsService
      def terms_list
        'current_organisations'
      end
    end
    # class SubjectTerms < TermsService
    #   def terms_list
    #     'subjects'
    #   end
    # end
    # class JournalTerms < TermsService
    #   def terms_list
    #     'journals'
    #   end
    # end
    class ProjectTerms < TermsService
      def terms_list
        'projects'
      end
    end
  end
end
