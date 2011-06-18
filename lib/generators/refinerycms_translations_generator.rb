class RefinerycmsTranslations < Refinery::Generators::EngineInstaller
  
  source_root File.expand_path('../../', __FILE__)
  engine_name "translations"

	translation_root = Pathname.new(File.expand_path(File.dirname(__FILE__) << "/../.."))

  next_migration_number = ActiveRecord::Generators::Base.next_migration_number(File.dirname(__FILE__))
  
  copy_to = Rails.root.join("db/migrate/#{next_migration_number}_create_translations.rb")

  unless copy_to.exist?
    FileUtils::copy_file translation_root.join('db/migrate/create_translations.rb'), copy_to.to_s
  else
    puts "'#{File.join copy[:to], copy[:filename]}' already existed in your application so your existing file was not overwritten."
  end

	puts "------------------------"
	puts "Copied refinerycms-translation migration files."
	puts "Make sure 'i18n_frontend_translation_locales' and 'i18n_translation_default_frontend_locale' are defined to fit your needs in your Refinery Setting"

end