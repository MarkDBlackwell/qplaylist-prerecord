# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'about_information'

module ::QplayistPrerecord
  module Graphical
    module GraphicalObjects

      def b_menu_about
        @b_menu_about_private ||= begin
#  See:
# http://tkdocs.com/tutorial/windows.html
          lambda_about = ::Kernel.lambda do
            AboutInformation.show = true
          end
          b = ::Tk::Tile::Button.new f_menu_window
          b.text 'About'
          b.command lambda_about
        end
      end

      def b_menu_edit
        @b_menu_edit_private ||= ::Tk::Tile::Button.new f_menu_window
      end

      def b_menu_exit
        @b_menu_exit_private ||= ::Tk::Tile::Button.new f_menu_window
      end

      def f_menu_window
        @f_menu_window_private ||= ::Tk::Tile::Frame.new f_content
      end

      def f_separator
        @f_separator_private ||= ::Tk::Tile::Frame.new f_content
      end

      def s_components
        @s_components_private ||= begin
          s = ::Tk::Tile::Separator.new f_separator
          s.orient :horizontal
        end
      end
    end
  end
end
