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
  #percentages(word_list, words)
  find_pair_types(word_list, words)
end

def find_pair_types(word_list, words)
  text_length = words.length
  #could possibly refactor here, later. Possibly refactor paired and most_used
  paired_words_list = word_matching(word_list, words)
  major_word_pairs = find_major_pairs(paired_words_list)
  minor_word_pairs = find_minor_pairs(paired_words_list)
  major_percentages = find_major_percentages(major_word_pairs, text_length)
  minor_percentages = find_minor_percentages(minor_word_pairs, text_length)
  p major_percentages, minor_percentages 
  p major_percentages.reduce(:+).round(2), minor_percentages.reduce(:+).round(2), (major_percentages.reduce(:+) + minor_percentages.reduce(:+)).round(2)
end

def find_major_pairs(paired_words_list)
  major_pairs = Hash.new {|hash, key| hash[key] = []}
  paired_words_list.each do |key, value|
    if value[0] > 1
      major_pairs[key] = value
    end
  end
  return major_pairs
end

def find_minor_pairs(paired_words_list)
  minor_pairs = Hash.new { |hash, key| hash[key] = [] }
  paired_words_list.each do |key, value|
    if value[0] == 1
      minor_pairs[key] = value
    end
  end
  return minor_pairs
end

def find_major_percentages(major_word_pairs, text_length)
  return major_word_pairs.map {|key, value| ((value[0] / text_length.to_f) * 100.to_f).round(4)}
end

def find_minor_percentages(minor_word_pairs, text_length)
  return minor_word_pairs.map {|key, value| ((value[0] / text_length.to_f) * 100.to_f).round(4)}
end

def word_matching(word_list, words)
  #regex = /[.,?!-_"';:]/
  words.each_with_index do |word, i|
    word_list[word].push(words[i+1]) if words[i+1] != nil
  end
  return word_list
end

# def words_used_often(word_list)
#   often_used_words = Hash.new { |hash, key| hash[key] = ""}
#   word_list.each do |key, value|
#     if value[0] > 1
#       often_used_words[key] = value[0]
#     end
#   end
#   return often_used_words
# end



word_probability("written_test.txt")