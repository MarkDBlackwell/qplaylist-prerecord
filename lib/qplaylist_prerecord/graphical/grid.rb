# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'graphical_objects'

module ::QplayistPrerecord
  module Grid
    include GraphicalObjects

    private

    def grid_init
      grid_init_menu_window 0
      grid_init_menu_separator 1
      grid_init_about 2
      grid_init_for_date 3
      grid_init_prompt_choice 4
      grid_init_shows 5
      grid_init_dates 6
      grid_init_parts 7
      grid_init_label 8
      grid_init_songs 9
      nil
    end

    def grid_init_about(row)
      f_about.grid column: 0, row: row
      l_about_information.grid column: 0, row: 0
      nil
    end

    def grid_init_dates(row)
      f_dates.grid column: 0, row: row
      @airdates.each{|e| e.grid}
      nil
    end

    def grid_init_for_date(row)
      f_for_date.grid column: 0, row: row
b_button_for_date.grid
      nil
    end

    def grid_init_label(row)
      f_label.grid column: 0, row: row
b_button_label.grid
      nil
    end

    def grid_init_menu_separator(row)
      f_menu_separator.grid column: 0, row: row, sticky: :we
# ".grid sticky: :we" doesn't fill:
      s_menu.pack fill: :x
      nil
    end

    def grid_init_menu_window(row)
      f_menu_window.grid column: 0, row: row
      b_menu_exit  .grid column: 0, row: 0
      b_menu_edit  .grid column: 1, row: 0
      b_menu_about .grid column: 2, row: 0
      nil
    end

    def grid_init_parts(row)
      f_parts.grid column: 0, row: row
b_button_parts.grid
      nil
    end

    def grid_init_prompt_choice(row)
      f_prompt_choice.grid column: 0, row: row
      l_prompt_choice.grid
      nil
    end

    def grid_init_shows(row)
      f_shows.grid column: 0, row: row
      @airshows.each{|e| e.grid}
      nil
    end

    def grid_init_songs(row)
      f_songs.grid column: 0, row: row
      @songs.each{|e| e.grid}
      nil
    end
  end
end
