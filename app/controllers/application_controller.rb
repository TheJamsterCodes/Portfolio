class ApplicationController < ActionController::Base
  
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright
 
  def set_copyright
    @copyright = JamsterViewTool::Renderer.copyright 'James Alanis', 'All rights reserved'
  end

  module JamsterViewTool
    class Renderer
      def self.copyright name, msg 
        "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
      end
    end 
  end

end