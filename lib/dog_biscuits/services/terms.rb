# frozen_string_literal: true

module DogBiscuits
  module Terms
    include Qa::Authorities::WebServiceBase

    class DepartmentsTerms < TermsService
      def terms_list
        'departments'
      end
    end

    class EventsTerms < TermsService
      def terms_list
        'events'
      end
    end

    class GroupsTerms < TermsService
      def terms_list
        'groups'
      end
    end

    class PeopleTerms < TermsService
      def terms_list
        'people'
      end
    end

    class PlacesTerms < TermsService
      def terms_list
        'places'
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

    # Conflicts with table-based auth registered by hyrax
    # Use concepts instead
    class ConceptsTerms < TermsService
      def terms_list
        'concepts'
      end
    end
  end
end
