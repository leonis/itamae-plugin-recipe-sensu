# Load default attributes.
require 'pathname'
require Pathname.new(__FILE__).join('../../sensu.rb')

node.reverse_merge!(Itamae::Plugin::Recipe::Sensu.default_attrs)
