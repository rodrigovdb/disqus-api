module Disqus
  module Buildable
    def assemble_with_attributes(attrs = {})
      item = new
  
      attrs.each { |key, value| item.instance_variable_set("@#{key}", value) }
  
      item
    end
  end
end
