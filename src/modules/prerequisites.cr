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
end
