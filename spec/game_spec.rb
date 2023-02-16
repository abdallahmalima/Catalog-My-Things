require './game'
require './item'

describe Game do
  before :each do
    @game = Game.new(220, '2012-01-15', false, 'Hi', '2020-02-14')
  end

  it 'Inherits from Item class' do
    expect(Game < Item).to eq true
  end

  it 'has the correct instantiation' do
    expect(@game.multiplayer).to eq 'Hi'
    expect(@game.last_played_at).to eq '2020-02-14'
  end

  describe '#can_be_archived' do
    it 'returns true' do
      expect(@game.send(:can_be_archived?)).to be_truthy
    end
  end
end
