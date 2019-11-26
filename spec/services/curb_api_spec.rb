describe 'CurbApi' do
  context '#bet' do
    it '#valid request' do
      curb = CurbApi.bet
      expect(curb).to eq :scissors
    end

    it '#with 500 status' do
      curb = CurbApi.bet
      expect(%i[rock paper scissors].include?(curb)).to be true
    end

    it '#bad body' do
      curb = CurbApi.bet
      expect(%i[rock paper scissors].include?(curb)).to be true
    end
  end

  context '#generate_bet' do
    it '#return valid result' do
      bet = CurbApi.generate_bet
      expect(%i[rock paper scissors].include?(bet)).to be true
    end
  end

  context '#prepare_response' do
    it 'should remove extra quotes' do
      response = JSON.parse '{"statusCode":200,"body":"\"scissors\""}'
      resp = CurbApi.prepare_response(response)
      expect(resp).to eq :scissors
    end

    it 'generate bet if got bad body' do
      response = JSON.parse('{"statusCode":200,"body":"\"banana\""}')
      bet = CurbApi.prepare_response(response)
      expect(%i[rock paper scissors].include?(bet)).to be true
    end

    it 'generate bad if statusCode 500' do
      response = JSON.parse('{"statusCode":500,"body":"Something went wrong. Please try again later."}')
      bet = CurbApi.prepare_response(response)
      expect(%i[rock paper scissors].include?(bet)).to be true
    end
  end
end
