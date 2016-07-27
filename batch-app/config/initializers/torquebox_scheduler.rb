# set up scheduler for torquebox-4
# http://torquebox.org/documentation/4.0.0.beta3/yardoc/TorqueBox/Scheduling/Scheduler.html#schedule-class_method

TorqueBox::Scheduling::Scheduler.schedule :calculate_items, at: Time.now, every: 3.seconds do
  Rails.logger.info "calculate_items running: generate randomly 1 item every half hour"
  if 0 == rand(600)
    item = Item.new name: 'scheduler', description: DateTime.now
    Rails.logger.info "enque #{item.attributes.inspect}"
    TorqueBox::Messaging::Context.new :host => 'localhost', :port => 5445 do |context|
      context.queue("/queues/#{Rails.env}/items").publish item
    end
  end
end
