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
      @body_state = :airshows
      @body_airdates = []
      @body_airshows = []
# window process:
# Group:
      weights_column_and_row_set_up # Keep first.
      title_set program_name
      components_init
# Group end.
#     components_show
      grid_init
      ::Tk.mainloop
      nil
    end

    private

    def airdates_fill
      @airdates = Airdates.all
      @airdates.each{|e| button_body_airdate_init e}
      nil
    end

    def airdates_show
#     @body_airdates.each{|e| e.pack fill: :x}
      nil
    end

    def airshows_fill
      @airshows = Airshows.all
      @airshows.each{|e| button_body_airshow_init e}
      nil
    end

    def airshows_show
#     @body_airshows.each{|e| e.pack fill: :x}
      nil
    end

    def b_button_dates
      @b_button_dates_private ||= begin
        b = ::Tk::Tile::TButton.new f_dates
        b.text 'Hello, world! : Dates'
      end
    end

    def b_button_for_date
      @b_button_for_date_private ||= begin
        b = ::Tk::Tile::TButton.new f_for_date
        b.text 'Hello, world! : For date'
      end
    end

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

    def b_button_shows
      @b_button_shows_private ||= begin
        b = ::Tk::Tile::TButton.new f_shows
        b.text 'Hello, world! : Shows'
      end
    end

    def b_button_songs
      @b_button_songs_private ||= begin
        b = ::Tk::Tile::TButton.new f_songs
        b.text 'Hello, world! : Songs'
      end
    end

    def body_destroy
      nil
    end

    def button_body_airdate_init(airdate)
      lambda_button = ::Kernel.lambda do
        body_destroy
        @body_airdates.clear
        @body_state = :songs
        @title_airdate = airdate.date
        title_set title_airdate_complex
        components_init
#       components_show
      end
      b = ::Tk::Tile::Button.new f_songs
      b.text airdate.date
      b.command lambda_button
      @body_airdates.push b
      nil
    end

    def button_body_airshow_init(airshow)
      lambda_button = ::Kernel.lambda do
        body_destroy
        @body_airshows.clear
        @body_state = :airdates
        @title_airshow = airshow.name
        title_set title_airshow_complex
        components_init
#       components_show
      end
      b = ::Tk::Tile::Button.new f_songs
      b.text airshow.name
      b.command lambda_button
      @body_airshows.push b
      nil
    end

    def components_init
      case @body_state
      when :airdates then airdates_fill
      when :airshows then airshows_fill
      when :songs    then songs_fill
      end
      case @body_state
      when :airdates, :airshows
        v_prompt_choice.value = 'Choose!'
      end
      nil
    end

    def components_show
      case @body_state
      when :airdates then airdates_show
      when :airshows then airshows_show
      when :songs    then songs_show
      end
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
      nil
    end

    def grid_init_songs(row)
      f_songs.grid column: 0, row: row
b_button_songs.grid
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

    def songs_fill
      @label_songs = []
      segment_count = 4
      @songs = Songs.all pieces_young_at_heart, segment_count
      @songs.each{|e| label_song_init e}
      nil
    end

    def songs_show
#     @label_songs.each{|e| e.pack fill: :x}
      nil
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
