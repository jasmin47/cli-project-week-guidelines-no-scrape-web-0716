class Descriptor

  def initialize(description)
    @description = description
  end

  def parse_string_qualitative
    qualitative = @description.split("(")[0]
    qualitative
    end

  def parse_string_level
    level = @description.split("(")[-1]
    level.chop
  end
end
