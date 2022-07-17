require "libadwaita"

require "./modules/prerequisites.cr"

require "./modules/functions/*"
require "./modules/views/*"

# TODO: Write documentation for `Ellipsis`
module Ellipsis
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
