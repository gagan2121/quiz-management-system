Answer.delete_all
Result.delete_all
Option.delete_all
Question.delete_all
Quiz.delete_all
AdminUser.delete_all

puts "🧹 Old data cleared"

AdminUser.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
  admin.password_confirmation = "password"
end

# =========================
# QUIZ 1: Ruby on Rails
# =========================
quiz = Quiz.create!(title: "Ruby on Rails Fundamentals")

# Q1 - MCQ
q1 = quiz.questions.create!(
  content: "Rails kis programming language par based hai?",
  question_type: "mcq"
)

q1.options.create!(content: "Ruby", is_correct: true)
q1.options.create!(content: "Python", is_correct: false)
q1.options.create!(content: "Java", is_correct: false)
q1.options.create!(content: "PHP", is_correct: false)

# Q2 - True/False
q2 = quiz.questions.create!(
  content: "Rails MVC architecture follow karta hai",
  question_type: "true_false"
)

q2.options.create!(content: "True", is_correct: true)
q2.options.create!(content: "False", is_correct: false)

# Q3 - MCQ
q3 = quiz.questions.create!(
  content: "Rails me database migration ka kaam kya hota hai?",
  question_type: "mcq"
)

q3.options.create!(content: "Database schema manage karna", is_correct: true)
q3.options.create!(content: "UI design", is_correct: false)
q3.options.create!(content: "Server deploy karna", is_correct: false)
q3.options.create!(content: "Email bhejna", is_correct: false)

# Q4 - MCQ
q4 = quiz.questions.create!(
  content: "Rails console open karne ke liye kaunsa command use hota hai?",
  question_type: "mcq"
)

q4.options.create!(content: "rails c", is_correct: true)
q4.options.create!(content: "rails s", is_correct: false)
q4.options.create!(content: "rails g", is_correct: false)
q4.options.create!(content: "bundle install", is_correct: false)

# Q5 - True/False
q5 = quiz.questions.create!(
  content: "ActiveRecord ORM ka part hai Rails ka",
  question_type: "true_false"
)

q5.options.create!(content: "True", is_correct: true)
q5.options.create!(content: "False", is_correct: false)

# Q6 - MCQ
q6 = quiz.questions.create!(
  content: "Rails me routes kis file me define hote hain?",
  question_type: "mcq"
)

q6.options.create!(content: "config/routes.rb", is_correct: true)
q6.options.create!(content: "app/controllers.rb", is_correct: false)
q6.options.create!(content: "database.yml", is_correct: false)
q6.options.create!(content: "Gemfile", is_correct: false)

# Q7 - Text
q7 = quiz.questions.create!(
  content: "Rails MVC architecture explain kijiye",
  question_type: "text"
)

# Correct answer text (reference ke liye)
q7.options.create!(
  content: "Model business logic handle karta hai, View UI show karta hai aur Controller request-response manage karta hai",
  is_correct: true
)

# Q8 - Text
q8 = quiz.questions.create!(
  content: "Ruby on Rails use karne ke 2 advantages likhiye",
  question_type: "text"
)

q8.options.create!(
  content: "Rapid development aur convention over configuration",
  is_correct: true
)