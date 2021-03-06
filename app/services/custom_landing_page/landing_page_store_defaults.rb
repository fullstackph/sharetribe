module CustomLandingPage
  module LandingPageStoreDefaults

    DEFAULT_PARAGRAPH_LINK_COLORS = {
      "paragraph_link_color"       => { "type" => "marketplace_data", "id" => "primary_color" },
      "paragraph_link_color_hover" => { "type" => "marketplace_data", "id" => "primary_color_darken" }
    }
    DEFAULT_SOCIAL_DATA = {
      "page" => {
        "social_media_title"       => { "type" => "marketplace_data", "id" => "social_media_title" },
        "social_media_description" => { "type" => "marketplace_data", "id" => "social_media_description" },
        "meta_description" => { "type" => "marketplace_data", "id" => "meta_description" }
      }
    }.freeze

    module_function

    # This method adds some default values to the loaded structure.
    #
    # This method is important for backwards compatibility. When we add a new
    # value to the structure, the new value can't be found from the old structure
    # that is stored in the DB. That's why we need to add default values for old data.
    #
    def add_defaults(structure)
      sections = structure["sections"].map { |section|
        kind = section["kind"]

        case kind
        when "info", "categories", "listings"
          DEFAULT_PARAGRAPH_LINK_COLORS.merge(section)
        else
          section
        end
      }

      structure.deep_merge!(DEFAULT_SOCIAL_DATA)
      structure.merge("sections" => sections)
    end
  end
end
