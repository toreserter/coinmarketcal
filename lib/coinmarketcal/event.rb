require 'time'
module Coinmarketcal
  class Event
    attr_reader :id, :title, :coins, :date_event, :created_date,
                :description, :proof, :source, :is_hot, :vote_count, :positive_vote_count,
                :percentage, :categories, :tip_symbol, :tip_address, :twitter_account, :can_occur_before

    def initialize(attrs = {})
      attrs.each do |k, v|
        next if ['created_date', 'date_event'].include?(k.to_s)
        self.instance_variable_set("@#{k}", v)
      end
      @created_date = Time.iso8601(attrs['created_date'])
      @date_event = Time.iso8601(attrs['date_event'])
    end

    def self.all(attrs = {})
      search_hash = {
          page: (attrs[:page] || 1),
          max: attrs[:max],
          dateRangeStart: attrs[:date_range_start],
          dateRangeEnd: attrs[:date_range_end],
          coins: attrs[:coins],
          categories: attrs[:categories],
          sortBy: attrs[:sort_by],
          showOnly: attrs[:show_only],
          showMetadata: attrs[:show_metadata]
      }
      client.get('v1/events', compact(search_hash)).map { |data| new(data) }
    end

    private

    def self.client
      @client ||= Coinmarketcal.client
    end

    def self.compact(hash)
      hash.select { |_, value| !value.nil? }
    end

  end
end
