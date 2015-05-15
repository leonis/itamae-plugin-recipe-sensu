require 'itamae'

module Itamae
  module Resource
    class SensuPlugin < GemPackage
      define_attribute :embedded_gem, default: true

      EMBEDDED_GEM = '/opt/sensu/embedded/bin/gem'.freeze
      PLUGIN_PREFIX = 'sensu-plugins-'.freeze

      def pre_action
        super

        normalize_plugin_name
        attributes.gem_binary = (attributes.embedded_gem ? EMBEDDED_GEM : 'gem')
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
