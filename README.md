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

Percentages are written in. I also refactored the code a bit.

Major and minor word pairs are found using the functions find_major/minor_pairs. After that, percentages
can be found with major/minor percentages. 

Right now the program returns the major/minor percentages, as well as the sum of both. Floats are reduced
to 2 decimal places.

Next is to write up HTML and Javascript to visualize the pie graph.
