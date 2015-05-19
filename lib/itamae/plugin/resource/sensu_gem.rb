require 'itamae'

module Itamae
  module Resource
    class SensuGem < GemPackage
      define_attribute :gem_binary, type: String, default: nil
      define_attribute :prerelease, default: false
      define_attribute :plugin, default: false

      EMBEDDED_GEM = '/opt/sensu/embedded/bin/gem'.freeze
      PLUGIN_PREFIX = 'sensu-plugins-'.freeze

      def pre_action
        if attributes.gem_binary
          Logger.formatter.color :yellow do
            Logger.warn "sensu_gem resource overwrite gem_binary option by '#{EMBEDDED_GEM}'."
            Logger.warn "If you want to use your gem, use 'gem_package' resource."
          end
        end
        attributes.gem_binary = EMBEDDED_GEM

        package_name = attributes.package_name
        if attributes.plugin && !package_name.start_with?(PLUGIN_PREFIX)
          attributes.package_name = PLUGIN_PREFIX + package_name
        end

        super
      end

      # NOTE: This resource override this method to enable '--prerelease' option.
      def installed_gems
        gems = []

        cmd = [attributes.gem_binary, 'list', '-l']
        cmd << '--prerelease' if attributes.prerelease

        run_command(cmd).stdout.each_line do |line|
          next unless /\A([^ ]+) \(([^\)]+)\)\z/ =~ line.strip

          name = $1
          versions = $2.split(', ')
          gems << { name: name, versions: versions }
        end
        gems
      rescue Backend::CommandExecutionError
        []
      end

      # NOTE: This resource override this method to enable '--prerelease' option.
      def install!
        cmd = [attributes.gem_binary, 'install']
        cmd << '-v' << attributes.version if attributes.version
        cmd << '--source' << attributes.source if attributes.source
        cmd << '--prerelease' if attributes.prerelease
        cmd << attributes.package_name

        run_command(cmd)
      end
    end
  end
end
