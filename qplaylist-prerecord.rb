# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 26, 2018 - created

See:
https://stackoverflow.com/questions/12364981/how-to-delete-tkinter-widgets-from-a-window
=end

require 'tk'

module ::QplayistPrerecord
  extend self

  def main
    @program_name = 'QPlaylistPrerecord'
    root = TkRoot.new
    title_set root, @program_name
    top = TkFrame.new root
    prompt_choice top, pack_standard
    button_navigate root, top, pack_standard
    button_exit top, pack_standard
    top.pack fill: :both, side: :top
    Tk.mainloop
    nil
  end

  private

  def button_exit(top, pack_standard)
    TkButton.new top do
      text 'Exit'
      command do
        proc ::Kernel.exit
      end
      pack pack_standard
    end
    nil
  end

  def button_navigate(root, top, pack_standard)
    proc_title = proc do
      @topic_title = 'something' unless defined? @topic_title
      s = "#{@topic_title} - #{@program_name}"
      title_set root, s
      @topic_title = @topic_title.chars.shuffle.join ''
    end
    TkButton.new top do
      text 'Navigate'
      command proc_title
      pack pack_standard
    end
    nil
  end

  def pack_standard
    {padx: 10, pady: 10}
  end

  def prompt_choice(top, pack_standard)
    TkLabel.new top do
      text 'Choose!'
      pack pack_standard
    end
    nil
  end

  def title_set(root, title_new)
    root.title = title_new
    nil
  end
end

::QplayistPrerecord.main
