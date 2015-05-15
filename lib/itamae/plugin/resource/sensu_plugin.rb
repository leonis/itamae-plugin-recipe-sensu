require 'itamae'

module Itamae
  module Resource
    class SensuPlugin < GemPackage
      EMBEDDED_GEM = '/opt/sensu/embedded/bin/gem'.freeze
      PLUGIN_PREFIX = 'sensu-plugins-'.freeze

      def pre_action
        super

        normalize_plugin_name

        # force to use embedded gem if node.sensu.use_embedded_ruby is true.
        attributes.gem_binary = (node.sensu.use_embedded_ruby ? EMBEDDED_GEM : 'gem')
      end

      private

      def normalize_plugin_name
        name = attributes.package_name
        return if name.start_with?(PLUGIN_PREFIX)
        attributes.package_name = PLUGIN_PREFIX + name
      end
    end
  end
end
