class TestController < ApplicationController
  def connect
  	@time = Time.now
  	@files = Dir.glob('*')
  end

  def disconnect
  end
end
