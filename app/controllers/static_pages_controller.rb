class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end

  def before_you_begin; end
end
