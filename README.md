# Quizzler: Fenerbahçe Edition 🟡🔵

A true-or-false trivia app built on a strict Model-View-Controller separation, with a thirty-question set on Fenerbahçe's history written from scratch.

## 📌 Overview

A claim appears on screen and you decide whether it is true or false. The button you press turns green if you were right and red if you were not, the bar at the top tracks how far along you are, and the corner keeps the score at two points per correct answer. The questions cover the club's founding, its European campaigns, its presidents and its other branches, and fifteen of the thirty answer true while fifteen answer false.

## 🛠 Technical Architecture & Core Competencies

**Model-View-Controller separation.** `ViewController` holds no questions, no answers and no scoring rules. It owns five outlets and two methods: one that reacts to a tap, one that redraws the screen. Everything it displays arrives through a getter on `QuizBrain` — `getQuestionText()`, `getProgress()`, `getScore()`. The entire question set can be replaced without touching the controller.

**Value semantics.** `Question` and `QuizBrain` are both structs. The state that changes — `questionNumber` and `userScore` — is mutated only inside `mutating` functions, so the compiler enforces where mutation may happen rather than leaving it to convention.

**Derived UI state.** Nothing about the interface is stored twice. The progress bar reads `Float(questionNumber + 1) / Float(quiz.count)` and the score label reads `getScore()`; both are computed from the model on every redraw, so there is no second copy of the state that could drift out of sync.

**Deferred redraw.** The answer button keeps its colour for a fraction of a second before the next question replaces it, using `DispatchQueue.main.asyncAfter`. Without the delay the feedback would be invisible — the screen would update before the colour could register.

### Project Structure

```
Quizzler/
├── Controller/   ViewController — outlets, tap handling, redraw
├── Model/        Question (one item), QuizBrain (set, order, score)
└── View/         Main.storyboard
```

## 👨‍💻 Developer Insight

The code here is the course's; what the project is actually mine for is the question set, and writing it turned out to have constraints of its own.

The first one is statistical. An early draft had twenty-two of twenty-nine answers reading true, which means a player tapping "true" every time scores seventy-six percent without reading anything. The distribution is now exactly even, so guessing is worth fifty percent and the only way to do better is to know the answer. Content, not pattern.

The second is about what makes a question hard. Difficulty is easy to fake by reaching for detail nobody could know, but that produces a quiz people lose rather than learn from. The hard questions here are built instead on things that are widely *misremembered*: that the stadium's namesake was a founder rather than a long-serving president, that the club reached a European final, that its name came from a person. Someone who answers those wrong finds out something true in the same moment, which is the only reason a quiz is worth playing twice.

Both decisions live entirely in the data array. Neither required a line of logic — which is, in a way, the point of the architecture the course was teaching.
