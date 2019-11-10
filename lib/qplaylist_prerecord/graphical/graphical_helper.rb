# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'tk'
require 'tkextlib/tile'

module ::QplayistPrerecord
  module GraphicalHelper
    extend self

    private

    def f_body_window
      @f_body_window_private
    end

    def f_body_window_destroy
      f_body_window.destroy
      nil
    end

    def f_body_window_init
# Recreates on every call:
      @f_body_window_private = begin
        f = ::Tk::Tile::Frame.new f_content
        f.grid column: 0, row: 1
      end
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

# LOCAL:

    def f_content
      $f_content_private ||= begin
        f = ::Tk::Tile::Frame.new root
        f.padding '3 3 3 3'
        f.grid sticky: :wnes
      end
    end

    def root
      $root_private ||= begin
        tell_tk_which_encoding_to_use
        ::TkRoot.new
      end
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
  end
end
