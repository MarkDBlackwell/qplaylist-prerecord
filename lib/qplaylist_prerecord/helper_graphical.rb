# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 3, 2018 - created
=end

module ::QplayistPrerecord
  module GraphicalHelper
    extend self

    private

    def all_init
      window_init # Keep first.
      title_set program_name
      all_components_init
      nil
    end

    def all_pack
      window_pack
      all_components_pack
      nil
    end

    def body_init
      @body = ::TkFrame.new @top
      nil
    end

    def body_pack
      @body.pack fill: :both, side: :top
      nil
    end

    def button_menu_exit_init(container, s)
      @button_menu_exit = ::TkButton.new container do
        text s
        command do
          proc ::Kernel.exit
        end
      end
      nil
    end

    def button_menu_exit_pack
      @button_menu_exit.pack pack_standard
      nil
    end

    def directory_lib
      ::File.join project_root, 'lib'
    end

    def dirname_script_this
      ::Kernel.__dir__
    end

    def menu_init
      @menu = ::TkFrame.new @top
      menu_components_init
      separator_components_init
      separator_init
      nil
    end

    def menu_pack
      menu_components_pack
      separator_components_pack
      @menu.pack fill: :both, side: :top
      separator_pack
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

    def separator_init
      @separator = ::TkFrame.new @top
      separator_components_init
      nil
    end

    def separator_pack
      separator_components_pack
      @separator.pack fill: :both, side: :top
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

    def window_process
      all_init
      all_pack
      window_run
      nil
    end

    def window_run
      ::Tk.mainloop
      nil
    end
  end
end
