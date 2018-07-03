#!/usr/bin/env ruby
# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 2, 2018 - created
=end

require 'graphical_helper'
require 'tk'

module ::QplayistPrerecord
  module About
    extend self

    def main
      everything
      nil
    end

    private

    def body_components_init
# Keep alphabetical:
      button_okay_init
      label_message_text_init
# (End keep alphabetical.)
      nil
    end

    def body_components_pack
# Keep order:
      label_message_text_pack
      button_okay_pack
# (End keep order.)
      nil
    end

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

    def button_okay_init
      @button_okay = ::TkButton.new @body do
        text 'OK'
        command do
          proc ::Kernel.exit
        end
      end
      nil
    end

    def button_okay_pack
      @button_okay.pack pack_standard
      nil
    end

    def everything
      everything_init
      everything_pack
      window_run
      nil
    end

    def everything_init
      window_init # Keep first.
# Keep alphabetical:
      body_init
      title_init
# (End keep alphabetical.)
      nil
    end

    def everything_pack
      window_pack
      body_pack
      nil
    end

    def label_message_text_init
      @label_message_text = ::TkLabel.new @body do
        text <<END.chomp
QPlaylist Prerecord

Copyright (C) 2018 Mark D. Blackwell.
No license. All rights reserved.

Contact: Mark D. Blackwell
markdblackwell01@gmail.com
END
      end
      nil
    end

    def label_message_text_pack
      @label_message_text.pack pack_standard
      nil
    end

    def pack_standard
      @pack_standard_value ||= {padx: 1, pady: 1}
    end

    def title_init
      @program_name = ''
      title_set @program_name
      nil
    end

    def title_set(title_new)
      @root.title = title_new
      nil
    end

    def window_init
      @root = ::TkRoot.new
      @top = ::TkFrame.new @root
      nil
    end

    def window_pack
      @top.pack fill: :x, side: :top
      nil
    end

    def window_run
      ::Tk.mainloop
      nil
    end
  end
end
