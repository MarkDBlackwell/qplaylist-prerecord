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
          Baltimore-Hit-Parade-Sun
          Baltimore-Hit-Parade-Tue
          Young-At-Heart
          ]
      names.map{|e| Airshow.new e}
    end
  end
end
