#!/usr/bin/env ruby
# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 3, 2018 - created
=end

module ::QplayistPrerecord
  module GraphicalHelper
    extend self

    private

    def body_init
      @body = ::TkFrame.new @top
      body_components_init
      nil
    end

    def body_pack
      body_components_pack
      @body.pack fill: :both, side: :top
      nil
    end

  end
end
