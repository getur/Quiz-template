# AGENTS.md

Standalone Duolingo-style quiz HTML app for "Programa Geração BIZ" (pt-PT).  
Two quiz generations live side-by-side — know which one you're working on.

## Generations

### Gen 2 — Multi-type quiz (new, root)
`quiz-template.html` — **Self-contained standalone file** (no build step).  
Supports 8 question types: `mcq`, `multi-select`, `true-false`, `fill-blank`, `matching`, `sequencing`, `numeric`, `flashcard`.

- Data is inline in the `<script>` block at line ~880: `const quizData = { ... }`
- Just edit the data block and open in browser; no build tooling exists
- Uses Tabler Icons CDN + Google Fonts (Inter)
- Theme: MAZA dark (`--clr-midnight`, `--clr-navy`, `--clr-surface`, `--clr-blue`, etc.)
- Lives/XP/streak/progress bar/confetti result screen built in

### Gen 1 — Card-based MCQ quiz (legacy, in `testes/`)
| Path | Role |
|---|---|
| `testes/quiz.html` | Template with `__QUIZ_DATA_PLACEHOLDER__` |
| `testes/quiz.json` | Geração BIZ data (15 questions, MCQ cards) |
| `testes/quiz_its_contracepcao.json` | ITS/contracepção topic data |
| `testes/quiz_standalone.html` | Built from `quiz.json` |
| `testes/quiz_standalone_its_contracepcao.html` | Built from ITS JSON |
| `testes/build_standalone.ps1` | Build script (hardcoded paths) |
| `testes/inspect.ps1` | Quick JSON structure inspector |

**Build Gen 1:**
```powershell
.\testes\build_standalone.ps1
```
Reads `testes/quiz.html` + `testes/quiz.json`, writes `testes/quiz_standalone.html`.  
Hardcoded paths point within `testes/` — no config needed.

## Data structures

**Gen 2** (`quiz-template.html`):
```js
{
  quiz_title: "...", language: "pt-PT",
  questions: [
    // Each question has a "type" field: mcq | multi-select | true-false
    // | fill-blank | matching | sequencing | numeric | flashcard
    // Shape varies per type — see demo data at line ~880
  ]
}
```

**Gen 1** (`testes/quiz*.json`):
```json
{
  "quiz_title": "...", "language": "pt-PT", "total_questions": 15,
  "questions": [{
    "id": "q1", "question": "...",
    "audioquestao": "data:audio/mp3;base64,...",
    "cards": [{ "id": "c1", "title": "...", "explanation": "...",
      "image": "data:image/png;base64,...",
      "audio_resposta": "data:audio/mp3;base64,..." }],
    "correctCardIds": ["c1"]
  }]
}
```

## Conventions

- `pt-PT` is **European Portuguese** (Portugal), not Brazilian.
- All media (images, audio) are base64 data URIs — no external assets.
- Never edit standalone outputs directly; edit the template/JSON and rebuild.
- When generating new quiz JSON for Gen 1, create `testes/quiz_[topic].json` — never overwrite existing files.
- `.agents/` directory is OpenCode config; `quiz-from-docs` skill there defines the workflow for Gen 1 quiz generation from source documents.
- `ref/` contains design references (MAZA design system, screenshots, inspiration).

## No other tooling

No npm, bundler, linter, formatter, typechecker, or test framework.  
No git repository initialized. Open the HTML files directly in a browser.
