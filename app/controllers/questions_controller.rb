class QuestionsController < ActionController::Base
  def ask
  end

  def answer
    @question = params[:question]
    if @question.nil?
      @answer = 'You should write something'
    elsif (@question == 'I am going to work right now!') || (@question == 'I am going to work right now!'.upcase)
      @answer = 'All right!'
    elsif @question == @question.upcase
      @answer = coach_answer_enhanced(@question)
    else
      @answer = coach_answer(@question)
    end
  end

  private

  def coach_answer(your_message)
    if your_message == 'I am going to work right now!'
      @answer = ''
    elsif your_message.include?('?')
      @answer = 'Silly question, get dressed and go to work!'
    else
      @answer = "I don't care, get dressed and go to work!"
    end
  end

  def coach_answer_enhanced(your_message)
    if your_message == 'I am going to work right now!'.upcase
      @answer = ''
    elsif your_message.include?('?') && your_message.upcase
      @answer = 'You are motivated! Silly question, get dressed and go to work!'
    elsif your_message.upcase
      @answer = "You are motivated! I don't care, get dressed and go to work!"
    end
  end
end
