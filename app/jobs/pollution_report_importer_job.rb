class PollutionReportImporterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    PollutionImporter.import
  end
end
