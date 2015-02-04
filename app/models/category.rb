class Category < ActiveRecord::Base
  has_many :line_items
  validates_uniqueness_of :name

  def now_search_query
    self.query || self.name.gsub(" ", "+")
  end

  def now_articles_url
    "http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{self.now_search_query}&sort=newest&api-key=55fcb0439d641434b5b948714b22a6d5:7:71161329"
  end

  def now_articles_hash
    resp = Net::HTTP.get_response(URI.parse(self.now_articles_url))
    data = resp.body
    result = JSON.parse(data)
    result["response"]["docs"]
  end
end
