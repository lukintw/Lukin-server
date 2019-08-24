class Api::AnswerService
  def initialize(answers, player_id)
    # Create total title and data array
    @answers = answers
    @player_id = player_id
  end

  def count_aspect_grade
    tran_answers = {}
    aspects = {}
    new_records = []
    result = ''
    # trans answer
    @answers.each do |quiz, answer|
      case answer
      when '1'
        tran_answers[quiz] = 5
      when '2'
        tran_answers[quiz] = 4
      when '4'
        tran_answers[quiz] = 2
      when '5'
        tran_answers[quiz] = 1
      when '3'
        tran_answers[quiz] = 3
      else
        return false
      end
      @answers[quiz] = answer.to_i
    end

    # set aspect init values
    aspects['IE'] = @answers['3'] + @answers['4'] + @answers['5'] + tran_answers['1'] + tran_answers['2']
    aspects['NS'] = @answers['6'] + tran_answers['7'] + tran_answers['8'] + tran_answers['9'] + tran_answers['10']
    aspects['FT'] = @answers['11'] + @answers['12'] + tran_answers['13'] + tran_answers['14'] + tran_answers['15']
    aspects['PJ'] = @answers['16'] + tran_answers['17'] + tran_answers['18'] + tran_answers['19'] + @answers['20']

    # count aspects and result
    aspects.each do |aspect, value|
      aspects[aspect] = 5 * value - 25
      aspects[aspect] > 50 ? result.concat(aspect[0]) : result.concat(aspect[1])
      player_grade = PlayerGrade.find_by(player_id: @player_id, aspect: aspect)
      if player_grade.nil?
        new_records.push(player_id: @player_id, aspect: aspect, grade: aspects[aspect])
      else
        player_grade.update(grade: aspects[aspect])
      end
    end
    PlayerGrade.create(new_records)
    Player.find(@player_id).update(answer_result: result)
    true
  end
end