# Capistrano Opsworks

This gem allows you to trigger opsworks deployments from a remote capistrano project

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-opsworks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-opsworks

## Usage

Add the following to your deploy script:
```Ruby
set :deploy_via, :opsworks
require 'capistrano/opsworks'
```

The opsworks strategy overwrites the built in deployment tasks, so you should only `require 'capistrano/opsworks'` if you are using the opsworks deployment strategy.

The following options are allowed:
```Ruby
set :aws_key_id, '[string]'     #required
set :aws_secret_key, '[string]' #required
set :app_id, '[string]'         #required
set :command_name, '[string]'   #required (eg. 'deploy')
set :stack_id, '[string]'       #required

set :instance_ids, '[array]'    #optional
set :command_args, '[hash]'     #optional
set :comment, '[string]'        #optional
set :custom_json, '[string]'    #optional
```

## Contributors
* [Brian Muse](https://github.com/brianmuse)
