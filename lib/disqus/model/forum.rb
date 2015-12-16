module Disqus
  class Forum < Model
    attr_accessor :id, :category, :description, :founder, :settings, :url, :guidelines, :favicon, :language, :avatar,
                  :pk, :signedUrl, :raw_guidelines, :id, :channel, :name, :posts, :threads

    def self.find(id)
      url       = "https://disqus.com/api/3.0/forums/details.json?api_key=#{api_key}&forum=#{id}"
      response  = make_request url

      assemble_with_attributes response
    end

    def founder
      return @founder if @founder.is_a? Disqus::User

      @founder = Disqus::User.find @founder
    end

    def threads
      return @threads if @threads.is_a? Array

      @threads  = []
      items     = objects_from_remote 'Threads'
      items.each { |thread| @threads << Disqus::Thread.assemble_with_attributes(thread) }

      @threads
    end

    def posts
      return @posts if @posts.is_a? Array

      @posts  = []
      items   = objects_from_remote 'Posts'
      items.each { |post| @posts << Disqus::Post.assemble_with_attributes(post) }

      @posts
    end

    private

    def objects_from_remote(object)
      url = "https://disqus.com/api/3.0/forums/list#{object}.json?api_key=#{api_key}&forum=#{id}"
      Disqus::Model.make_request url
    end
  end
end
