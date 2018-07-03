# coding: utf-8

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
          2018-07-03
          2018-07-04
          2018-07-08
          ]
      dates.map{|e| Airdate.new e}
    end
  end
end
