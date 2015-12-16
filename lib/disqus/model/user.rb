module Disqus
  class User < Model
    attr_accessor :id, :disable3rdPartyTrackers, :isPowerContributor, :connections, :isPrimary, :id, :numFollowers, :rep, :numFollowing,
                  :numPosts, :location, :isPrivate, :joinedAt, :username, :numLikesReceived, :about, :name, :url, :numForumsFollowing,
                  :profileUrl, :reputation, :avatar, :signedUrl, :isAnonymous, :forums

    def self.find(id)
      url       = "https://disqus.com/api/3.0/users/details.json?api_key=#{api_key}&user=#{id}"
      response  = make_request url

      User.assemble_with_attributes response
    end

    def forums
      return @forums unless @forums.nil?

      @forums = []
      items = forums_from_remote
      items.each { |forum| @forums << Disqus::Forum.assemble_with_attributes(forum) }

      @forums
    end

    private

    def forums_from_remote
      url = "https://disqus.com/api/3.0/users/listActiveForums.json?api_key=#{api_key}&user=#{id}"

      Disqus::User.make_request url
    end
  end
end
