# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

=begin
See:
  http://tkdocs.com/tutorial/

Obsolete:
  http://phrogz.net/programmingruby/ext_tk.html
  http://rubylearning.com/satishtalim/ruby_tk_tutorial.html
  http://web.archive.org/web/20091028182545/http://www.jbrowse.com/text/rubytk_en.html
  http://www.tutorialspoint.com/ruby/ruby_tk_guide.htm

Gone?
  http://members.chello.nl/k.vangelder/ruby/learntk/

See also:
  http://stackoverflow.com/questions/12364981/how-to-delete-tkinter-widgets-from-a-window
=end

require 'about_information'
require 'airdate'
require 'airdates'
require 'airshow'
require 'airshows'
require 'graphical_helper'
require 'graphical_objects'
require 'pp'
require 'song'
require 'songs'
require 'version'

module ::QplayistPrerecord
  module Graphical
    include GraphicalHelper
    include GraphicalObjects
    extend self

    def main
      f_content.padding '3 3 3 3'
      @body_airdates = []
      @body_airshows = []
# window process:
# Group:
      weights_column_and_row_set_up # Keep first.
      title_set program_name
# Group end.
      %i[airshows airdates songs].each do |e|
        @body_state = e
        components_init
      end

      grid_init

#     components_show
      ::Tk.mainloop
      nil
    end

    private

    def button_body_airdate_init(airdate)
      lambda_button = ::Kernel.lambda do
#       @body_airdates.clear
#       @body_state = :songs
        @title_airdate = airdate.date
        title_set title_airdate_complex
        components_init
#       components_show
      end
      b = ::Tk::Tile::Button.new f_dates
      b.text airdate.date
      b.command lambda_button
      @body_airdates.push b
      nil
    end

    def button_body_airshow_init(airshow)
      lambda_button = ::Kernel.lambda do
#       @body_airshows.clear
#       @body_state = :airdates
        @title_airshow = airshow.name
        title_set title_airshow_complex
        components_init
#       components_show
      end
      b = ::Tk::Tile::Button.new f_shows
      b.text airshow.name
      b.command lambda_button
      @body_airshows.push b
      nil
    end

    def components_init
      case @body_state
      when :airdates
        @airdates = Airdates.all
        @airdates.each{|e| button_body_airdate_init e}
      when :airshows
        @airshows = Airshows.all
        @airshows.each{|e| button_body_airshow_init e}
      when :songs
        @label_songs = []
        segment_count = 4
        @songs = Songs.all pieces_young_at_heart, segment_count
        @songs.each{|e| label_song_init e}
      end
      case @body_state
      when :airdates, :airshows
        v_prompt_choice.value = 'Choose!'
      end
      nil
    end

    def components_show
#     @body_airdates.each{|e| e.pack fill: :x}
#     @body_airshows.each{|e| e.pack fill: :x}
#     @label_songs.each{|e| e.pack fill: :x}
      nil
    end

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
#print 'v_about_information.value='; p v_about_information.value
      nil
    end

    def grid_init_dates(row)
      f_dates.grid column: 0, row: row
b_button_dates.grid
      @body_airdates.each{|e| e.grid}
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
b_button_shows.grid
      @body_airshows.each{|e| e.grid}
      nil
    end

    def grid_init_songs(row)
      f_songs.grid column: 0, row: row
b_button_songs.grid
      @label_songs.each{|e| e.grid}
      nil
    end

    def label_song_init(song)
      time = ::Kernel.sprintf "%d:%02d", *song.start_time
      title = "\"#{song.title}\""
      s = [time, title, song.artist].join ' – '
      l_song = ::Tk::Tile::Label.new f_songs
      l_song.text s
      @label_songs.push l_song
      nil
    end

    def pieces_young_at_heart
      date_airshow = '2018-07-07'
      name_airshow = 'young-at-heart-sat'
      [name_airshow, date_airshow]
    end

    def program_name
      'QPlaylistPrerecord'
    end

    def title_airdate_complex
      "#{@title_airdate} - #{title_airshow_complex}"
    end

    def title_airshow_complex
      "#{@title_airshow} - #{program_name}"
    end

    def weights_column_and_row_set_up
      weights_column_and_row_default_set_up root
      first = 0
      ::TkGrid.columnconfigure f_content, first, weight: 1
      number_of_rows = 10
      number_of_rows.times.map {|i| ::TkGrid.rowconfigure f_content, i, weight: 1}
      nil
    end
  end
end
