module Disqus
  class Media
    extend Disqus::Concerns::Buildable

    attr_accessor :id, :forum, :thumbnailURL, :description, :thread, :title, :url, :mediaType,
                  :html, :location, :resolvedUrl, :post, :thumbnailUrl, :type, :metadata
  end
end
