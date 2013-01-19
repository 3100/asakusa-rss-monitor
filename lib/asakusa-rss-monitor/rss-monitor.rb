# -*- coding: utf-8 -*-

require 'asakusa-rss-monitor/date-checker'
require 'asakusa-rss-monitor/date-save'
require 'asakusa-rss-monitor/post-bot'
require 'asakusa-rss-monitor/rss-getter'

module AsakusaRssMonitor

  class RssMonitor
    def initialize(config)
      @check_file = config[:check_file]
      @rss_url = config[:rss_url]
      @bot_config = config[:bot_config]
    end

    def call
      checker = DateChecker.new(:file_name => @check_file)
      last_time= checker.last_time

      rss = RssGetter.new(:url => @rss_url)
      new_articles = rss.get_new_articles last_time
      return unless new_articles.any?

      begin
        bot = PostBot.new(:bot_config => @bot_config)
        new_articles.each do |entry|
          bot.post perform(entry)
        end
      rescue => exception
        p exception
        return
      end
      # rss.get_new_entries returns articles by ascending order
      checker.update new_articles.last.date
    end

    def perform(rss_entry)
     "New Article - #{rss_entry.date}\n#{rss_entry.title}\n #{rss_entry.link} "
    end
  end
end
