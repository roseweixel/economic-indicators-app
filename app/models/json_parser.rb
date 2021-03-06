class JsonParser
  attr_accessor :data, :government, :private_industries, :private_industries_array, :private_industries_list, :top_level_categories_and_totals

  def initialize
    @data = JSON.parse(File.read('db/gross_output.json'))
    @private_industries = @data["All industries"]["children"]["Private industries"]["children"]
    @private_industries_list = @private_industries.keys
    @government = @data["All industries"]["children"]["Government"]
    @private_industries_array = []
    @top_level_categories_and_totals = []

    get_all_private_industries
    get_top_level_categories_and_totals

    create_top_level_categories_and_line_items
  end

  def government_totals
    government["totals"]
  end

  def get_all_private_industries
    @private_industries_list.each do |industry|
      @private_industries_array << {industry => @private_industries[industry]}
    end
  end

  def get_top_level_categories_and_totals
    private_industries_array.each do |industry|
      industry.keys.each do |category|
        @top_level_categories_and_totals << {category => industry[category]["totals"]}
      end
    end
    @top_level_categories_and_totals << {"Government" => government["totals"]}
  end

  def create_top_level_categories_and_line_items
    @top_level_categories_and_totals.each do |category_hash|
      category_hash.each do |name, totals_hash|
        category = Category.find_or_create_by(name: name)
        totals_hash.each do |year, total|
          LineItem.create(category_id: category.id, year: year.to_i, total: total)
        end
      end
    end
  end

end