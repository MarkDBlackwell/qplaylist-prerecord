# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 3, 2018 - created
=end

require 'airshow'

module ::QplayistPrerecord
  module Airshows
    extend self

    def all
      names = %w[
          Young-At-Heart
          Baltimore-Hit-Parade-Tue
          Baltimore-Hit-Parade-Sun
          ]
      names.map{|e| Airshow.new e}.sort
    end
  end
end
