# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'
# require 'pathname'
# 
# ROOT = Pathname(__dir__).parent.parent.to_path

# Give it a name
extension_name = 'fletcherchecksum'

# The destination
dir_config(extension_name)

# Do the work
create_makefile(extension_name)