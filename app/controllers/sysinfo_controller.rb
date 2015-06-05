#============================================================================
# Sysinfo controller show system info to admins
#
class SysinfoController < ApplicationController
  def index
    begin
      if ::File.exist?('./REVISION')
        @git_version = ::File.read('./REVISION').chomp
      end
    ensure
      @git_version ||= 'Unknown (REVISION file is missing)'
    end
  end
end
