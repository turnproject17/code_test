desc "Import Articles"
namespace :import do
  task :articles => :environment do
    # code here
    Article.import_file
  end
end
