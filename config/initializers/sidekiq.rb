if ENV.fetch("IS_SCHEDULER", false)
  Sidekiq.configure_server do |config|
    config.on(:startup) do
      Sidekiq.schedule = YAML.load_file(File.expand_path(Rails.root.join("config/schedule.yml"), File.dirname(__FILE__)))
      Sidekiq::Scheduler.reload_schedule!
    end
  end
end
