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
  module GraphicalObjects

    def b_button_label
      @b_button_label_private ||= begin
        b = ::Tk::Tile::TButton.new f_label
        b.text 'Hello, world! : Label'
      end
    end

    def b_button_parts
      @b_button_parts_private ||= begin
        b = ::Tk::Tile::TButton.new f_parts
        b.text 'Hello, world! : Parts'
      end
    end

    def b_menu_about
      @b_menu_about_private ||= begin
#  See:
# http://tkdocs.com/tutorial/windows.html
        lambda_about = ::Kernel.lambda do
          v_about_information.value = v_about_information.value.empty? ? AboutInformation.text_raw : ''
        end
        b = ::Tk::Tile::Button.new f_menu_window
        b.text 'About'
        b.command lambda_about
      end
    end

    def b_menu_edit
      @b_menu_edit_private ||= begin
        lambda_edit = ::Kernel.lambda do
        end
        b = ::Tk::Tile::Button.new f_menu_window
        b.text 'Edit'
        b.command lambda_edit
      end
    end

    def b_menu_exit
      @b_menu_exit_private ||= begin
        b = ::Tk::Tile::Button.new f_menu_window
        b.text 'Exit'
        b.command do
          ::Kernel.exit
        end
      end
    end

    def b_for_date
      @b_for_date_private ||= begin
        lambda_for_date = ::Kernel.lambda do
        end
        b = ::Tk::Tile::Button.new f_for_date
        b.text 'Reset'
        b.command lambda_for_date
      end
    end

    def f_about
      @f_about_private ||= ::Tk::Tile::Frame.new f_content
    end

    def f_dates
      @f_dates_private ||= ::Tk::Tile::Frame.new f_content
    end

    def f_for_date
      @f_for_date_private ||= ::Tk::Tile::Frame.new f_content
    end

    def f_label
      @f_label_private ||= ::Tk::Tile::Frame.new f_content
    end

    def f_menu_separator
      @f_menu_separator_private ||= ::Tk::Tile::Frame.new f_content
    end

    def f_menu_window
      @f_menu_window_private ||= ::Tk::Tile::Frame.new f_content
    end

    def f_parts
      @f_parts_private ||= ::Tk::Tile::Frame.new f_content
    end

    def f_prompt_choice
      @f_prompt_choice_private ||= ::Tk::Tile::Frame.new f_content
    end

    def f_shows
      @f_shows_private ||= ::Tk::Tile::Frame.new f_content
    end

    def f_songs
      @f_songs_private ||= ::Tk::Tile::Frame.new f_content
    end

    def l_about_information
      @l_about_information_private ||= begin
        l = ::Tk::Tile::Label.new f_about
        l.textvariable v_about_information
      end
    end

    def l_for_date
      @l_for_date_private ||= begin
        l = ::Tk::Tile::Label.new f_for_date
        l.text 'For Date'
      end
    end

    def l_for_date_weekday
      @l_for_date_weekday_private ||= begin
        l = ::Tk::Tile::Label.new f_for_date
        l.textvariable v_for_date_weekday
      end
    end

    def l_prompt_choice
      @l_prompt_choice_private ||= begin
        l = ::Tk::Tile::Label.new f_prompt_choice
        l.textvariable v_prompt_choice
      end
    end

    def s_menu
      @s_menu_private ||= begin
        s = ::Tk::Tile::Separator.new f_menu_separator
        s.orient :horizontal
      end
    end

    def v_about_information
      @v_about_information_private ||= ::TkVariable.new
    end

    def v_for_date
      @v_for_date_private ||= ::TkVariable.new
    end

    def v_for_date_weekday
      @v_for_date_weekday_private ||= ::TkVariable.new
    end

    def v_prompt_choice
      @v_prompt_choice_private ||= ::TkVariable.new
    end
  end
end
