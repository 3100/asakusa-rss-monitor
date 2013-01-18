# -*- coding: utf-8 -*-
#/usr/bin/ruby

require_relative 'date-save'

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

