# -*- coding: utf-8 -*-
#/usr/bin/ruby

class ASInfo
  attr_accessor :api_key, :entry_point, :room_id
  def initialize(config)
    @api_key = config[:api_key]
    @entry_point = config[:entry_point]
    @room_id = config[:room_id]
  end
end

