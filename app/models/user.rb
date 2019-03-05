class User < ApplicationRecord
  has_many :articles, foreign_key: "author_id"
  validates_uniqueness_of :email



  def report_row
  	return [self.name, Time.now, articles.draft.count, articles.published.count]
  end
end
