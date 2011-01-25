class RefinerycmsTranslations < Refinery::Generators::EngineInstaller
  
  source_root File.expand_path('../../', __FILE__)

  raise 'bouh'

  engine_name "translations"

	translation_root = Pathname.new(File.expand_path(File.dirname(__FILE__) << "/../.."))
	rails_root = if defined?(Rails.root)
  	Rails.root
	elsif defined?(RAILS_ROOT)
	  Pathname.new(RAILS_ROOT)
	else
	  Pathname.new(ARGV.first)
	end

	if rails_root.exist?
  	[%w(db migrate)].each do |dir|
	    rails_root.join(dir.join(File::SEPARATOR)).mkpath
	  end

	  copies = [
	    {:from => %w(db migrate), :to => %w(db migrate), :filename => "20100705210405_create_translations.rb"}
	  ]
		copies.each do |copy|
	    copy_from = translation_root.join(copy[:from].join(File::SEPARATOR), copy[:filename])
		  copy_to = rails_root.join(copy[:to].join(File::SEPARATOR), copy[:filename])
	    unless copy_to.exist?
		    FileUtils::copy_file copy_from.to_s, copy_to.to_s
	    else
	      puts "'#{File.join copy[:to], copy[:filename]}' already existed in your application so your existing file was not overwritten."
	    end
	  end

		puts "---------"
		puts "Copied refinerycms-translation migration files."
		puts "Now, run rake db:migrate" 
		puts "Make sure 'i18n_frontend_translation_locales' and 'i18n_translation_default_frontend_locale' are defined to fit your needs in your Refinery Setting"
	else
	  puts "Please specify the path of the project that you want to use the translation with, i.e. refinerycms-translation-install /path/to/project"
	end
  
end