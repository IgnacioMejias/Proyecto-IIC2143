# frozen_string_literal: true

require 'spec_helper'

module AuthHelper
  def login_user
    user = user.find(4)
    user.save!
    puts user.id, 'AAAAAAAAAA'
    sign_in user
  end
end
