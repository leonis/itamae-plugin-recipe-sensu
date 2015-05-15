require 'itamae'
require_relative '../recipe/sensu.rb'
require 'json'

#
# sensu_client node.name do
#   address node.address
#   subscriptions node.roles + ['all']
#   additional(cluster: node.cluster)
# end

module Itamae
  module Resource
    class SensuClient < File
      define_attribute :action, default: :create
      define_attribute :path, type: String, default: '/etc/sensu/conf.d/client.json', default_name: false
      define_attribute :hostname, type: String, default_name: true
      define_attribute :address, type: String
      define_attribute :subscription_names, type: Array, defualt: []
      define_attribute :keepalive, type: Hash, default: {}
      define_attribute :additional, type: Hash, default: {}

      def pre_action
        attributes.content = client_json_content
        attributes.mode =  '0644'
        attributes.owner = node.sensu.user
        attributes.group = node.sensu.group

        super
      end

      private

      def client_json_content
        hash = {
          client: {
            name: attributes.hostname,
            address: attributes.address,
            subscriptions: attributes.subscription_names
          }
        }

        hash[:client][:keepalive] = attributes.keepalive unless attributes.keepalive.empty?
        hash[:client].merge!(attributes.additional)

        JSON.pretty_generate(hash)
      end
    end
  end
end
