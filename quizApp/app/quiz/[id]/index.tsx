import { useLocalSearchParams } from "expo-router";
import { useEffect, useState } from "react";
import { Button, ScrollView, Text, TouchableOpacity, View } from "react-native";
import { getQuiz, submitQuiz } from "../../api/api";

export default function QuizScreen() {
  const { id } = useLocalSearchParams();
  const [quiz, setQuiz] = useState<any>(null);
  const [answers, setAnswers] = useState<any>({});
  const [currentPage, setCurrentPage] = useState(1);

  const questionsPerPage = 5;

  useEffect(() => {
    if (id) {
      getQuiz(Number(id)).then(setQuiz);
    }
  }, [id]);

  const selectOption = (questionId: number, optionId: number) => {
    setAnswers((prev: any) => ({
      ...prev,
      [questionId]: optionId,
    }));
  };

  const handleSubmit = async () => {
    try {
      const result = await submitQuiz(Number(id), answers);

      alert(`🎉 Your Score: ${result.score} / ${result.total}`);
    } catch (error) {
      alert("❌ Something went wrong while submitting the quiz");
    }
  };

  if (!quiz) return <Text>Loading...</Text>;

  const totalPages = Math.ceil(quiz.questions.length / questionsPerPage);

  const startIndex = (currentPage - 1) * questionsPerPage;
  const endIndex = startIndex + questionsPerPage;

  const currentQuestions = quiz.questions.slice(startIndex, endIndex);

  return (
    <View style={{ flex: 1 }}>
      {/* 🔹 Scrollable Content */}
      <ScrollView style={{ padding: 20 }}>
        <Text style={{ fontSize: 22, fontWeight: "bold" }}>{quiz.title}</Text>

        <Text style={{ marginTop: 5 }}>
          Page {currentPage} of {totalPages}
        </Text>

        {currentQuestions.map((q: any) => (
          <View key={q.id} style={{ marginTop: 15 }}>
            <Text>{q.content}</Text>

            {q.options.map((opt: any) => (
              <TouchableOpacity
                key={opt.id}
                onPress={() => selectOption(q.id, opt.id)}
                style={{
                  padding: 10,
                  marginTop: 5,
                  backgroundColor:
                    answers[q.id] === opt.id ? "#cce5ff" : "#eee",
                }}
              >
                <Text>{opt.content}</Text>
              </TouchableOpacity>
            ))}
          </View>
        ))}
      </ScrollView>

      {/* 🔹 Fixed Bottom Bar */}
      <View
        style={{
          flexDirection: "row",
          justifyContent: "space-between",
          padding: 15,
          borderTopWidth: 1,
          backgroundColor: "#fff",
        }}
      >
        {currentPage > 1 && (
          <Button
            title="Previous"
            onPress={() => setCurrentPage(currentPage - 1)}
          />
        )}

        {currentPage < totalPages ? (
          <Button
            title="Next"
            onPress={() => setCurrentPage(currentPage + 1)}
          />
        ) : (
          <Button title="Submit Quiz" onPress={handleSubmit} />
        )}
      </View>
    </View>
  );
}
