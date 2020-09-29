class Plan < ApplicationRecord
    #teamsと1:多の関連付け
    has_many :teams
end
