TorqueBox.configure do
  queue "/queues/#{Rails.env}/items" do
    exported true
    processor ItemHandler
  end

  # calculate a new item every 2 minutes
  job ItemCalculator do
    cron '0 */2 * * * ?'
    description 'Create an item every two minutes'
  end
end
