# LiveMentor technical interview

![Codecov branch](https://img.shields.io/codecov/c/github/volchan/jtc/master?token=6e9b2a886da141f0bb3a49f63a2f9f4a)

## Goal

Converting an array of structured JSON objects into a CSV file.

## Evaluation criteria

- Cleanliness
- Extensibility
- Robustness
- Test coverage

## usage

Open an interactive ruby process with `irb -I ./lib`
```RUBY
  [1] pry(main)> require 'jtc'
  => true
  [2] pry(main)> JTC.convert(File.read('./spec/test_data/users.json'))
```
