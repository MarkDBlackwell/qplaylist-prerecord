# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 26, 2018 - created

See:
https://stackoverflow.com/questions/12364981/how-to-delete-tkinter-widgets-from-a-window
=end

require 'airshow'
require 'song_list'
require 'tk'

module ::QplayistPrerecord
  module Graphical

    extend self

    def main
      song_list = SongList.new
      airshow = Airshow.new

      window_init
      title_init
      menu_init
      body_init

      everything_pack
      window_run
      nil
    end

    private

    def body_init
      @body = ::TkFrame.new @top
      separator_body_init
      prompt_choice_init
      nil
    end

    def body_pack
# Keep order:
      @separator_body. pack fill: :x
      @prompt_choice.  pack pack_standard
# (End keep order.)
      [@body].each do |e|
        e.pack fill: :both, side: :top
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

    def button_greeting_init
      proc_greeting_show = proc do
      end
      @button_greeting = ::TkButton.new @menu do
        text 'Show Greeting'
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

    def everything_pack
      body_pack
      menu_pack
      window_pack
      nil
    end

    def menu_init
##    @menu_fancy = ::TkMenu.new @root do
##      pack fill: :x
##    end
##    @menu_fancy.pack pack_standard

      @menu = ::TkFrame.new @top
      button_exit_init
      button_greeting_init
      button_navigate_init
      button_remove_init
      button_add_init
      nil
    end

    def menu_pack
# Keep order:
      [@button_navigate, @button_remove, @button_add, @button_greeting, @button_exit].each do |e|
        e.pack pack_standard_menu.merge fill: :x
      end
    end

    def pack_standard
      {padx: 1, pady: 1}
    end

    def pack_standard_menu
##    pack_standard.merge fill: :none
      pack_standard.merge side: :left
    end

    def prompt_choice_init
      @prompt_choice = ::TkLabel.new @body do
        text 'Choose!'
      end
      nil
    end

    def separator_body_init
      @separator_body = ::Tk::Tile::Separator.new @body do
        orient :horizontal
      end
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
# Keep order:
      [@menu, @body].each do |e|
        e.pack fill: :both, side: :top
      end
      nil
    end

    def window_run
      ::Tk.mainloop
      nil
    end
  end
end
