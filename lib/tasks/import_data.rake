namespace :import do
  desc 'This imports AF Venues and Source Orgs from CSVs'

  task :af_data do
    SourceOrg.import_af_source_orgs
    AfVenue.import_af_venues
  end
end
