require_relative "item"

class Game < Item
    attr_accessor :multiplayer, :last_played_at

    def initialize(id, publish_date, archived, multiplayer, last_played_at)
        super(id, publish_date, archived: archived)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    private

    def can_be_archived?
        return super && @last_played_at > 2 ? true : false
    end
end