module Disqus
  class User < Model
    attr_accessor :id, :disable3rdPartyTrackers, :isPowerContributor, :connections, :isPrimary, :id, :numFollowers, :rep, :numFollowing,
                  :numPosts, :location, :isPrivate, :joinedAt, :username, :numLikesReceived, :about, :name, :url, :numForumsFollowing,
                  :profileUrl, :reputation, :avatar, :signedUrl, :isAnonymous, :active_forums

    def self.find(id)
      url       = "https://disqus.com/api/3.0/users/details.json?api_key=#{api_key}&user=#{id}"
      response  = make_request url

      User.assemble_with_attributes response
    end

    def active_forums
      return @active_forums unless @active_forums.nil?

      @active_forums = []
      items = forums_from_remote
      items.each { |forum| @active_forums << Disqus::Forum.assemble_with_attributes(forum) }

      @active_forums
    end

    private

    def forums_from_remote
      url = "https://disqus.com/api/3.0/users/listActiveForums.json?api_key=#{api_key}&user=#{id}"

      Disqus::User.make_request url
    end
  end
end
