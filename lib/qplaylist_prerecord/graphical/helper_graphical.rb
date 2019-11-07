# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'helper'
require 'tk'
require 'tkextlib/tile'

module ::QplayistPrerecord
  module HelperGraphical
    include Helper
    extend self

    private

    def body_window
      @body_window_private
    end

    def body_window_destroy
      body_window.destroy
      nil
    end

    def body_window_init
      @body_window_private = ::Tk::Tile::Frame.new top_window
      nil
    end

    def body_window_pack
      body_window.pack fill: :both, side: :top
      nil
    end

    def button_menu_exit
      @button_menu_exit_private ||= ::Tk::Tile::Button.new menu_window
    end

    def button_menu_exit_init(s)
      button_menu_exit.text s
      button_menu_exit.command do
        proc ::Kernel.exit
      end
      nil
    end

    def menu_window
      @menu_window_private ||= ::Tk::Tile::Frame.new top_window
    end

    def menu_window_init
      menu_components_init
      separator_components_init
      separator_init
      nil
    end

    def menu_window_pack
      menu_components_pack
      separator_components_pack
      menu_window.pack fill: :both, side: :top
      separator_pack
      nil
    end

    def pack_standard
      @pack_standard_private ||= {padx: 1, pady: 1}
    end

    def pack_standard_menu
      @pack_standard_menu_private ||= pack_standard.merge side: :left, fill: :x
    end

    def title_set(title_new)
      root.title = title_new
      nil
    end

    def window_process
      all_init
      all_pack
      window_run
      nil
    end

# LOCAL:

    def all_init
      window_init # Keep first.
      title_set program_name
      all_components_init
      nil
    end

    def all_pack
      window_pack
      all_components_pack
      nil
    end

    def root
      $root_private ||= begin
        tell_tk_which_encoding_to_use
        ::TkRoot.new
      end
    end

    def separator
      @separator_private ||= ::Tk::Tile::Frame.new top_window
    end

    def separator_init
      separator_components_init
      nil
    end

    def separator_pack
      separator_components_pack
      separator.pack fill: :both, side: :top
      nil
    end

    def tell_tk_which_encoding_to_use
      ::Tk::Encoding.encoding = ''.encoding
      nil
    end

    def top_window
      @top_window_private ||= ::Tk::Tile::Frame.new root
    end

    def window_init
      top_window
      nil
    end

    def window_pack
      top_window.pack fill: :x, side: :top
      nil
    end

    def window_run
      ::Tk.mainloop
      nil
    end
  end
end
