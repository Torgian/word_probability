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

def make_word_hash(words)
  word_list = Hash.new { |hash, key| hash[key] = [1] }
  words.each do |word|
    if word_list.has_key?(word) == false
      word_list[word]
    else
      #adds 1 for each occurance of the word when the key already exists in the hash
      word_list[word][0] += 1
    end
  end
  word_matching(word_list, words)
end

def word_matching(word_list, words)
  #regex = /[.,?!-_"';:]/
  words.each_with_index do |word, i|
    word_list[word].push(words[i+1]) if words[i+1] != nil
  end
  words_used_often(word_list)
end

def words_used_often(word_list)
  percentage = []
  often_used_words = Hash.new { |hash, key| hash[key] = ""}
  word_list.each do |key, value|
    if value[0] > 1
      often_used_words[key] = value[0]
    end
  end
  return often_used_words
  #often_used_words.each {|key, value| value = (value[0] / often_used_words.length)}
end

word_probability("written_test.txt")