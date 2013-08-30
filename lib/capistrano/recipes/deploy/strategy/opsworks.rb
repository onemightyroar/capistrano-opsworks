require 'capistrano/recipes/deploy/strategy/base'

module Capistrano
  module Deploy
    module Strategy

      # An abstract superclass, which forms the base for all deployment
      # strategies which work by grabbing the code from the repository directly
      # from remote host. This includes deploying by checkout (the default),
      # and deploying by export.
      class Opsworks < Base
        # Executes the SCM command for this strategy and writes the REVISION
        # mark file to each host.
        def deploy!
          puts "OK AM I HERE?????"
          #scm_run "#{command} && #{mark}"
        end

        def check!
          super.check do |d|
            puts "CHECK 1 2"
          end
        end

        protected
      end

    end
  end
end