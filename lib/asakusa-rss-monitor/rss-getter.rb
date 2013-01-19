# -*- coding: utf-8 -*-

module AsakusaRssMonitor
  class RssGetter
    require 'rss'

    def initialize(config)
      @url = config[:url]
    end

    def get_new_entries(time)
      results = RSS::Parser.parse(@url)
      results.items.select{|item|
        item.date > time
      }.reverse
    end
  end
end
