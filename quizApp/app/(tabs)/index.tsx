import { useRouter } from "expo-router";
import { useEffect, useState } from "react";
import { Text, TouchableOpacity, View } from "react-native";
import { getQuizzes } from "../api/api";

export default function QuizList() {
  const [quizzes, setQuizzes] = useState<any[]>([]);
  const router = useRouter();

  useEffect(() => {
    getQuizzes().then((data) => {
      console.log("API RESPONSE 👉", data);

      if (Array.isArray(data)) {
        setQuizzes(data);
      } else if (Array.isArray(data.quizzes)) {
        setQuizzes(data.quizzes);
      } else {
        setQuizzes([]); // fallback
      }
    });
  }, []);

  return (
    <View style={{ padding: 20 }}>
      <Text style={{ fontSize: 22, fontWeight: "bold" }}>
        Available Quizzes
      </Text>

      {Array.isArray(quizzes) &&
        quizzes.map((quiz) => (
          <TouchableOpacity
            key={quiz.id}
            onPress={() => router.push(`/quiz/${quiz.id}`)}
          >
            <Text style={{ marginTop: 10 }}>{quiz.title}</Text>
          </TouchableOpacity>
        ))}
    </View>
  );
}
