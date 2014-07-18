namespace :import do
  desc "imports convicts"
  task convicts: :environment do
  	Bookee.import_convicts
  end
  
  desc "reset database"
  task reset: :environment do

  	Bookee.destroy_all
  	Crime.destroy_all
  	
  end

end
