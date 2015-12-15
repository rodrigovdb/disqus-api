# encoding: utf-8

require "curb"
require "json"
require "yaml"
require "dotenv"

require "disqus/version"

require_relative "disqus/model/concerns/buildable"
#require_relative "model"
#require_relative "model/thread"
#require_relative "model/post"
#require_relative "model/media"
#require_relative "model/forum"
#require_relative "model/user"

module Disqus
  def self.foo
    'bar'
  end
end
