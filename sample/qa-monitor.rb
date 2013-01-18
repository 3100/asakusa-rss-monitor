# -*- coding: utf-8 -*-
#/usr/bin/ruby

require_relative '../lib/rss-monitor'
require_relative '../lib/as-info'

class QaMonitor < RssMonitor
 def initialize(config)
    super(config)
 end

 def perform(rss_entry)
   "新着の質問がありました。 - #{rss_entry.date}\n#{rss_entry.title}\n #{rss_entry.link} "
 end
end

monitor = QaMonitor.new({
  :check_file => 'qa-checker.txt',
  :rss_url => 'http://localhost/?type=rss',
  :as_info => ASInfo.new({
    :api_key => ENV['AS_API'],
    :entry_point => ENV['ENTRY_POINT'],
    :room_id => '<target-room-id>'
  })
})
monitor.call

