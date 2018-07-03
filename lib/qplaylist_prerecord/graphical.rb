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
      song_list = SongList.new
      window_process
      nil
    end

    private

    def airshows_body_init
      @airshows = Airshows.all
#print '@airshows='; pp @airshows
      @airshows.each{|e| button_airshow_init e}
      nil
    end

    def airshows_body_pack
      @button_airshows.each{|e| e.pack fill: :x}
      nil
    end

    def all_components_init
      body_init
# Keep alphabetical:
      body_components_init
      menu_init
      separator_init
# (End keep alphabetical.)
      nil
    end

    def all_components_pack
# Keep order:
      menu_pack
      separator_pack
      body_components_pack
      body_pack
# (End keep order.)
      nil
    end

    def body_components_init
# Keep alphabetical:
      airshows_body_init
      prompt_choice_init
# (End keep alphabetical.)
      nil
    end

    def body_components_pack
# Keep order:
      prompt_choice_pack
      airshows_body_pack
# (End keep order.)
      nil
    end

    def button_airshow_init(airshow)
      proc_button = proc do
#print 'airshow='; pp airshow
        @body.destroy
        @button_airshows.clear
      end
      button_airshow = ::TkButton.new @body do
        text airshow.name
        command proc_button
      end
      @button_airshows ||= []
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

    def button_navigate_init
      proc_title = proc do
        @topic_title = 'something' unless defined? @topic_title
        s = "#{@topic_title} - #{@program_name}"
        title_set s
        @topic_title = @topic_title.chars.shuffle.join ''
      end
      @button_navigate = ::TkButton.new @menu do
        text 'Navigate'
        command proc_title
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
      button_navigate_init
      separator_components_init
# (End keep alphabetical.)
      nil
    end

    def menu_components_pack
      [
# Keep order:
          @button_exit,
          @button_navigate,
          @button_about,
# (End keep order.)
          ].each do |e|
        e.pack pack_standard_menu
      end
      separator_components_pack
      nil
    end

    def prompt_choice_init
      @prompt_choice = ::TkLabel.new @body do
        text 'Choose!'
      end
      nil
    end

    def prompt_choice_pack
      @prompt_choice.pack pack_standard
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

    def title_init
      @program_name = 'QPlaylistPrerecord'
      title_set @program_name
      nil
    end
  end
end
