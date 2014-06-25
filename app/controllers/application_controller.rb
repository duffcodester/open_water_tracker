class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_filter :authenticate_user!, except: [:new, :privacy, :tos, :faq]
  around_filter :user_time_zone, if: :current_user

  private

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
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
