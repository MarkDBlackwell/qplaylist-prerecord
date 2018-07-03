#!/usr/bin/env ruby
# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 2, 2018 - created

Ruby's use of the Tk graphical toolkit doesn't seem to allow multiple roots or windows, so let's use a separate program for the 'About' popup.
=end

require 'tk'

module ::QplayistPrerecord
  module About
    extend self

    def main
      everything_init
      everything_pack
      window_run
      nil
    end

    private

    def body_init
      @body = ::TkFrame.new @top
      prompt_choice_init
      button_okay_init
      nil
    end

    def body_pack
      @prompt_choice.pack pack_standard
      @body.pack fill: :both, side: :top
      button_okay_pack
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

    def pack_standard
      @pack_standard_value ||= {padx: 1, pady: 1}
    end

    def prompt_choice_init
      @prompt_choice = ::TkLabel.new @body do
        text 'About'
      end
      nil
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

::QplayistPrerecord::About::main