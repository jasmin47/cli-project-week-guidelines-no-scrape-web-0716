#require 'rest-client'
require 'json'

class WaterQualityGetter

  attr_reader :url, :water_data


  def initialize
    @url = 'http://data.cityofnewyork.us/resource/qfe3-6dkn.json'
    @water_data = JSON.load(open(url))
  end

  def get_descriptor(search_term)
    descriptors = []
     @water_data.each{|complaint|
      if complaint["incident_zip"] == search_term
      descriptors << complaint["descriptor"]
      end
    }
    descriptors
  end

    def get_address(search_term)
    addresses = []
     @water_data.each{|complaint|
      if complaint["incident_zip"] == search_term
      addresses << complaint["incident_address"]
      end
    }
    addresses
  end

end
