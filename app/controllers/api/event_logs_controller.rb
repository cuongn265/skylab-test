class Api::EventLogsController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }

  def create
    EventLogJob.perform_later(event_log_params)
    head :ok
  end

  private

  def event_log_params
    params.require(:event_log).permit(:event_name, :timestamp)
  end
end
