class Api::PlayerGradesController < ApplicationController
  protect_from_forgery except: :index
  before_action :check_auth
  def answer
    player_id = params[:player_id]
    player_answers = params[:player_answers]
    new_records = []
    answers = PlayerAnswer.where(player_id: player_id)
    if player_answers
      player_answers.each do |quiz, player_answer|
        answer = answers.find_by(quiz: quiz)
        if answer.present?
          answer.answer = player_answer
          answer.save!
        else
          new_records.push(player_id: player_id, quiz: quiz, answer: player_answer)
        end
      end
      PlayerAnswer.create(new_records)
      if Api::AnswerService.new(player_answers, player_id).count_aspect_grade
        answer_result = Player.find_by(id: player_id).answer_result
        grades = PlayerGrade.where(player_id: player_id)
        @response['answer_result'] = answer_result
        @response['grades'] = grades
      else
        @response['msg'] = 'Not count answer'
      end
    else
      @response['msg'] = 'Not received answer'
    end

    render json: @response
  end

  def grade
    player_id = params[:player_id]
    answer_result = Player.find_by(id: player_id).answer_result
    grades = PlayerGrade.where(player_id: player_id)
    @response['answer_result'] = answer_result
    @response['grades'] = grades
    render json: @response
  end
end