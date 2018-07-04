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
require 'graphical_helper'
require 'pp'
require 'song_list'
require 'tk'

module ::QplayistPrerecord
  module Graphical
    include GraphicalHelper
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
      end
      nil
    end

    def body_active_pack
      case @body_state
      when :airdates then body_airdates_pack
      when :airshows then body_airshows_pack
      end
      nil
    end

    def body_airdates_init
      @airdates = Airdates.all
      @airdates.each{|e| button_airdate_init e}
      nil
    end

    def body_airdates_pack
      @button_airdates.each{|e| e.pack fill: :x}
      nil
    end

    def body_airshows_init
      @airshows = Airshows.all
      @airshows.each{|e| button_airshow_init e}
      nil
    end

    def body_airshows_pack
      @button_airshows.each{|e| e.pack fill: :x}
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
# Order is visual order:
      prompt_choice_pack
      body_active_pack
# (End visual order.)
      body_pack
      nil
    end

    def button_airdate_init(airdate)
      proc_button = proc do
        @body.destroy
        @button_airdates.clear
        @body_state = :songs
        @song_list = SongList.new
        @title_airdate = airdate.date
        s = "#{@title_airdate} - #{title_airshow}"
        title_set s
        body_components_init
        body_components_pack
      end
      @button_airdates ||= []
      button_airdate = ::TkButton.new @body do
        text airdate.date
        command proc_button
      end
      @button_airdates.push button_airdate
      nil
    end

    def button_airshow_init(airshow)
      proc_button = proc do
        @body.destroy
        @button_airshows.clear
        @body_state = :airdates
        @title_airshow = airshow.name
        title_set title_airshow
        body_components_init
        body_components_pack
      end
      @button_airshows ||= []
      button_airshow = ::TkButton.new @body do
        text airshow.name
        command proc_button
      end
      @button_airshows.push button_airshow
      nil
    end

    def button_about_init
      proc_greeting_show = proc do
# Run the popup program:
#       array = %w[bundle exec ruby] + [filename_program_about]
        array = %w[ruby] + [filename_program_about]
        ::Kernel.system *array
      end
      @button_about = ::TkButton.new @menu do
        text 'About'
        command proc_greeting_show
      end
      nil
    end

    def filename_program_about
      basename = 'qplaylist_prerecord_about.rb'
      ::File.join directory_lib, basename
    end

    def menu_components_init
# Keep alphabetical:
      button_exit_init @menu, 'Exit'
      button_about_init
# (End keep alphabetical.)
      nil
    end

    def menu_components_pack
      [ # Order is visual order.
          @button_exit,
          @button_about,
          ].each do |e|
        e.pack pack_standard_menu
      end
      nil
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

    def title_airshow
      "#{@title_airshow} - #{program_name}"
    end

    def title_init
      title_set program_name
      nil
    end
  end
end
