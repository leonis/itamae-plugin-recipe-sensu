module Itamae
  module Plugin
    module Recipe
      module Sensu
        # Your code goes here...
        def self.template_path(name)
          Pathname.new(__FILE__).join('../../../../../templates', name).to_s
        end
      end
    end
  end
end
