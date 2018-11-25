module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "James Alanis | Designer & Developer"
    @seo_keywords = "James Alanis Portfolio"
  end

end