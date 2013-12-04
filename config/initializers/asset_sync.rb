if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.fog_directory = ENV['FOG_DIRECTORY']

    # Fail silently.  Useful for environments such as Heroku
    config.fail_silently = true
  end
end
