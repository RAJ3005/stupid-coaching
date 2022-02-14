class QuestionsController < ApplicationController
  def ask
  end


  def answer
    @question = params[:question]
    @answer = coach_answer(@question)
    @answer = coach_answer_enhanced(@question)
  end

  def coach_answer(your_message)
    # TODO: return coach answer to your_message

    is_shouting = your_message.to_s == your_message.to_s.upcase

    is_going_to_work = (your_message == 'I am going to work right now!')

    is_question = your_message[your_message.length - 1] == "?"

    return coach_answer_enhanced(your_message) if is_shouting

    # default response is uncaring
    coach_response = 'I don\'t care, get dressed and go to work!'

    # silly questions not wanted
    coach_response = 'Silly question, get dressed and go to work!' if is_question

    # satisfied
    coach_response = '' if is_going_to_work

    coach_response
  end

  def coach_answer_enhanced(your_message)
    # TODO: return coach answer to your_message, with additional custom rules of yours!
    # TODO: return coach answer to your_message
    is_shouting = your_message.to_s == your_message.to_s.upcase

    is_going_to_work = (your_message.upcase == "I am going to work right now!".upcase)

    is_question = your_message[your_message.length - 1] == "?"

    # return coach_answer_enhanced(your_message) if is_shouting

    # default response is uncaring
    coach_response = "I don't care, get dressed and go to work!"

    # silly questions not wanted
    coach_response = "Silly question, get dressed and go to work!" if is_question

    # satisfied
    coach_response = "I can feel your motivation! #{coach_response}" unless is_going_to_work || !is_shouting
    coach_response = "" if is_going_to_work

    return coach_response
  end
end
