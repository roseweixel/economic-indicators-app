class LineItem < ActiveRecord::Base
  belongs_to :category
  validates_uniqueness_of :category_id, scope: :year

  def search_query
    self.category.query || self.category.name
  end

  def articles_url
  	"http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{self.search_query}&begin_date=#{self.year}0101&end_date=#{self.year}1231&api-key=55fcb0439d641434b5b948714b22a6d5:7:71161329"
  end

  def articles_hash
  	resp = Net::HTTP.get_response(URI.parse(self.articles_url))
  	data = resp.body
  	result = JSON.parse(data)
  	result["response"]["docs"]
  end

  def headlines
  	self.articles_hash.collect{ |article| article["headline"]["main"] }
  end
end
