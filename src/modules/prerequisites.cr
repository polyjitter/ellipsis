require "libadwaita"
require "gettext"
require "log"

require "./views/*"
require "./functions/*"

module Ellipsis
  extend self

  VERSION = {{read_file("./shard.yml").split("version: ")[1].split("\n")[0]}}
  LOGGER  = Log.for("Collision", ARGV[0]? == "--debug" ? Log::Severity::Debug : Log::Severity::Warn)

  begin
    Gettext.setlocale(Gettext::LC::ALL, "")
    Gettext.bindtextdomain(
      "com.github.polyjitter.Ellipsis",
      {{env("ELLIPSIS_LOCALE_LOCATION").nil? ? "/usr/share/locale" : env("ELLIPSIS_LOCALE_LOCATION")}}
    )
    Gettext.textdomain("com.github.polyjitter.Ellipsis")
  rescue ex
    LOGGER.debug { ex }
  end

  Gio.register_resource("data/com.github.polyjitter.Ellipsis.gresource.xml", "data")

  WINDOW       = Gtk::Builder.new_from_resource("/com/github/polyjitter/Ellipsis/ui/compiled/window.ui")
  WELCOME      = Gtk::Builder.new_from_resource("/com/github/polyjitter/Ellipsis/ui/compiled/welcome.ui")
  MAIN         = Gtk::Builder.new_from_resource("/com/github/polyjitter/Ellipsis/ui/compiled/welcome.ui")
  FILES_VIEW   = Gtk::Builder.new_from_resource("/com/github/polyjitter/Ellipsis/ui/compiled/files.ui")
  CHANGES_VIEW = Gtk::Builder.new_from_resource("/com/github/polyjitter/Ellipsis/ui/compiled/changes.ui")

  SPINNER = Gtk::Spinner.new(
    spinning: true,
    halign: Gtk::Align::Center,
    width_request: 36,
    height_request: 36,
    visible: false
  )

  APP = Adw::Application.new("com.github.polyjitter.Ellipsis", Gio::ApplicationFlags::None)
end