class EventLogJob < ApplicationJob
  queue_as :default

  def perform(*args)
    EventLog.create!(args)
  end
end
