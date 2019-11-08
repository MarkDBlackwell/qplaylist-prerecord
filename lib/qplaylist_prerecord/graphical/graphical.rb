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
require 'helper'
require 'pp'
require 'song'
require 'songs'
require 'version'

module ::QplayistPrerecord
  module Graphical
    include GraphicalHelper
    include Helper
    extend self

    def main
      AboutInformation.show = false
      @body_state = :airshows
      window_process
      nil
    end

    private

    def all_components_init
      body_components_init
# Keep alphabetical:
      f_menu_window_init
# (End keep alphabetical.)
      nil
    end

    def all_components_pack
# Order is visual order:
      f_menu_window_pack
      body_components_pack
      nil
    end

    def b_menu_about
      @b_menu_about_private ||= ::Tk::Tile::Button.new f_menu_window
    end

    def b_menu_about_init
#  See:
# http://tkdocs.com/tutorial/windows.html
      lambda_about = ::Kernel.lambda do
        AboutInformation.show = true
      end
      b_menu_about.text 'About'
      b_menu_about.command lambda_about
      nil
    end

    def b_menu_copy
      @b_menu_copy_private ||= ::Tk::Tile::Button.new f_menu_window
    end

    def b_menu_copy_init
      lambda_copy = ::Kernel.lambda do
      end
      b_menu_copy.text 'Copy'
      b_menu_copy.command lambda_copy
      nil
    end

    def b_menu_edit
      @b_menu_edit_private ||= ::Tk::Tile::Button.new f_menu_window
    end

    def b_menu_edit_init
      lambda_edit = ::Kernel.lambda do
      end
      b_menu_edit.text 'Edit'
      b_menu_edit.command lambda_edit
      nil
    end

    def b_menu_install
      @b_menu_install_private ||= ::Tk::Tile::Button.new f_menu_window
    end

    def b_menu_install_init
      lambda_install = ::Kernel.lambda do
      end
      b_menu_install.text 'Install'
      b_menu_install.command lambda_install
      nil
    end

    def b_menu_new
      @b_menu_new_private ||= ::Tk::Tile::Button.new f_menu_window
    end

    def b_menu_new_init
      lambda_new = ::Kernel.lambda do
      end
      b_menu_new.text 'New'
      b_menu_new.command lambda_new
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
      @body_airdates.each{|e| e.pack fill: :x}
      nil
    end

    def body_airshows_init
      @airshows = Airshows.all
      @airshows.each{|e| button_body_airshow_init e}
      nil
    end

    def body_airshows_pack
      @body_airshows.each{|e| e.pack fill: :x}
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
      AboutInformation.pack
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
      @label_songs.each{|e| e.pack fill: :x}
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

    def menu_components_init
# Keep alphabetical:
      b_menu_about_init
      b_menu_copy_init
      b_menu_edit_init
      b_menu_exit_init 'Exit'
      b_menu_install_init
      b_menu_new_init
# (End keep alphabetical.)
      nil
    end

    def menu_components_pack
      [ # Order is visual order.
          b_menu_exit,
          b_menu_new,
          b_menu_copy,
          b_menu_edit,
          b_menu_install,
          b_menu_about,
          ].each do |e|
        e.pack pack_standard_menu
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
        @l_prompt_choice.pack pack_standard
      end
      nil
    end

    def s_components
      @s_components_private ||= ::Tk::Tile::Separator.new f_separator
    end

    def s_components_init
      s_components.orient :horizontal
      nil
    end

    def s_components_pack
      s_components.pack fill: :x, side: :bottom
      nil
    end

    def title_airdate_complex
      "#{@title_airdate} - #{title_airshow_complex}"
    end

    def title_airshow_complex
      "#{@title_airshow} - #{program_name}"
    end
  end
end
