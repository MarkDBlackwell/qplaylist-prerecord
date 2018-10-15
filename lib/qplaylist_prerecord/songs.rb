# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'helper'
require 'song'

module ::QplayistPrerecord
  module Songs
    include Helper
    extend self

    def all(pieces, segment_count)
      filenames = input_filenames pieces, segment_count
      songs filenames
    end

    private

    def input_filenames(pieces, segment_count)
      basenames = (1..segment_count).map{|i| "#{(pieces + [i.to_s]).join '-'}.txt"}
      basenames.map{|e| ::File.join directory_etc_example, e}
    end

    def songs(filenames)
      big_array = filenames.map do |filename|
        lines = ::File.open filename do |f|
          f.readlines.map{|e| whitespace_compress e}.reject{|e| e.empty? or e.start_with? '#'}
        end
        lines_per_song = 3
        slices = lines.each_slice lines_per_song
        slices.map do |start_time_raw, artist, title|
          start_time = start_time_raw.split(' ').map &:to_i
          ::Kernel.exit unless 2 == start_time.length
          Song.new start_time, artist, title
        end
      end
      depth = 1
      big_array.flatten depth
    end
  end
end
