module RandomData
  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end

    sentences.join(" ")
  end

  def self.random_url
    url = ""
    2.times do
      url << random_word
    end
    url << ".com"

  end

  def self.random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end

  def self.random_email
    word1 = random_word
    word2 = random_word
    "#{word1}@#{word2}.com"
  end
end
