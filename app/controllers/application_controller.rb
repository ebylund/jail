class ApplicationController < ActionController::Base



  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  	def self.inherit_resources
  		InheritedResources::Base.inherit_resources(self)
  		initialize_resources_class_accessors!
  		create_resources_url_helpers!
  	end

end
