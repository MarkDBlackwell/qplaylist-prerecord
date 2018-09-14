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

require 'airdate'

module ::QplayistPrerecord
  module Airdates
    extend self

    def all
      dates = %w[
          2018-07-08
          2018-07-04
          2018-07-03
          ]
      dates.map{|e| Airdate.new e}.sort
    end
  end
end
