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
      @separator = ::Tk::Tile::Separator.new @body do
        orient :horizontal
        pack fill: :x
      end
      prompt_choice pack_standard
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
        @button_navigate.destroy
      end
      @button_remove = ::TkButton.new @menu do
        text 'Remove'
        command proc_remove
      end
      nil
    end

    def everything_pack
      @button_navigate.pack pack_standard_menu.merge fill: :x
      @button_remove.  pack pack_standard_menu.merge fill: :x
      @button_greeting.pack pack_standard_menu.merge fill: :x
      @button_exit.    pack pack_standard_menu.merge fill: :x

      @menu.pack fill: :both, side: :top
      @body.pack fill: :both, side: :top
      @top. pack fill: :x, side: :top
      nil
    end

    def menu_init
##    ::TkMenu.new @root do
##      pack fill: :x
##    end

      button_navigate_init
      button_remove_init
      button_greeting_init
      button_exit_init

##    @menu.pack pack_standard
      nil
    end

    def pack_standard
      {padx: 1, pady: 1}
    end

    def pack_standard_menu
##    pack_standard.merge fill: :none
      pack_standard.merge side: :left
    end

    def prompt_choice(pack_hash)
      ::TkLabel.new @body do
        text 'Choose!'
        pack pack_hash
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
      @menu = ::TkFrame.new @top
      @body = ::TkFrame.new @top
      nil
    end

    def window_run
      ::Tk.mainloop
      nil
    end
  end
end
