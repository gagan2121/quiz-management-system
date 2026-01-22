const BASE_URL = "http://localhost:3000/api";

export const getQuizzes = async () => {
  const res = await fetch(`${BASE_URL}/quizzes`);
  return res.json();
};

export const getQuiz = async (id: number) => {
  const res = await fetch(`${BASE_URL}/quizzes/${id}`);
  return res.json();
};

export const submitQuiz = async (quizId: number, answers: any) => {
  const formattedAnswers = Object.keys(answers).map((qId) => ({
    question_id: Number(qId),
    option_id: answers[qId],
  }));

  const res = await fetch(`${BASE_URL}/quizzes/${quizId}/submit`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ answers: formattedAnswers }),
  });
  return res.json();
};
