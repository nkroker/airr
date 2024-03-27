every 10.seconds do
  runner "PollutionImporterJob.set(wait: 1.hours).perform_later"
end
