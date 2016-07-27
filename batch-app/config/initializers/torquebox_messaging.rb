# set up queue handlers for torquebox-4
# http://torquebox.org/documentation/4.0.0.beta3/yardoc/file.migration.html#messaging

item_queue = TorqueBox::Messaging::Queue.new "/queues/#{Rails.env}/items"

# http://torquebox.org/documentation/4.0.0.beta3/yardoc/TorqueBox/Messaging/Destination.html#listen-instance_method
item_queue.listen do |item|
  item.save!
end
