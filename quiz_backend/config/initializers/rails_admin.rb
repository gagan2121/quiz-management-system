RailsAdmin.config do |config|

  # ==================================================
  # 🔐 SECURITY
  # ==================================================
  config.authenticate_with do
    warden.authenticate! scope: :admin_user
  end

  config.current_user_method(&:current_admin_user)

  config.authorize_with do
    redirect_to main_app.new_admin_user_session_path unless current_admin_user
  end

  # ==================================================
  # 🧠 QUIZ
  # ==================================================
  config.model 'Quiz' do
    navigation_label 'Quiz Management'

    edit do
      field :title
    end

    list do
      field :id
      field :title
    end
  end

  # ==================================================
  # ❓ QUESTION
  # ==================================================
  config.model 'Question' do
    navigation_label 'Quiz Management'

    edit do
      field :quiz
      field :content
      field :question_type

      exclude_fields :options, :answers
    end

    list do
      field :quiz
      field :content
      field :question_type
    end
  end

  # ==================================================
  # 🔘 OPTION
  # ==================================================
  config.model 'Option' do
    navigation_label 'Quiz Management'

    edit do
      field :question
      field :content
      field :is_correct
    end

    list do
      field :question
      field :content
      field :is_correct
    end
  end

  # ==================================================
  # 📊 RESULT (SHOW IN LIST ONLY)
  # ==================================================
  config.model 'Result' do
    navigation_label 'Reports'

    # 👇 only visible in list/show routes
    visible do
      %w[index show].include?(bindings[:controller].action_name)
    end

    list do
      field :quiz
      field :score
      field :created_at
    end
  end

  # ==================================================
  # 🧾 ANSWER (HIDE COMPLETELY)
  # ==================================================
  config.model 'Answer' do
    visible false
  end

end