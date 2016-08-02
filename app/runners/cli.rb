class CLI

  def call
    puts "Welcome! Type 'help' for menu."
    run
  end

  def get_user_input
    gets.chomp.strip
  end

  def run
    print "Type in the zipcode to view water quality complaints: "
    input = get_user_input
    if input == "help"
      help
    elsif input == "exit"
      exit
    else
      search(input)
    end
    run
  end

  def search(input)
    search_term = input
    puts "Your search term was #{search_term}, I am searching..."
    new_instance = WaterQualityGetter.new
    descriptor_position = 0
    address_position = 0
    while descriptor_position < new_instance.get_descriptor(search_term).length && address_position < new_instance.get_address(search_term).length
        WaterQualityResults.new(new_instance.get_descriptor(search_term)[descriptor_position], new_instance.get_address(search_term)[address_position])
        descriptor_position +=1
        address_position +=1
    end

qualitative_descriptions = []
levels = []
address_array = []

        WaterQualityResults.all.each {|instance|
            new_instance_d = Descriptor.new(instance.descriptor)
            qualitative_descriptions << new_instance_d.parse_string_qualitative
            levels << new_instance_d.parse_string_level
             new_instance_a = Address.new(instance.address)
             address_array << new_instance_a.address
        }

    puts "Thank you for your patience. I found this on NYC Open Data:"



    puts "The complaint type is: #{qualitative_descriptions}, the levels are: #{levels}, and the location is: #{address_array}."
    #puts levels
    #puts address_array
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type anything else to input your search"
  end

end

# WaterQualityData.new
# WaterQualityData.get_descriptor(zipcode)
