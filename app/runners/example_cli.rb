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
    url = 'http://data.cityofnewyork.us/resource/qfe3-6dkn.json'
    descriptions = ExampleClass.new(url).example_method.sample
    local_addresses = ExampleClass.new(url).example_method.sample
    puts "Thank you for your patience. I found this on NYC Open Data:"
    puts ##????
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type anything else to input your search"
  end

end

# WaterQualityData.new
# WaterQualityData.get_descriptor(zipcode)
