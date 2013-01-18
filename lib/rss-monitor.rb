# -*- coding: utf-8 -*-
#/usr/bin/ruby

require_relative 'date-checker'
require_relative 'date-save'
require_relative 'post-bot'
require_relative 'rss-getter'

class RssMonitor
  def initialize(config)
    @check_file = config[:check_file]
    @rss_url = config[:rss_url]
    @as_info = config[:as_info]
  end

  def call
    checker = DateChecker.new(:file_name => @check_file)
    latest_time= checker.latest

    rss = RssGetter.new(:url => @rss_url)
    new_entries = rss.get_update latest_time
    return unless new_entries.any?

    begin
      bot = PostBot.new(:as_info => @as_info)
      new_entries.each do |entry|
        bot.post perform(entry)
      end
    rescue => exception
      p exception
    end

    # RssGetterは古い順にデータを返す
    checker.update new_entries.last.date
  end

  def perform(rss_entry)
   "新着記事があります。 - #{rss_entry.date}\n#{rss_entry.title}\n #{rss_entry.link} "
  end
end

