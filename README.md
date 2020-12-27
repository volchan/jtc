# LiveMentor technical interview

![Codecov branch](https://img.shields.io/codecov/c/github/volchan/jtc/master?token=6e9b2a886da141f0bb3a49f63a2f9f4a) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/a09d3702d8a84f8a842465e3078645fe)](https://www.codacy.com/gh/volchan/jtc/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=volchan/jtc&amp;utm_campaign=Badge_Grade)

## Goal

Converting an array of structured JSON objects into a CSV file.

## Evaluation criteria

-   Cleanliness
-   Extensibility
-   Robustness
-   Test coverage

## usage

Open an interactive ruby process with `irb -I ./lib`
```RUBY
  [1] pry(main)> require 'jtc'
  => true
  [2] pry(main)> JTC.convert(File.read('./spec/test_data/users.json'))
```
