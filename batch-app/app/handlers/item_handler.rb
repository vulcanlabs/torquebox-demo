class ItemHandler < TorqueBox::Messaging::MessageProcessor
  def on_message(run_attempt)
  end

  def on_error(error)
    Rails.logger.warn error
  end
end
