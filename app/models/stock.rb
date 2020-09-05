class Stock < ApplicationRecord
    validates :user_id, {presence: true}
    validates :quiz_id, {presence: true}
end