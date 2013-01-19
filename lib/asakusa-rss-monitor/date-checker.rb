# -*- coding: utf-8 -*-

require 'asakusa-rss-monitor/date-save'

module AsakusaRssMonitor
  class DateChecker
    def initialize(config)
      @save = DateSave.new(:file_name => config[:file_name])
    end

    def latest
      @latest ||= @save.read
    end

    def check(time)
      time == @latest
    end

    def update(time)
      @save.write time
      @latest = time
    end
  end
end

