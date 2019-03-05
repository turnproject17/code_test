class Article < ApplicationRecord
	require "csv"
  belongs_to :author, class_name: User.name
  scope :active, -> {where("created_at >= ?", Time.now - 7.days).order("updated_at desc")}
  scope :published, -> {where("published_at IS NOT NULL AND published_at < ?", Time.now)}  
  scope :draft, -> {where("published_at IS NULL OR published_at >= ?", Time.now)}  



  def status
    (published_at.nil? || published_at > Time.now) ? "draft" : "published" 
  end

  def self.search_with_params params
  	self.where("title like ?", "%#{params[:title]}%") 
  end


  def self.extract_file
  	records = self.all 
    str = CSV.generate(headers: true) do |csv|
      csv << ['SrNo.', "title", "author", "content", "published_at", "created_at", "updated_at"]
      records.each_with_index do |record, index|
        csv << [index + 1, record.title, record.author.try(:name), record.content, record.published_at, record.created_at, record.updated_at ]
      end
    end
    File.write('aticle_list.csv', str)  	
  end

  def self.import_file 
    CSV.foreach("aticle_list.csv",{:headers=>:first_row}) do |row|
      Article.where(title: row[1], author_id: User.find_by_name(row[2]).try(:id), content: row[3], published_at: DateTime.parse(row[4])).first_or_create
    end    
  end
end
