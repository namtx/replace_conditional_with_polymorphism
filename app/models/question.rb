class Question < ApplicationRecord
  SUBMITITABLE_TYPES = %w(Open MultipleChoice Scale).freeze

  validates :maximum, presence: true, if: :scale?
  validates :minimum, presence: true, if: :scale?
  validates :question_type, presence: true, inclusion: SUBMITITABLE_TYPES
  validates :title, presence: true

  def summary
    case question_type
    when "MultipleChoice"
      summarize_multiple_choice_answers
    when "Open"
      summarize_open_answers
    when "Scale"
      summarize_scale_answers
    end
  end

  def steps
    (minimum..maximum).to_a
  end

  private
  def scale?
    question_type == "Scale"
  end

  def summarize_multiple_choice_answers
    "Multiple Choice Answer"
  end

  def summarize_open_answers
    "Open Answer"
  end

  def summarize_scale_answers
    "Scale Answer"
  end
end
