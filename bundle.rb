require 'ruble'

bundle do |bundle|
  bundle.display_name = 'smoke-testing'
  bundle.author = 'Christopher Williams'
  bundle.copyright = <<END
(c) Copyright 2011 appcelerator.com Distributed under MIT license.
END

  bundle.description = "Commands to help smoke test the IDE"

  # uncomment with the url to the git repo if one exists
  # bundle.repository = 'git@github.com:aptana/smoke-testing.ruble..git'

  bundle.menu 'smoke-testing' do |menu|
    menu.command 'Validate Menu Entries'
    menu.command 'This doesnt exist'
  end
end