module Itamae
  module Plugin
    module Recipe
      module Sensu
        # Your code goes here...
        def self.template_path(name)
          Pathname.new(__FILE__).join('../../../../../templates', name).to_s
        end

        def self.default_attrs
          path = Pathname.new(__FILE__).join('../../../../../attributes', 'defaults.yml')
          YAML.load(File.open(path, 'r').read)
        end
      end
    end
  end
end
