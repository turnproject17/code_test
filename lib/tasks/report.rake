require 'csv'

desc "Create an author report"
namespace :report do
  task :authors => :environment do
    # Your query here
    sql_query = <<-SQL
      SELECT DISTINCT author_id FROM Articles;
    SQL

    user_ids = ActiveRecord::Base.connection.exec_query(sql_query).rows.flatten
    CSV.open('report.csv', "w") do |csv|
      csv << ["Author", "Day", "Total Drafts", "Total Published"];
      User.where(id: user_ids).each do |u|
        csv << u.report_row 
      end
    end
  end
end
