#require 'json'

def word_probability(file_name)
  # file_to_check = File.open("words.json", "r") do |f|
  #   JSON.parse(f.read)
  # end
  file_to_check = parse_file(file_name)

  make_word_hash(split_words(file_to_check))
end

def parse_file(file_name)
  file_contents = File.read(file_name)
  return file_contents
end

def split_words(file_to_check)
  return file_to_check.split(" ")
end

def read_story(finished_story)
  File.open(finished_story, "r") {|file| file.read}
end

def make_word_hash(words)
  word_list = Hash.new { |hash, key| hash[key] = [] }
  words.each {|word| word_list[word] if word_list.has_key?(word) == false}
  word_matching(word_list, words) #call another method that will check each word and return
  #each word and put it into the key
end

def word_matching(word_list, words)
  #regex = /[.,?!-_"';:]/
  words.each_with_index do |word, i|
    word_list[word].push(words[i+1]) if words[i+1] != nil
  end
  return word_list
end


puts word_probability("written_test.txt")