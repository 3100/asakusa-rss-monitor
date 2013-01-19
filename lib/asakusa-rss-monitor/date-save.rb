# -*- coding: utf-8 -*-
#/usr/bin/ruby

module AsakusaRssMonitor
  class DateSave
    require 'time'

    def initialize(config)
      @file_name = config[:file_name]
    end

    def read
      return Time.new(1999, 1, 1, 0, 0, 0) unless File.exist?(@file_name) # 十分古い日付
      text = File.read(@file_name, :encoding => Encoding::UTF_8)
      Time.parse text
    end

    def write(time)
      File.write(@file_name, time.to_s)
    end
  end
end
