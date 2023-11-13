# frozen_string_literal: true

require 'pathname'
require 'yaml'

require_relative 'rubocloud/inject'
require_relative 'rubocloud/version'
require_relative 'rubocop/cop/rubocloud/example'

module MyExtension
  PROJECT_ROOT = ::Pathname.new(__dir__).parent.expand_path.freeze

  CONFIG_DEFAULT = PROJECT_ROOT.join('config', 'default.yml').freeze

  CONFIG = ::YAML.safe_load(CONFIG_DEFAULT.read).freeze

  private_constant(:CONFIG_DEFAULT, :PROJECT_ROOT)
end

MyExtension::Inject.defaults!
require_relative 'rubocop/cop/lint/duplicate_string_literal'
