class Question < ApplicationRecord
  belongs_to :quiz
  has_many :options, dependent: :destroy
  has_many :answers

  enum question_type: {
    mcq: "mcq",
    true_false: "true_false",
    text: "text"
  }
end
