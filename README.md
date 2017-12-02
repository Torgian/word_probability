#word_probability

This program will take any artical written in a .txt format (for now).

It will split the document into individual words, including words with punctuation, and put them into 
a new hash with keys.

Then, the program will look at each word and start putting the words that come directly after it into 
the hash's key.

For example:

The fox jumped over the rabbit over a log.

Each word is a key, therefore: "fox" => []

jumped comes after fox, therefore+ "fox" => ["jumped"]

This continues down the list. "over" is followed by "the" and "a", therefore:

"over" => ["the", "a"]

===================================

Right now the majority of the working code is done. I need to update the code to return percentages
of each word-pairs. 

There will be two sets: major-word-pair percentages (words that have more than one word following it)
and minor-word-pair percentages (words that only have one word following it throughout the whole text.)

Once that is complete, I will need to write up some HTML and javascript to visualize it.
