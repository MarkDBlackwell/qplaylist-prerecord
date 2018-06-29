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
#     menu_init @menu
      menu_init @top
#     prompt_choice @menu, pack_standard
      prompt_choice @top, pack_standard

      window_pack
      window_run
      nil
    end

    private

    def button_exit_init(menu, pack_standard)
      ::TkButton.new menu do
        text 'Exit'
        command do
          proc ::Kernel.exit
        end
        pack pack_standard
      end
      nil
    end

    def button_greeting_init(menu, pack_standard)
      proc_greeting_show = proc do
      end
      ::TkButton.new menu do
        text 'Show Greeting'
        command proc_greeting_show
        pack pack_standard
      end
      nil
    end

    def button_navigate_init(menu, pack_standard)
      proc_title = proc do
        @topic_title = 'something' unless defined? @topic_title
        s = "#{@topic_title} - #{@program_name}"
        title_set s
        @topic_title = @topic_title.chars.shuffle.join ''
      end
      ::TkButton.new menu do
        text 'Navigate'
        command proc_title
        pack pack_standard
      end
    end

    def button_remove_init(menu, pack_standard)
      proc_remove = proc do
        @button_navigate.destroy
      end
      ::TkButton.new menu do
        text 'Destroy'
        command proc_remove
        pack pack_standard
      end
      nil
    end

    def menu_init(menu)
      ::TkMenu.new @root do
      end

      @button_navigate = button_navigate_init menu, pack_standard

      button_remove_init    menu, pack_standard
      button_greeting_init  menu, pack_standard
      button_exit_init      menu, pack_standard
    end

    def pack_standard
      {padx: 10, pady: 10}
    end

    def prompt_choice(body, pack_standard)
      ::TkLabel.new body do
        text 'Choose!'
        pack pack_standard
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

    def window_pack
      @menu.pack fill: :both, side: :top
      @top. pack fill: :both, side: :top
      nil
    end

    def window_run
      ::Tk.mainloop
      nil
    end
  end
end
