class StaticsController < ApplicationController
  def top
      @hostname = `hostname`
  end
end
