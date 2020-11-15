class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def initialize()
    @first_name = ""
    @last_name = ""
    @user_primary_key = -1
  end

  attr_accessor :user_primary_key
end
