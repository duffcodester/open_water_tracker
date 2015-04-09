class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
  before_filter :authenticate_user!, except: [:new, :instructions, :tos, :privacy, :faq]

  def after_sign_in_path_for(user)
    return '/check_in'
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def call_rake(task, options = {})
    options[:rails_env] = Rails.env
    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
    system "rake db:#{task} #{args.join(' ')} --trace &"
  end
end
