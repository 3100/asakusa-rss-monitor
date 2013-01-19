# -*- coding: utf-8 -*-

module AsakusaRssMonitor
  class PostBot
    require 'net/http'

    def initialize(config)
      @api_key = config[:as_info][:api_key]
      @entry_point = config[:as_info][:entry_point]
      @room_id = config[:as_info][:room_id]
    end

    def post(message)
      uri = URI(@entry_point)
      Net::HTTP.version_1_2
      Net::HTTP.start(uri.host, uri.port) do |http|
        p http.post(uri.path + "/message.json",
                    "room_id=#{@room_id}&api_key=#{@api_key}&message=#{message}")
      end
    end

    def get_rooms
      uri = URI(@entry_point)
      Net::HTTP.version_1_2
      Net::HTTP.start(uri.host, uri.port) do |http|
        response = http.get(uri.path + "/room/list.json")
        p response.body
      end
    end
  end
end
