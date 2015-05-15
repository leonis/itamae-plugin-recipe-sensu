require 'pathname'
require Pathname.new(__FILE__).join('../../resource/sensu_plugin.rb').to_s

module Itamae
  module Plugin
    module Recipe
      module Sensu
        def self.root_path
          '../../../../..'
        end

        # Your code goes here...
        def self.template_path(name)
          Pathname.new(__FILE__).join(root_path, 'templates', name).to_s
        end

        def self.default_attrs
          path = Pathname.new(__FILE__).join(root_path, 'attributes', 'defaults.yml')
          YAML.load(File.open(path, 'r').read)
        end
      end
    end
  end
end
