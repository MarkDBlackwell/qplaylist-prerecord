# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

=begin
Author: Mark D. Blackwell (google me)
mdb July 3, 2018 - created
=end

require 'airshow'
require 'helper'

module ::QplayistPrerecord
  module Airshows
    include Helper
    extend self

    def all
      lines = ::File.open filename_airshows do |f|
        f.readlines.map{|e| whitespace_compress e}.reject{|e| e.empty? or e.start_with? '#'}
      end
      lines.map{|e| Airshow.new e}.sort
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
  end
end
