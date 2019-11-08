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
  module GraphicalHelper
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
# Recreates on every call:
      @body_window_private = ::Tk::Tile::Frame.new f_content
      nil
    end

    def body_window_pack
      body_window.pack fill: :both, side: :top
      nil
    end

    def b_menu_exit
      @b_menu_exit_private ||= ::Tk::Tile::Button.new menu_window
    end

    def b_menu_exit_init(s)
      b_menu_exit.text s
      b_menu_exit.command do
        proc ::Kernel.exit
      end
      nil
    end

    def menu_window
      @menu_window_private ||= ::Tk::Tile::Frame.new f_content
    end

    def menu_window_init
      menu_components_init
      s_components_init
      separator_init
      nil
    end

    def menu_window_pack
      menu_components_pack
      s_components_pack
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

    def f_content
      $f_content_private ||= begin
        f = ::Tk::Tile::Frame.new root
        f.grid sticky: :wnes
      end
    end

    def root
      $root_private ||= begin
        tell_tk_which_encoding_to_use
        ::TkRoot.new
      end
    end

    def separator
      @separator_private ||= ::Tk::Tile::Frame.new f_content
    end

    def separator_init
      s_components_init
      nil
    end

    def separator_pack
      s_components_pack
      separator.pack fill: :both, side: :top
      nil
    end

    def tell_tk_which_encoding_to_use
      ::Tk::Encoding.encoding = ''.encoding
      nil
    end

    def weights_column_and_row_default_set_up(*args)
      args.reverse_each do |e|
        ::TkGrid.columnconfigure e, 0, weight: 1
        ::TkGrid.   rowconfigure e, 0, weight: 1
      end
      nil
    end

    def weights_column_and_row_set_up
      weights_column_and_row_default_set_up f_content, root
      ::TkGrid.rowconfigure f_content, 1, weight: 1
      nil
    end

    def window_init
      f_content.padding '3 3 3 3'
      weights_column_and_row_set_up
      nil
    end

    def window_pack
      f_content.pack fill: :x, side: :top
      nil
    end

    def window_run
      ::Tk.mainloop
      nil
    end
  end
end
