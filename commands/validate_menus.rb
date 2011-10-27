require 'ruble'

def is_invalid?(menu)
  return false unless menu.isLeafMenu
  return menu.getCommand.nil?
end

def report_invalid_menus(menus, failures)
  menus.each do |menu|
    if is_invalid?(menu)
      bundle_path = menu.getOwningBundle.getPath
      menus_without_commands = failures[bundle_path]
      menus_without_commands = [] unless menus_without_commands
      # FIXME Print out the path to the menu too (i.e. print out 'Root > Parent > command name')
      menus_without_commands << menu.getCommandName
      failures[bundle_path] = menus_without_commands
    end
    sub_menus = menu.getChildren
    report_invalid_menus(sub_menus, failures)
  end
end

command "Validate Menu Entries" do |cmd|
  cmd.input = :none
  cmd.output = :create_new_document
  cmd.invoke do |context|
    failures = {}
    # Grab every menu element
    bm = com.aptana.scripting.model.BundleManager.getInstance
    menus = bm.getMenus {|element| true } # a filter that returns all menus
    report_invalid_menus(menus, failures)
    
    # Spit out failures
    if failures.size > 0
      puts "The following menu entries failed validation."
      failures.each do |bundle_path, fails|
        puts "Bundle: #{bundle_path}"
        puts "  #{fails.join("\n  ")}\n\n"
      end
    else
      puts "No menu entries failed validation"
    end
    nil
  end
end

