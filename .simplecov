SimpleCov.start 'rails' do
  	add_filter 'app/mailers/application_mailer.rb'
  	add_filter 'app/jobs/application_job.rb'
  	add_filter 'app/controllers/users/registrations_controller.rb'
  	add_filter 'app/channels/application_cable/channel.rb'
  	add_filter 'app/channels/messaging_channel.rb'
  	add_filter 'lib/tasks/cucumber.rake'
end


