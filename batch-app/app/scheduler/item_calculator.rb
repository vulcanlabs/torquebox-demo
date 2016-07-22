class ItemCalculator
  def initialize
    @torquebox_queue ||= TorqueBox::Messaging::Queue.new \
      "/queues/#{Rails.env}/items"
  end

  def run
    @torquebox_queue.publish Item.new description: 'from scheduler', stamp: DateTime.now
  end

  def on_error(exception)
    Rails.logger.error exception.message
    Rails.logger.error exception.backtrace.join("\n")
  end
end
