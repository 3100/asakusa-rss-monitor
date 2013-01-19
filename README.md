# asakusa-rss-monitor
To post rss updates on AsakusaSatellite.

## Installation
    gem install asakusa-rss-monitor

## Basic Usage
    monitor = AsakusaRssMonitor.new({
      :check_file => 'last_time.txt',
      :rss_url => '<TARGET RSS>',
      :as_info => AsakusaRssMonitor::ASInfo.new({
        :api_key => '<YOUR AS API KEY>',
        :entry_point => '<YOUR AS ENTRY POINT>', # cf. 'http://localhost:3000/api/v1'
        :room_id => '<ROOM ID>'
      })
    })
    monitor.call

## Post Message Customizing
    class CustomMonitor < AsakusaRssMonitor::RssMonitor
      def initialize(config)
        super(config)
      end
      
      # override this.
      def perform(rss_entry)
        "New Article. - #{rss_entry.date}\n#{rss_entry.title}\n#{rss_entry.link}"
      end
    end

## Monitoring RSS
To monitoring rss, you can use this script with cron.

## Milestone
* spec..
