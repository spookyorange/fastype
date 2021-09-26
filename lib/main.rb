selectable_words = Array.new

all_words = File.readlines('5desk.txt')
all_words.each do |word|
  if word.length > 6 && word.length < 13
    selectable_words.unshift(word)
  end
end

puts selectable_words
