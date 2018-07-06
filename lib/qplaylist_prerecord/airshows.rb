# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 3, 2018 - created
=end

require 'airshow'
require 'helper'

module ::QplayistPrerecord
  module Airshows
    extend self

    def all
      names = %w[
          Young-At-Heart
          Baltimore-Hit-Parade-Tue
          Baltimore-Hit-Parade-Sun
          ]
      names.map{|e| Airshow.new "#{e} 0123"}.sort
    end

    private

    def directory_playlist
# For production, this should change:
      directory_etc_example
    end

    def filename_airshows
      basename = 'cart-numbers-airshows.txt'
      ::File.join directory_playlist, basename
    end

    def segments
      lines = ::File.open filename_airshows do |f|
        f.readlines.map{|e| whitespace_compress e}.reject{|e| e.empty? or e.start_with? '#'}
      end
      lines.map do |line|
      end
    end
  end
end
