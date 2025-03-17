class Stock < ApplicationRecord

    has_many :user_stocks
    has_many :users, through: :user_stocks

    validates :name, :ticker, :last_price, presence: true

    def self.new_lookup(ticker_symbol)
        new(ticker: ticker_symbol, name: "Placeholder", last_price: rand(1...1000))
    end

    def self.check_db(ticker_symbol)
        where(ticker: ticker_symbol).first
    end

end
