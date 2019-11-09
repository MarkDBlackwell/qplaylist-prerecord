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
      AboutInformation.show = false
      @body_state = :airshows
# window process:
# Group:
      weights_column_and_row_set_up # Keep first.
      title_set program_name
      body_components_init
# Group end.
      all_pack
      rows_set_up
      ::Tk.mainloop
      nil
    end

    def rows_set_up
      f_about   .grid column: 0, row: 1
      f_for_date.grid column: 0, row: 2
      f_shows   .grid column: 0, row: 3
      f_dates   .grid column: 0, row: 4
      f_parts   .grid column: 0, row: 5
      f_label   .grid column: 0, row: 6
      f_songs   .grid column: 0, row: 7
      nil
    end

    private

    def all_components_pack
# Order is visual order:
      f_menu_window_pack
      body_components_pack
      nil
    end

    def body_active_init
      case @body_state
      when :airdates then body_airdates_init
      when :airshows then body_airshows_init
      when :songs    then body_songs_init
      end
      nil
    end

    def body_active_pack
      case @body_state
      when :airdates then body_airdates_pack
      when :airshows then body_airshows_pack
      when :songs    then body_songs_pack
      end
      nil
    end

    def body_airdates_init
      @airdates = Airdates.all
      @airdates.each{|e| button_body_airdate_init e}
      nil
    end

    def body_airdates_pack
#     @body_airdates.each{|e| e.pack fill: :x}
      nil
    end

    def body_airshows_init
      @airshows = Airshows.all
      @airshows.each{|e| button_body_airshow_init e}
      nil
    end

    def body_airshows_pack
#     @body_airshows.each{|e| e.pack fill: :x}
      nil
    end

    def body_components_init
      f_body_window_init
# Keep alphabetical:
      AboutInformation.init
      body_active_init
      prompt_choice_init
# (End keep alphabetical.)
      nil
    end

    def body_components_pack
      f_body_window_pack
# Order is visual order:
      prompt_choice_pack
      body_active_pack
#     AboutInformation.pack
# (End visual order.)
      nil
    end

    def body_songs_init
      @label_songs = []
      segment_count = 4
      @songs = Songs.all pieces_young_at_heart, segment_count
      @songs.each{|e| label_song_init e}
      nil
    end

    def body_songs_pack
#     @label_songs.each{|e| e.pack fill: :x}
      nil
    end

    def button_body_airdate_init(airdate)
      lambda_button = ::Kernel.lambda do
        f_body_window_destroy
        @body_airdates.clear
        @body_state = :songs
        @title_airdate = airdate.date
        title_set title_airdate_complex
        body_components_init
        body_components_pack
      end
      @body_airdates ||= []
      b = ::Tk::Tile::Button.new f_body_window
      b.text airdate.date
      b.command lambda_button
      @body_airdates.push b
      nil
    end

    def button_body_airshow_init(airshow)
      lambda_button = ::Kernel.lambda do
        f_body_window_destroy
        @body_airshows.clear
        @body_state = :airdates
        @title_airshow = airshow.name
        title_set title_airshow_complex
        body_components_init
        body_components_pack
      end
      @body_airshows ||= []
      b = ::Tk::Tile::Button.new f_body_window
      b.text airshow.name
      b.command lambda_button
      @body_airshows.push b
      nil
    end

    def label_song_init(song)
      time = ::Kernel.sprintf "%d:%02d", *song.start_time
      title = "\"#{song.title}\""
      s = [time, title, song.artist].join ' – '
      l_song = ::Tk::Tile::Label.new f_body_window
      l_song.text s
      @label_songs.push l_song
      nil
    end

    def menu_components_pack
      [ # Order is visual order.
#         b_menu_exit,
          b_menu_edit,
          b_menu_about,
          ].each do |e|
#       e.pack pack_standard_menu
      end
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

    def prompt_choice_init
      case @body_state
      when :airdates, :airshows
        @l_prompt_choice = ::Tk::Tile::Label.new f_body_window
        @l_prompt_choice.text 'Choose!'
      end
      nil
    end

    def prompt_choice_pack
      case @body_state
      when :airdates, :airshows
#       @l_prompt_choice.pack pack_standard
      end
      nil
    end

    def s_components_pack
#     s_components.pack fill: :x, side: :bottom
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
      ::TkGrid.columnconfigure f_content, 0, weight: 1

      ::TkGrid.   rowconfigure f_content, 0, weight: 1
      ::TkGrid.   rowconfigure f_content, 1, weight: 1
      ::TkGrid.   rowconfigure f_content, 2, weight: 1
      ::TkGrid.   rowconfigure f_content, 3, weight: 1
      ::TkGrid.   rowconfigure f_content, 4, weight: 1
      ::TkGrid.   rowconfigure f_content, 5, weight: 1
      ::TkGrid.   rowconfigure f_content, 6, weight: 1
      ::TkGrid.   rowconfigure f_content, 7, weight: 1
      nil
    end
  end
end
