class Payments < ApplicationRecord
  validates :descricao, presence: true, uniqueness: true
  validates :natureza, presence: true
  validates :sinal, presence: true
end
