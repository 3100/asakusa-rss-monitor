# -*- coding: utf-8 -*-
#/usr/bin/ruby

require 'rss'

class RssGetter
  def initialize(config)
    @url = config[:url]
  end

  def get_update(time)
    results = RSS::Parser.parse(@url)
    results.items.select{|item|
      item.date > time
    }.reverse
  end
end

