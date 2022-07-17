module Ellipsis
  @@main_window_id = 0_u32

  def startup(app : Adw::Application)
  end

  def activate(app : Adw::Application)
    main_window = APP.window_by_id(@@main_window_id)
    return main_window.present if main_window

    window = Adw::ApplicationWindow.cast(WINDOW["window"])
    window.application = app
    @@main_window_id = window.id

    window.present
  end

  APP.startup_signal.connect(->startup(Adw::Application))
  APP.activate_signal.connect(->activate(Adw::Application))
  exit(APP.run(ARGV))
end
