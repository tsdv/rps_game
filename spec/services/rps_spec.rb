describe 'Rps' do
  context '#game' do
    context '#paper' do
      before(:each) do
        allow(CurbApi).to receive(:bet).and_return(:paper)
      end

      it '#paper should win rock' do
        expected_result = {
          winner: 'curb',
          curb_bet: 'paper',
          winner_bet: 'paper'
        }
        expect(Rps.new('rock').game).to eq expected_result
      end

      it '#paper should lose scissors' do
        expected_result = {
          winner: 'user',
          curb_bet: 'paper',
          winner_bet: 'scissors'
        }
        expect(Rps.new('scissors').game).to eq expected_result
      end

      it '#paper and paper should draw' do
        expected_result = {
          winner: 'draw',
          curb_bet: 'paper',
          winner_bet: 'paper'
        }
        expect(Rps.new('paper').game).to eq expected_result
      end
    end

    context '#rock' do
      before(:each) do
        allow(CurbApi).to receive(:bet).and_return(:rock)
      end

      it '#rock should win scissors' do
        expected_result = {
          winner: 'curb',
          curb_bet: 'rock',
          winner_bet: 'rock'
        }
        expect(Rps.new('scissors').game).to eq expected_result
      end

      it '#rock should lose paper' do
        expected_result = {
          winner: 'user',
          curb_bet: 'rock',
          winner_bet: 'paper'
        }
        expect(Rps.new('paper').game).to eq expected_result
      end

      it '#rock and rock should draw' do
        expected_result = {
          winner: 'draw',
          curb_bet: 'rock',
          winner_bet: 'rock'
        }
        expect(Rps.new('rock').game).to eq expected_result
      end
    end

    context '#scissors' do
      before(:each) do
        allow(CurbApi).to receive(:bet).and_return(:scissors)
      end

      it '#scissors should win paper' do
        expected_result = {
          winner: 'curb',
          curb_bet: 'scissors',
          winner_bet: 'scissors'
        }
        expect(Rps.new('paper').game).to eq expected_result
      end

      it '#scissors should lose rock' do
        expected_result = {
          winner: 'user',
          curb_bet: 'scissors',
          winner_bet: 'rock'
        }
        expect(Rps.new('rock').game).to eq expected_result
      end

      it '#scissors and scissors should draw' do
        expected_result = {
          winner: 'draw',
          curb_bet: 'scissors',
          winner_bet: 'scissors'
        }
        expect(Rps.new('scissors').game).to eq expected_result
      end
    end
  end

  context '#result' do
    it '#include valid keys' do
      allow(CurbApi).to receive(:bet).and_return(:paper)
      rps = Rps.new('rock')
      expect(rps.result('user', 'rock', 'rock')).to include(:winner, :curb_bet, :winner_bet)
    end
  end

  context '#rules' do
    it '#valid rules' do
      allow(CurbApi).to receive(:bet).and_return(:paper)
      rps = Rps.new('rock')
      expected_result = {
        rock: %i[scissors],
        scissors: %i[paper],
        paper: %i[rock]
      }
      expect(rps.rules).to eq expected_result
    end
  end
end
