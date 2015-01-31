module ApplicationHelper

	class RoleConstraint
	  def initialize(*roles)
	    @admin = admin
	  end

	  def matches?(request)
	    @admin.include? request.env['warden'].user.try(:admin)
	  end
	end
end
