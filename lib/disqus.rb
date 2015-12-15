# encoding: utf-8

require "curb"
require "json"
require "yaml"
require "dotenv"

require "disqus/version"

require_relative "disqus/model/concerns/buildable"
require_relative "disqus/model"
#require_relative "disqus/model/thread"
#require_relative "disqus/model/post"
#require_relative "disqus/model/media"
#require_relative "disqus/model/forum"
#require_relative "disqus/model/user"

module Disqus
  def self.foo
    'bar'
  end
end
