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
      @airshows = Airshows.all
#print '@airshows='; pp @airshows
      window_process
      nil
    end

    private

    def button_airshow_init(airshow)
      proc_button = proc do
#print 'airshow='; pp airshow
      end
      button_airshow = ::TkButton.new @body do
        text airshow
        command proc_button
      end
      @button_airshows ||= []
      @button_airshows.push button_airshow
      nil
    end

    def airshows_body_init
      @airshows.each do |airshow|
        button_airshow_init airshow
      end
      nil
    end

    def airshows_body_pack
      @button_airshows.each{|e| e.pack fill: :x}
      nil
    end

    def all_components_init
# Keep alphabetical:
      body_init
      menu_init
# (End keep alphabetical.)
      nil
    end

    def all_components_pack
# Keep order:
      menu_pack
      body_pack
# (End keep order.)
      nil
    end

    def body_components_init
# Keep alphabetical:
      airshows_body_init
      prompt_choice_init
      separator_body_init
# (End keep alphabetical.)
      nil
    end

    def body_components_pack
# Keep order:
      separator_body_pack
      prompt_choice_pack
      airshows_body_pack
# (End keep order.)
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

    def button_add_init
      proc_add = proc do
        body_init
        body_pack
      end
      @button_add = ::TkButton.new @menu do
        text 'Add'
        command proc_add
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

    def button_remove_init
      proc_remove = proc do
        @body.destroy
        @button_airshows.clear
      end
      @button_remove = ::TkButton.new @menu do
        text 'Remove'
        command proc_remove
      end
      nil
    end

    def filename_program_about
      basename = 'qplaylist_prerecord_about.rb'
      ::File.join directory_lib, basename
    end

    def menu_components_init
# Keep alphabetical:
      button_add_init
      button_exit_init @menu, 'Exit'
      button_about_init
      button_navigate_init
      button_remove_init
# (End keep alphabetical.)
      nil
    end

    def menu_components_pack
      [
# Keep order:
          @button_exit,
          @button_navigate,
          @button_add,
          @button_remove,
          @button_about,
# (End keep order.)
          ].each do |e|
        e.pack pack_standard_menu
      end
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

    def separator_body_init
      @separator_body = ::Tk::Tile::Separator.new @body do
        orient :horizontal
      end
      nil
    end

    def separator_body_pack
      @separator_body.pack fill: :x
      nil
    end

    def title_init
      @program_name = 'QPlaylistPrerecord'
      title_set @program_name
      nil
    end
  end
end
