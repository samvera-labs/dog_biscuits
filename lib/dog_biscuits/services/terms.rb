module DogBiscuits
  module Terms
    include Qa::Authorities::WebServiceBase

    # Sub-set of Current Organisations
    class DepartmentsTerms < TermsService
      def terms_list
        'departments'
      end
    end

    class PeopleTerms < TermsService
      def terms_list
        'people'
      end
    end

    class OrganisationsTerms < TermsService
      def terms_list
        'organisations'
      end
    end

    class ProjectsTerms < TermsService
      def terms_list
        'projects'
      end
    end
  end
end
