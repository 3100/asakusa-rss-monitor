# -*- coding: utf-8 -*-

require 'asakusa-rss-monitor/date-save'

module AsakusaRssMonitor
  class DateChecker
    def initialize(config)
      @save = DateSave.new(:file_name => config[:file_name])
    end

    def last_time
      @last_time ||= @save.read
    end

    def check(time)
      time == @last_time
    end

    def update(time)
      @save.write time
      @last_time = time
    end
  end
end

