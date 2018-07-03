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

    def button_exit_init(container, s)
      @button_exit = ::TkButton.new container do
        text s
        command do
          proc ::Kernel.exit
        end
      end
      nil
    end

    def button_exit_pack
      @button_exit.pack pack_standard
      nil
    end

  end
end
