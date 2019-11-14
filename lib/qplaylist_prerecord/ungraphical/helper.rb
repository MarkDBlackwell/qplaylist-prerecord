# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

module ::QplayistPrerecord
  module Helper
    extend self

    private

    def dates_from_today(weekday_name_desired)
      weekday_names = %w[sun mon tue wed thu fri sat]
      week_length = weekday_names.length
      weekday_desired = weekday_names.find_index weekday_name_desired
      raise unless weekday_desired

      one_day_in_seconds = 24 * 60 * 60
      time_now = ::Time.now
      noon_hour = 12
      time_today = ::Time.new time_now.year, time_now.month, time_now.day, noon_hour
      weekday_today = time_today.wday
      addend_first = (weekday_desired - weekday_today) % week_length
      count = 3
      count.times.map do |i|
        days_to_add = addend_first + week_length * i
        t = time_today + days_to_add * one_day_in_seconds
        "#{t.year}-#{t.month}-#{t.day}"
      end
    end

    def directory_etc_example
      ::File.join project_root, 'etc', 'example'
    end

    def whitespace_compress(s)
      s.strip.gsub whitespace_compress_regexp, ' '
    end

# LOCAL:

    def dirname_script_this
      ::Kernel.__dir__
    end

    def project_root
      @project_root_private ||= ::File.realpath ::File.join(*%w[..]*3), dirname_script_this
    end

    def whitespace_compress_regexp
      @whitespace_compress_regexp_private ||= ::Regexp.new '\s++'
    end
  end
end
