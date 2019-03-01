class LoggerMailer < ApplicationMailer
  def write(message)
    @message = message
    mail(to: 'admin@skylab.com')
  end
end
