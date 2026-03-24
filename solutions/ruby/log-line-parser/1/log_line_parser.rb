class LogLineParser
  def initialize(line)
    @level, @message  = normalizes(line)
  end

  def message
    @message
  end

  def log_level
    @level.gsub(/[\r\n\t]/, ' ').delete("[]").downcase
  end

  def reformat
    @message&.gsub(/[\r\n\t]/, '')&.strip + " (#{@level.delete("[]").downcase})"
  end

  private

  def normalizes(text)
    text&.chomp&.split(":")&.map(&:strip)&.reject(&:empty?)
  end
end
