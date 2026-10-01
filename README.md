# Quizzler: Fenerbahçe Edition 🟡🔵

A custom-themed, interactive iOS trivia application engineered with a strict Model-View-Controller (MVC) architecture, demonstrating advanced state management, Swift value types, and asynchronous UI updates.

## 📌 Executive Summary
This project transcends a standard procedural quiz app by implementing a robust, decoupled architecture. Tailored with an extensive 49-question Fenerbahçe S.K. database, the application strictly separates the user interface from the underlying business logic. The View Controller acts solely as a rendering coordinator, while the encapsulated Model handles score tracking, index progression, and validation, ensuring a highly scalable codebase.

## 🛠 Technical Architecture & Core Competencies
*   **Strict MVC Decoupling:** The `ViewController` contains zero business logic, actively preventing the "Massive View Controller" anti-pattern. It delegates user interactions to the `QuizBrain` and reacts to its computed outputs.
*   **Value Semantics & Memory Safety:** Engineered utilizing Swift `Struct` constructs, the `Question` and `QuizBrain` models leverage value types to prevent unintended side-effects. State mutability is strictly controlled via `mutating` functions, ensuring predictable memory behavior during score and index updates.
*   **Asynchronous UI Threading:** Implemented `DispatchQueue.main.asyncAfter` to manage micro-interactions (providing a 0.2-second visual feedback window for correct/incorrect answers) without blocking the main thread or causing race conditions.
*   **Data Encapsulation:** The extensive trivia database and custom scoring mechanics (+2 points per correct answer) are securely encapsulated within the model layer. The Controller interacts with the data exclusively through exposed, read-only getter methods (`getQuestionText()`, `getProgress()`, `getScore()`), preserving strict data integrity.

## 👨‍💻 Developer Insight
The primary engineering achievement in this build is the flawless synchronization of state across a decoupled architecture. Adapting the base mechanics into a comprehensive, domain-specific application required structuring the data array efficiently and managing the lifecycle of the quiz (such as resetting state upon completion) entirely within the value-type model. This approach guarantees that expanding the question bank or altering scoring rules requires absolutely zero modifications to the UI layer.
