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
require 'graphical_helper'
require 'song_list'
require 'tk'

module ::QplayistPrerecord
  module Graphical
    extend self

    def main
      song_list = SongList.new
      airshow = Airshow.new

      everything
      nil
    end

    private

    def body_components_init
# Keep alphabetical:
      prompt_choice_init
      separator_body_init
# (End keep alphabetical.)
      nil
    end

    def body_components_pack
# Keep order:
      separator_body_pack
      prompt_choice_pack
# (End keep order.)
      nil
    end

    def body_init
      @body = ::TkFrame.new @top
      body_components_init
      nil
    end

    def body_pack
      body_components_pack
      @body.pack fill: :both, side: :top
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

    def button_exit_init
      @button_exit = ::TkButton.new @menu do
        text 'Exit'
        command do
          proc ::Kernel.exit
        end
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
      end
      @button_remove = ::TkButton.new @menu do
        text 'Remove'
        command proc_remove
      end
      nil
    end

    def directory_lib
      ::File.join project_root, 'lib'
    end

    def dirname_script_this
      ::Kernel.__dir__
    end

    def everything
      everything_init
      everything_pack
      window_run
      nil
    end

    def everything_components_init
# Keep alphabetical:
      body_init
      menu_init
# (End keep alphabetical.)
      nil
    end

    def everything_components_pack
# Keep order:
      menu_pack
      body_pack
# (End keep order.)
      nil
    end

    def everything_init
      window_init # Keep first.
      title_init
      everything_components_init
      nil
    end

    def everything_pack
      window_pack
      everything_components_pack
      nil
    end

    def filename_program_about
      basename = 'qplaylist_prerecord_about.rb'
      ::File.join directory_lib, basename
    end

    def menu_components_init
# Keep alphabetical:
      button_add_init
      button_exit_init
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

    def menu_init
      @menu = ::TkFrame.new @top
      menu_components_init
      nil
    end

    def menu_pack
      menu_components_pack
      @menu.pack fill: :both, side: :top
      nil
    end

    def pack_standard
      @pack_standard_value ||= {padx: 1, pady: 1}
    end

    def pack_standard_menu
      @pack_standard_menu_value ||= pack_standard.merge side: :left, fill: :x
    end

    def project_root
       @project_root_value ||= ::File.realpath ::File.join(*%w[..]*2), dirname_script_this
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

    def title_set(title_new)
      @root.title = title_new
      nil
    end

    def window_init
      @root = ::TkRoot.new
      @top = ::TkFrame.new @root
      nil
    end

    def window_pack
      @top.pack fill: :x, side: :top
      nil
    end

    def window_run
      ::Tk.mainloop
      nil
    end
  end
end
