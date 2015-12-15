module Disqus
  class Forum < Disqus::Model
    attr_accessor :id, :category, :description, :founder, :settings, :url, :guidelines, :favicon, :language, :avatar,
                  :pk, :signedUrl, :raw_guidelines, :id, :channel, :name
  
    def self.find(id)
      url       = "https://disqus.com/api/3.0/forums/details.json?api_key=#{api_key}&forum=#{id}"
      response  = make_request url
  
      assemble_with_attributes response
    end
  
    def founder
      return @founder if @founder.is_a? Disqus::User
  
      @founder = Disqus::User.find @founder
    end
  
    def posts
      return @posts if @posts.is_a? Array
  
      @posts  = []
      items = posts_from_remote
      items.each { |post| @posts << Disqus::Post.assemble_with_attributes(post) }
  
      @posts
    end
  
    private
  
    def posts_from_remote
      url = "https://disqus.com/api/3.0/forums/listPosts.json?api_key=#{api_key}&forum=#{id}"
      Disqus::Model.make_request url
    end
  end
