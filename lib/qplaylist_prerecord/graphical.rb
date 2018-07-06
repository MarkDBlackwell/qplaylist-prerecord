# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 26, 2018 - created

See:
http://members.chello.nl/k.vangelder/ruby/learntk/
http://phrogz.net/programmingruby/ext_tk.html
http://rubylearning.com/satishtalim/ruby_tk_tutorial.html
http://stackoverflow.com/questions/12364981/how-to-delete-tkinter-widgets-from-a-window
http://tkdocs.com/tutorial/
http://web.archive.org/web/20091028182545/http://www.jbrowse.com/text/rubytk_en.html
http://www.linuxtopia.org/online_books/programming_books/ruby_tutorial/ext_tk.html
http://www.ruby-forum.com/topic/155646
http://www.tutorialspoint.com/ruby/ruby_tk_guide.htm
=end

require 'airdate'
require 'airdates'
require 'airshow'
require 'airshows'
require 'helper'
require 'helper_graphical'
require 'pp'
require 'song'
require 'songs'
require 'tk'

module ::QplayistPrerecord
  module Graphical
    include Helper
    include HelperGraphical
    extend self

    def main
      @body_state = :airshows
      window_process
      nil
    end

    private

    def all_components_init
      body_components_init
      menu_init
      nil
    end

    def all_components_pack
# Order is visual order:
      menu_pack
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

    def body_components_init
      body_init
# Keep alphabetical:
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
# (End visual order.)
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
      button_body_airdate = ::TkButton.new @body do
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
      button_body_airshow = ::TkButton.new @body do
        text airshow.name
        command proc_button
      end
      @button_body_airshows.push button_body_airshow
      nil
    end

    def button_menu_about_init
      proc_about = proc do
# Run the popup program:
#       array = %w[bundle exec ruby] + [filename_program_about]
        array = %w[ruby] + [filename_program_about]
        ::Kernel.system *array
      end
      @button_menu_about = ::TkButton.new @menu do
        text 'About'
        command proc_about
      end
      nil
    end

    def button_menu_copy_init
      proc_copy = proc do
      end
      @button_menu_copy = ::TkButton.new @menu do
        text 'Copy'
        command proc_copy
      end
      nil
    end

    def button_menu_edit_init
      proc_edit = proc do
      end
      @button_menu_edit = ::TkButton.new @menu do
        text 'Edit'
        command proc_edit
      end
      nil
    end

    def button_menu_install_init
      proc_install = proc do
      end
      @button_menu_install = ::TkButton.new @menu do
        text 'Install'
        command proc_install
      end
      nil
    end

    def button_menu_new_init
      proc_new = proc do
      end
      @button_menu_new = ::TkButton.new @menu do
        text 'New'
        command proc_new
      end
      nil
    end

    def filename_program_about
      basename = 'qplaylist_prerecord_about.rb'
      ::File.join directory_lib, basename
    end

    def label_song_init(song)
      time = ::Kernel.sprintf "%d:%02d", *song.start_time
      title = "\"#{song.title}\""
      s = [time, title, song.artist].join ' – '
      label_song = ::TkLabel.new @body do
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
      button_menu_exit_init @menu, 'Exit'
      button_menu_install_init
      button_menu_new_init
# (End keep alphabetical.)
      nil
    end

    def menu_components_pack
      [ # Order is visual order.
          @button_menu_exit,
          @button_menu_new,
          @button_menu_copy,
          @button_menu_edit,
          @button_menu_install,
          @button_menu_about,
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
        @prompt_choice = ::TkLabel.new @body do
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

    def separator_components_init
      @separator_components = ::Tk::Tile::Separator.new @separator do
        orient :horizontal
      end
      nil
    end

    def separator_components_pack
      @separator_components.pack fill: :x, side: :bottom
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
