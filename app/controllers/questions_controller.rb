class QuestionsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_quiz, only: [:new, :edit, :update, :create, :destroy]
    before_action :find_question, only: [:show, :edit, :update, :destroy]

    def new
        @question = Question.new
    end

    def create
        @question = Question.new question_params
        @question.quiz = @quiz

        if @question.save
            flash[:success] = "Question made!"
            redirect_to quiz_path(@quiz)
        else
            if @question.errors
                flash.now[:danger] = @question.errors.full_messages.join(", ")
            end
            render :new
        end
    end

    def show
        render :show
    end

    def edit

    end

    def update
        if @question.update question_params
            redirect_to quiz_path(@quiz.id)
        else
            render :edit
        end
    end

    def destroy
        if @question.destroy
            flash[:success] = "Question deleted!"
            redirect_to quiz_path(@quiz.id)
        else
            flash[:danger] = @question.errors.messages.join(", ")
            redirect_to quiz_path(@quiz.id)
        end
    end

    private
    def question_params
        params.require(:question).permit(:title, :option0, :option1, :option2, :option3, :correct_answer)
    end

    def find_quiz
        @quiz = Quiz.find params[:quiz_id]
    end

    def find_question
        @question = Question.find params[:id]
    rescue ActiveRecord::RecordNotFound
        flash[:danger] = "Error"
        redirect_to quizzes_path
    end

    def question_params
        params.require(:question).permit(:question, :option0, :option1, :option2, :option3, :correct_answer)
    end

end
