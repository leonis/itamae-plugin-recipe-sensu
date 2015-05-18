require 'itamae'
require 'json'
require 'pathname'

module Itamae
  module Resource
    class SensuCheck < File
      define_attribute :action, default: :create
      define_attribute :path, type: String, default_name: false

      define_attribute :check_name, type: String, default_name: true
      define_attribute :command, type: String
      define_attribute :handlers, type: Array
      define_attribute :subscribers, type: Array
      define_attribute :interval, type: Integer
      define_attribute :additional, type: Hash, default: {}

      def pre_action
        attributes.content = check_json

        config_file = attributes.check_name + '.json'
        attributes.path ||= Pathname.new(node.sensu.directory).join('conf.d/checks', config_file)
        attributes.mode = '0644'
        attributes.owner ||= node.sensu.user
        attributes.group ||= node.sensu.group

        super
      end

      private

      def check_json
        check = {
          command: attributes.command,
          handlers: attributes.handlers,
          subscribers: attributes.subscribers,
          interval: attributes.interval
        }.merge(attributes.additional)

        hash = {
          checks: { attributes.check_name => check }
        }

        JSON.pretty_generate(hash)
      end
    end
  end
end
