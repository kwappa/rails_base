require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module RailsBase
  class Application < Rails::Application
    config.autoload_paths += [
      Rails.root.join('lib/autoload'),
    ]

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.css *.js)
    config.time_zone = 'Tokyo'

    config.generators do |g|
      g.template_engine = :haml
      g.test_framework  = :rspec
      g.stylesheets     = false
      g.javascripts     = false
      g.helper          = false
      g.view_specs      = false
    end

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
