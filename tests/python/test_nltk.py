import nltk
import sys

sentence = """At eight o'clock on Thursday morning Arthur didn't feel very good."""
tokens = nltk.word_tokenize(sentence)
if tokens != ['At', 'eight', "o'clock", 'on', 'Thursday', 'morning', 
              'Arthur', 'did', "n't", 'feel', 'very', 'good', '.']:
    sys.stderr.write("Error in tokenization")
    sys.exit(1)

