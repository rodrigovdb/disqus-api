module Disqus
  class Post < Disqus::Model
    attr_accessor :id, :forum, :parent, :isApproved, :author, :media, :isDeleted, :isFlagged, :dislikes,
                  :raw_message, :createdAt, :id, :thread, :numReports, :isDeletedByAuthor, :likes,
                  :isEdited, :message, :isSpam, :isHighlighted, :points

    def self.find(id)
      url       = "https://disqus.com/api/3.0/posts/getContext.json?api_key=#{api_key}&post=#{id}"
      response  = make_request url

      assemble_with_attributes response.first
    end

    def thread
      return @thread if @thread.is_a? Disqus::Thread

      @thread = Disqus::Thread.find @thread
    end

    def media
      return [] if @media.empty?
      return @media if @media.first.is_a? Disqus::Media

      medias = []
      @media.each { |item| medias << Disqus::Media.assemble_with_attributes(item) }

      @media = medias
    end

    def author
      return @author if @author.is_a? Disqus::User

      @author = Disqus::User.find @author['id']
    end
  end
end
