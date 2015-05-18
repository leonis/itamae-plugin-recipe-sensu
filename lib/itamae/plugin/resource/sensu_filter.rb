require 'itamae'
require 'json'
require 'pathname'

module Itamae
  module Resource
    class SensuFilter < File
      define_attribute :action, default: :create
      define_attribute :path, type: String, default_name: false

      define_attribute :filter_name, type: String, default_name: true
      define_attribute :filter_attributes, type: Hash
      define_attribute :negate, default: false
      define_attribute :additional, type: Hash, default: {}

      def pre_action
        attributes.content = filter_json

        filter_file = attributes.filter_name + '.json'
        attributes.path ||= Pathname.new(node.sensu.directory).join('conf.d/filters', filter_file)
        attributes.mode = '0644'
        attributes.owner ||= node.sensu.user
        attributes.group ||= node.sensu.group

        super
      end

      private

      def filter_json
        filter = {
          attributes: attributes.filter_attributes,
          negate: attributes.negate
        }.merge(attributes.additional)

        hash = {
          filters: {
            attributes.filter_name => filter
          }
        }

        JSON.pretty_generate(hash)
      end
    end
  end
end
