module Disqus
  class Thread < Model
    attr_accessor :id, :feed, :canModerate, :identifiers, :dislikes, :likes, :message, :id, :isDeleted, :category, :author, :userScore,
                  :isSpam, :signedLink, :createdAt, :raw_message, :isClosed, :link, :slug, :forum, :clean_title, :posts, :userSubscription,
                  :title, :canPost, :highlightedPost
  
    def self.find(id)
      url       = "https://disqus.com/api/3.0/threads/details.json?api_key=#{api_key}&thread=#{id}"
      response  = make_request url
  
      DisqusThread.assemble_with_attributes response
    end
  
    # Lazy load. Just search posts if is asked for.
    def posts
      return @posts if @posts.is_a? Array
  
      @posts  = []
      items = posts_from_remote
      items.each { |post| @posts << DisqusPost.assemble_with_attributes(post) }
  
      @posts
    end
  
    def author
      return @author if @author.is_a? DisqusUser
  
      @author = DisqusUser.find @author
    end
  
    private
  
    def posts_from_remote
      url = "https://disqus.com/api/3.0/threads/listPosts.json?api_key=#{api_key}&thread=#{id}"
      DisqusThread.make_request url
    end
  end
end
