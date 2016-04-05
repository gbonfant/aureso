class MarginFetcher
  class << self
    def flexible_margin
      @flexible_margin ||= begin
        reuters = Nokogiri::HTML(open('http://reuters.com')).at('body')

        reuters.css('style').remove
        reuters.css('script').remove

        reuters.text.gsub(/\t|\n/, '').count('a')
      end
    end

    def fixed_margin
      @fixed_margin ||= begin
        github = Nokogiri::HTML(open('https://developer.github.com/v3/')).at('body')

        github.css('style').remove
        github.css('script').remove

        github.text.gsub(/\t|\n/, '').split(' ').select { |word| word =~ /status/ }.count
      end
    end

    def prestige_margin
      @prestige_margin ||= begin
        rugby = Nokogiri::XML(open('http://www.yourlocalguardian.co.uk/sport/rugby/rss/'))

        rugby.xpath('//pubDate').count
      end
    end
  end
end
