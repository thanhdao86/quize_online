package online_quizzes.utils;

import java.util.Map;

public class AppConstants {
    public static final String DEFAULT_PAGE_NUMBER = "0";

    public static final String DEFAULT_PAGE_SIZE = "30";

    public static final int MAX_PAGE_SIZE = 30;

    public static final String CREATED_AT = "createdAt";

    public static final String ID = "id";

    public static final String CLASSES = "Classes";

    public static final String CLASS_STUDENT = "ClassStudent";

    public static final String EXAM = "Exam";

    public static final String USER = "User";

    public static final String EXAM_QUESTION = "ExamQuestion";

    public static final String QUESTION = "Question";

    public static final String QUESTION_BANK = "QuestionBank";

    public static final String RESULT = "Result";

    public static final String SUBJECT = "Subject";

    public static final String YOU_DON_T_HAVE_PERMISSION_TO_MAKE_THIS_OPERATION = "You don't have permission to make this operation";

    public static final Map<String, String> ENTITY_MAP = Map.of(
            "1", "A",
            "2", "B",
            "3", "C",
            "4", "D"
    );

    public static final String ROLE_STUDENT = "student";
    public static final String ROLE_TEACHER = "teacher";
    public static final String ROLE_ADMIN = "admin";
}
