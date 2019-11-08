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
      menu_window_init
# (End keep alphabetical.)
      nil
    end

    def all_components_pack
# Order is visual order:
      menu_window_pack
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
      body_window_init
# Keep alphabetical:
      AboutInformation.init
      body_active_init
      prompt_choice_init
# (End keep alphabetical.)
      nil
    end

    def body_components_pack
      body_window_pack
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
      proc_button = proc do
        body_window_destroy
        @body_airdates.clear
        @body_state = :songs
        @title_airdate = airdate.date
        title_set title_airdate_complex
        body_components_init
        body_components_pack
      end
      @body_airdates ||= []
      b = ::Tk::Tile::Button.new body_window
      b.text airdate.date
      b.command proc_button
      @body_airdates.push b
      nil
    end

    def button_body_airshow_init(airshow)
      proc_button = proc do
        body_window_destroy
        @body_airshows.clear
        @body_state = :airdates
        @title_airshow = airshow.name
        title_set title_airshow_complex
        body_components_init
        body_components_pack
      end
      @body_airshows ||= []
      b = ::Tk::Tile::Button.new body_window
      b.text airshow.name
      b.command proc_button
      @body_airshows.push b
      nil
    end

    def b_menu_about
      @b_menu_about_private ||= ::Tk::Tile::Button.new menu_window
    end

    def b_menu_about_init
#  See:
# http://tkdocs.com/tutorial/windows.html
      proc_about = proc do
        AboutInformation.show = true
      end
      b_menu_about.text 'About'
      b_menu_about.command proc_about
      nil
    end

    def b_menu_copy
      @b_menu_copy_private ||= ::Tk::Tile::Button.new menu_window
    end

    def b_menu_copy_init
      proc_copy = proc do
      end
      b_menu_copy.text 'Copy'
      b_menu_copy.command proc_copy
      nil
    end

    def b_menu_edit
      @b_menu_edit_private ||= ::Tk::Tile::Button.new menu_window
    end

    def b_menu_edit_init
      proc_edit = proc do
      end
      b_menu_edit.text 'Edit'
      b_menu_edit.command proc_edit
      nil
    end

    def b_menu_install
      @b_menu_install_private ||= ::Tk::Tile::Button.new menu_window
    end

    def b_menu_install_init
      proc_install = proc do
      end
      b_menu_install.text 'Install'
      b_menu_install.command proc_install
      nil
    end

    def b_menu_new
      @b_menu_new_private ||= ::Tk::Tile::Button.new menu_window
    end

    def b_menu_new_init
      proc_new = proc do
      end
      b_menu_new.text 'New'
      b_menu_new.command proc_new
      nil
    end

    def label_song_init(song)
      time = ::Kernel.sprintf "%d:%02d", *song.start_time
      title = "\"#{song.title}\""
      s = [time, title, song.artist].join ' – '
      label_song = ::Tk::Tile::Label.new body_window do
        text s
      end
      @label_songs.push label_song
      nil
    end

    def menu_components_init
# Keep alphabetical:
      b_menu_about_init
      b_menu_copy_init
      b_menu_edit_init
      button_menu_exit_init 'Exit'
      b_menu_install_init
      b_menu_new_init
# (End keep alphabetical.)
      nil
    end

    def menu_components_pack
      [ # Order is visual order.
          button_menu_exit,
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
        @prompt_choice = ::Tk::Tile::Label.new body_window do
          text 'Choose!'
        end
      end
      nil
    end

    def prompt_choice_pack
      case @body_state
      when :airdates, :airshows
        @prompt_choice.pack pack_standard
      end
      nil
    end

    def separator_components
      @separator_components_private ||= ::Tk::Tile::Separator.new separator
    end

    def separator_components_init
      separator_components.orient :horizontal
      nil
    end

    def separator_components_pack
      separator_components.pack fill: :x, side: :bottom
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
