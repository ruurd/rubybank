#============================================================================
# Keepalive controller
#
class KeepaliveController < ApplicationController

  def keepalive
    render text: 'OK'
  end
end
