require 'rails_helper'

describe MarginFetcher do
  describe '#flexible_margin' do
    it 'fetches the reuters homepage and checks for occurences of the letter a' do
      allow(MarginFetcher).to receive(:open) {
        '<body><p>Although</p><span>At that</span></body>'
      }

      expect(described_class.flexible_margin).to eq(1)
    end
  end


  describe '#fixed_margin' do
    it 'fetches the github documentation and checks for occurences of the word status' do
      allow(MarginFetcher).to receive(:open) {
        '<body><p>Many statuses</p><span>In the status</span></body>'
      }

      expect(described_class.fixed_margin).to eq(2)
    end
  end

  describe '#prestige_margin' do
    it 'fetches the guardian ruby rss feed and checks for occurences of pubDate elements' do
      allow(MarginFetcher).to receive(:open) {
        <<-XML
        <?xml version="1.0" encoding="UTF-8"?>
        <?xml-stylesheet type="text/xsl" href="/resources/xsl/"?>
        <rss xmlns:atom="http://www.w3.org/2005/Atom" version="2.0">
          <channel>
            <pubDate>Tue, 05 Apr 2016 15:33:18 +0100</pubDate>
            <generator>M6</generator>
            <title>Your Local Guardian | Rugby Union</title>
            <item>
              <pubDate>Fri, 01 Apr 2016 06:12:00 +0100</pubDate>
              <guid isPermaLink="false">dce92cda8cc6db5258dd75b7781cea1c</guid>
            </item>
          </channel>
        </rss>
        XML
      }

      expect(described_class.prestige_margin).to eq(2)
    end
  end
end


