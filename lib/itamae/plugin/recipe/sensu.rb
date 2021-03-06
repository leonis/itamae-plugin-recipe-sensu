require 'pathname'
(Pathname.new(__FILE__).join('../../')).tap do |path|
  %w[check client filter gem handler mutator].each do |resource|
    require path.join('resource/', 'sensu_' + resource + '.rb').to_s
  end
end

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
