require 'itamae'
require 'json'
require 'pathname'

module Itamae
  module Resource
    class SensuHandler < File
      define_attribute :action, default: :create
      define_attribute :path, type: String, default_name: false
      define_attribute :handler_name, type: String, default_name: true
      define_attribute :type, type: String
      define_attribute :command, type: String
      define_attribute :severities, type: Array, default: []
      define_attribute :additional, type: Hash, default: {}

      def pre_action
        attributes.content = handler_json

        # FIXME: fetch handler path from node and set new path if path is nil.
        config_file = attributes.handler_name + '.json'
        attributes.path ||= Pathname.new(node.sensu.directory).join('conf.d/handlers', config_file)
        attributes.mode = '0644'
        attributes.owner ||= node.sensu.user
        attributes.group ||= node.sensu.group

        super
      end

      private

      def handler_json
        hash = {
          handlers: {
            attributes.handler_name => {
              type: attributes.type,
              command: attributes.command
            }.merge(attributes.additional)
          }
        }

        JSON.pretty_generate(hash)
      end
    end
  end
end
