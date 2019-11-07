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
require 'helper'
require 'helper_graphical'
require 'pp'
require 'song'
require 'songs'
require 'version'

module ::QplayistPrerecord
  module Graphical
    include Helper
    include HelperGraphical
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
      @button_body_airdates.each{|e| e.pack fill: :x}
      nil
    end

    def body_airshows_init
      @airshows = Airshows.all
      @airshows.each{|e| button_body_airshow_init e}
      nil
    end

    def body_airshows_pack
      @button_body_airshows.each{|e| e.pack fill: :x}
      nil
    end

    def body_components_init
      body_init
# Keep alphabetical:
      AboutInformation.init
      body_active_init
      prompt_choice_init
# (End keep alphabetical.)
      nil
    end

    def body_components_pack
      body_pack
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
        @body.destroy
        @button_body_airdates.clear
        @body_state = :songs
        @title_airdate = airdate.date
        title_set title_airdate
        body_components_init
        body_components_pack
      end
      @button_body_airdates ||= []
      button_body_airdate = ::Tk::Tile::Button.new @body do
        text airdate.date
        command proc_button
      end
      @button_body_airdates.push button_body_airdate
      nil
    end

    def button_body_airshow_init(airshow)
      proc_button = proc do
        @body.destroy
        @button_body_airshows.clear
        @body_state = :airdates
        @title_airshow = airshow.name
        title_set title_airshow
        body_components_init
        body_components_pack
      end
      @button_body_airshows ||= []
      button_body_airshow = ::Tk::Tile::Button.new @body do
        text airshow.name
        command proc_button
      end
      @button_body_airshows.push button_body_airshow
      nil
    end

    def button_menu_about
      @button_menu_about_private ||= ::Tk::Tile::Button.new menu_window
    end

    def button_menu_about_init
#  See:
# http://tkdocs.com/tutorial/windows.html
      proc_about = proc do
        AboutInformation.show = true
      end
      button_menu_about.text 'About'
      button_menu_about.command proc_about
      nil
    end

    def button_menu_copy
      @button_menu_copy_private ||= ::Tk::Tile::Button.new menu_window
    end

    def button_menu_copy_init
      proc_copy = proc do
      end
      button_menu_copy.text 'Copy'
      button_menu_copy.command proc_copy
      nil
    end

    def button_menu_edit
      @button_menu_edit_private ||= ::Tk::Tile::Button.new menu_window
    end

    def button_menu_edit_init
      proc_edit = proc do
      end
      button_menu_edit.text 'Edit'
      button_menu_edit.command proc_edit
      nil
    end

    def button_menu_install
      @button_menu_install_private ||= ::Tk::Tile::Button.new menu_window
    end

    def button_menu_install_init
      proc_install = proc do
      end
      button_menu_install.text 'Install'
      button_menu_install.command proc_install
      nil
    end

    def button_menu_new
      @button_menu_new_private ||= ::Tk::Tile::Button.new menu_window
    end

    def button_menu_new_init
      proc_new = proc do
      end
      button_menu_new.text 'New'
      button_menu_new.command proc_new
      nil
    end

    def label_song_init(song)
      time = ::Kernel.sprintf "%d:%02d", *song.start_time
      title = "\"#{song.title}\""
      s = [time, title, song.artist].join ' – '
      label_song = ::Tk::Tile::Label.new @body do
        text s
      end
      @label_songs.push label_song
      nil
    end

    def menu_components_init
# Keep alphabetical:
      button_menu_about_init
      button_menu_copy_init
      button_menu_edit_init
      button_menu_exit_init 'Exit'
      button_menu_install_init
      button_menu_new_init
# (End keep alphabetical.)
      nil
    end

    def menu_components_pack
      [ # Order is visual order.
          button_menu_exit,
          button_menu_new,
          button_menu_copy,
          button_menu_edit,
          button_menu_install,
          button_menu_about,
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
        @prompt_choice = ::Tk::Tile::Label.new @body do
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
      @separator_components_private ||= ::Tk::Tile::Separator.new @separator
    end

    def separator_components_init
      separator_components.orient :horizontal
      nil
    end

    def separator_components_pack
      separator_components.pack fill: :x, side: :bottom
      nil
    end

    def title_airdate
      "#{@title_airdate} - #{title_airshow}"
    end

    def title_airshow
      "#{@title_airshow} - #{program_name}"
    end
  end
end
