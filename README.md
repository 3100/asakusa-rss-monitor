# asakusa-rss-monitor
To post rss updates on AsakusaSatellite.

## Installation
    gem install asakusa-rss-monitor

## Basic Usage
    monitor = AsakusaRssMonitor.new({
      :check_file => 'last_time.txt',
      :rss_url => '<TARGET RSS>',
      :bot_config => AsakusaRssMonitor::BotConfig.new({
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
To monitoring rss, you can use this script with cron or some nice libraries like
[clockwork](https://github.com/tomykaira/clockwork).

### Using clockwork

    gem install clockwork

Create clock.rb:

    require 'clockwork'
    require 'asakusa-rss-monitor'
    include Clockwork

    handler do |job|
      job.call
    end

    monitor = AsakusaRssMonitor::RssMonitor.new({..})
    another_monitor = AsakusaRssMonitor::RssMonitor.new({..}) # if you want to monitor another RSS.
    every(5.minutes, monitor)
    every(5.minutes, another_monitor)

Run it with the clockwork binary:

    clockwork clock.rb

If you want to daemonize it, see [Daemonization](https://github.com/tomykaira/clockwork#daemonization) page on clockwork.

## Milestone
* spec..
