require 'rest-client'
require 'json'

class WaterQualityGetter

  attr_reader :url, :water_data 

  
  def initialize
    @url = 'http://data.cityofnewyork.us/resource/qfe3-6dkn.json'
    @water_data = JSON.load(open(url))
  end

  def get_descriptor
    descriptors = []
     @water_data.each{|complaint| 
      if complaint["incident_zip"] == ####
      descriptors << complaint["descriptor"]
      end
    }
  end

    def get_address
    addresses = []
     @water_data.each{|complaint| 
      if complaint["incident_zip"] == ####
      descriptors << complaint["incident_address"]
      end
    }
  end

end




