def some_method
  "Hello"
end

some_method # "Hello"

teachers = ["JJ", "Rachel", "Ian"]

teachers = [{name: 'JJ', height: '5 ft. 10'}, {name: 'Rachel', height: '5 ft. 3'}, {name: 'Ian', height: '6 ft 4'}]

reddit_json = "{name: 'Ian', height: '6 ft 4'}"

parse(reddit_json) // {name: 'Ian', height: '6 ft 4'}
