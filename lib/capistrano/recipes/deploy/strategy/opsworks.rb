require 'capistrano/recipes/deploy/strategy/base'
require 'aws-sdk'

module Capistrano
  module Deploy
    module Strategy
      class Opsworks < Base
        def deploy!
          if exists?(:aws_key_id) && exists?(:aws_secret_key)
            AWS.config({
              :access_key_id => configuration[:aws_key_id],
              :secret_access_key => configuration[:aws_secret_key],
            })
          else 
            abort "aws_key_id and aws_secret_key are required"
          end

          opsworks = AWS::OpsWorks.new

          if exists?(:stack_id) && exists?(:app_id) && exists?(:command_name)
            valid_options = [
              "stack_id",
              "app_id",
              "instance_ids",
              "comment",
              "custom_json"
            ]

            aws_params = {}

            valid_options.each { |x|
              sym = x.to_sym 
              if exists?(sym)
                aws_params[sym] = configuration[sym]
              end
            }

            aws_params[:command] = {}
            aws_params[:command][:name] = configuration[:command_name]

            if exists?(:command_args)
              aws_params[:command][:args] = configuration[:command_args]
            end
          else 
            abort "command_name, app_id, and stack_id are required"
          end

          opsworks.client.create_deployment(aws_params)
        end

        def check!
        end

        protected
      end

    end
  end
end

Capistrano::Configuration.instance(true).load do
  # We need to override the core deployment tasks so they use opsworks instead.
  namespace :deploy do
    desc <<-DESC
      deploy
    DESC
    task :default do
      on_rollback { run "There was a problem. Check opsworks logs for more." }
      strategy.deploy!
    end

    desc <<-DESC
      Clean up
    DESC
    task :cleanup, :except => { :no_release => true } do
      puts "nothing to cleanup..."
    end

    namespace :rollback do
      desc <<-DESC
        Rolling things back
      DESC
      task :default do
        puts "Nothing to do here"
      end
    end

  end
end