require 'itamae'
require 'json'
require 'pathname'

module Itamae
  module Resource
    class SensuMutator < File
      define_attribute :action, default: :create
      define_attribute :path, type: String, default_name: false

      define_attribute :mutator_name, type: String, default_name: true
      define_attribute :command, type: String
      define_attribute :additional, type: Hash, default: {}

      def pre_action
        attributes.content = mutator_json

        config_file = attributes.mutator_name + '.json'
        attributes.path ||= Pathname.new(node.sensu.directory).join('conf.d/mutators', config_file)
        attributes.mode = '0644'
        attributes.owner ||= node.sensu.user
        attributes.group ||= node.sensu.group

        super
      end

      private

      def mutator_json
        mutator = {
          command: attributes.command
        }.merge(attributes.additional)

        hash = {
          mutators: {
            attributes.mutator_name => mutator
          }
        }

        JSON.pretty_generate(hash)
      end
    end
  end
end
