# LiveMentor technical interview

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
