class HomeController < ApplicationController

  def leaderboard
    @current_user_id = current_user || 0
    @lb_results = Result.group(:user_id).limit(20).sum(:score)
    @lb_results = Hash[@lb_results.sort_by{|key, val| val}.reverse]
  end
end
