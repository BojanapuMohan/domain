class WelcomeController < ApplicationController
  def index
  	#@newdomains = Newdomain.all
  	@newdomains = Newdomain.select(:id, :domain_name, :rank, :created_date).joins(:domainranks)
  end
  def profile
  end
  def allusers
  	@users = User.all
  end
end
