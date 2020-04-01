class Stock < ApplicationRecord
	belongs_to :user
	validates :ticker, presence: true
	validates :ticker, presence: { without: /\s/}
end
