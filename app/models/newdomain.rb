require 'alexa'
require 'date'
class Newdomain < ApplicationRecord
	has_many :domainranks
	#validates :domain_name, presence: true,
    #                length: { maximum: 3 }
    def updaterecords
    	
    	@newdomains = Newdomain.all
    	@newdomains.each_with_index do |objectDate,index|
    		domainname = objectDate.domain_name;
          client = Alexa::Client.new(access_key_id: "your access_key_id",   

                    secret_access_key:"youre api secret keys")
    	rankNO = client.url_info(url: domainname).rank;
    	currentdate = DateTime.now.strftime('%Q')
        @newdomainRank = Newdomain.find(objectDate.id)        
        @rank = @newdomainRank.domainranks.create!(:rank => rankNO, :created_date => currentdate)
        end
    end
end
