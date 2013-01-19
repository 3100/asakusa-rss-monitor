# -*- coding: utf-8 -*-

module AsakusaRssMonitor
  class PostBot
    require 'net/http'

    def initialize(config)
      @config = config[:bot_config]
    end

    def post(message)
      uri = URI(@config.entry_point)
      Net::HTTP.version_1_2
      Net::HTTP.start(uri.host, uri.port) do |http|
        p http.post(uri.path + "/message.json",
                    "room_id=#{@config.room_id}&api_key=#{@config.api_key}&message=#{message}")
      end
    end

    def get_rooms
      uri = URI(@config.entry_point)
      Net::HTTP.version_1_2
      Net::HTTP.start(uri.host, uri.port) do |http|
        response = http.get(uri.path + "/room/list.json")
        p response.body
      end
    end
  end
end
