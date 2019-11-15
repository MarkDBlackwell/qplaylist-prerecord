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

require 'airdate'
require 'airdates'
require 'airshow'
require 'airshows'
require 'graphical_helper'
require 'grid'
require 'helper'
require 'pp'
require 'song'
require 'songs'
require 'version'

module ::QplayistPrerecord
  module Graphical
    include GraphicalHelper
    include Grid
    include Helper
    extend self

    def main
      f_content.padding '3 3 3 3'
# window process:
# Group:
      weights_column_and_row_set_up # Keep first.
      title_set program_name
# Group end.
      %i[airshows airdates songs].each do |e|
        @state = e
        components_init
      end
      grid_init
      ::Tk.mainloop
      nil
    end

    private

    def button_airdate(airdate)
      lambda_button = ::Kernel.lambda do
#       @state = :songs
        @title_airdate = airdate.date
        title_set title_airdate_complex
#       components_init
      end
      b = ::Tk::Tile::Button.new f_dates
      b.text airdate.date
      b.command lambda_button
    end

    def button_airshow(airshow)
      lambda_button = ::Kernel.lambda do
#       @state = :airdates
        @title_airshow = airshow.name
        title_set title_airshow_complex
#       components_init
      end
      b = ::Tk::Tile::Button.new f_shows
      b.text airshow.name
      b.command lambda_button
    end

    def components_init
      case @state
      when :airdates
        @airdates = Airdates.all.map{|e| button_airdate e}
      when :airshows
        @airshows = Airshows.all.map{|e| button_airshow e}
        for_date_chooser_init
      when :songs
        segment_count = 4
        songs = Songs.all pieces_young_at_heart, segment_count
        @songs = songs.map{|e| label_song_init e}
      end
      case @state
      when :airdates, :airshows
        v_prompt_choice.value = 'Which is your show?'
      end
      nil
    end

    def for_date_chooser_init
      weekday = 'tue'
      dates = dates_from_today weekday
      v_for_date.value = dates.first
      v_for_date_weekday.value = weekday.capitalize
      co_for_date = begin
# State & values can't be assigned later:
        co = ::Ttk::Combobox.new f_for_date, state: :readonly, values: dates
        co.textvariable v_for_date
        co.grid column: 1, row: 0
      end
    end

    def label_song_init(song)
      time = ::Kernel.sprintf "%d:%02d", *song.start_time
      title = "\"#{song.title}\""
      s = [time, title, song.artist].join ' – '
      l_song = ::Tk::Tile::Label.new f_songs
      l_song.text s
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
