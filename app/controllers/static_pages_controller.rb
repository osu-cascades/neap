class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def application_main_info; end
  def home; end
  def before_you_begin; end
end
