# Configure the TorqueBox Servlet-based session store.
# Provides for server-based, in-memory, cluster-compatible sessions
if ENV['TORQUEBOX_APP_NAME']
  BatchApp::Application.config.session_store :torquebox_store
else
  BatchApp::Application.config.session_store :cookie_store, :key => '_CHANGEME_session'
end  
