require 'ruble'

bundle do |bundle|
  bundle.display_name = 'Studio Smoke Testing'
  bundle.author = 'Christopher Williams'
  bundle.copyright = '(c) Copyright 2011 appcelerator.com Distributed under MIT license.'
  bundle.description = "Commands to help smoke test the IDE"
  bundle.repository = 'git@github.com:aptana/smoke-testing.ruble.git'

  bundle.menu 'Studio Smoke Testing' do |menu|
    menu.command 'Validate Menu Entries'
  end
end