class CustomLogger
  module Severity
    INFO = 0
    WARN = 1
    ERROR = 2
  end

  class << self
    include Severity

    LOG_PATH = 'log/skylab.log'

    def info(message)
      add(LogDevice.new(STDOUT), INFO, message)
    end

    def warn(message)
      add(LogDevice.new(STDOUT), WARN, message)
      add(LogDevice.new(LOG_PATH), WARN, message)
    end

    def error(message)
      add(LogDevice.new(STDOUT), ERROR, message)
      add(LogDevice.new(LOG_PATH), ERROR, message)
      add(LogDevice.new(LoggerMailer), ERROR, message)
    end

    def add(logdev, severity, message = nil)
      logdev.write(format_severity(severity), message)
    end

    private

    SEV_LABEL = %w(INFO WARN ERROR).each(&:freeze).freeze

    def format_severity(severity)
      SEV_LABEL[severity] || 'INFO'
    end
  end

  class LogDevice
    def initialize(log_output)
      set_output(log_output)
    end

    def write(severity, message)
      begin
        formatted_message = "#{Time.now}\t#{severity} --: #{message}\n"

        if @dev.is_a?(Class) && @dev.ancestors.include?(ApplicationMailer)
          @dev.write(formatted_message).deliver_later
        else
          @dev.write(formatted_message)
        end
      rescue
        warn("log writing failed. #{$!}")
      end
    end

    private

    def set_output(log)
      if log.respond_to?(:write) and log.respond_to?(:close)
        @dev = log
      elsif log.is_a?(String)
        @dev = open_logfile(log)
        @dev.sync = true
      else
        @dev = log
      end
    end

    def open_logfile(filename)
      begin
        File.open(filename, (File::WRONLY | File::APPEND))
      rescue Errno::ENOENT
        create_logfile(filename)
      end
    end

    def create_logfile(filename)
      begin
        logdev = File.open(filename, (File::WRONLY | File::APPEND | File::CREAT | File::EXCL))
        logdev.sync = true
      rescue Errno::EEXIST
        logdev = open_logfile(filename)
        logdev.sync = true
      end
      logdev
    end
  end
end
