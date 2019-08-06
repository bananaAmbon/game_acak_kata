require_relative 'question'
puts "Game Acak Kata"
puts "--------------"
puts "Level permainan : "
puts "1. Level 1."
puts "2. Level 2."
puts "3. Level 3."
print "Masukan pilihan level (1,2,3): "

start = false
score = 0
input = gets.chomp.to_i

questions = Question.new input
start = true if questions

while start
  question = questions.current_question

  unless question.empty?
    puts "Tebak Kata : #{question.join(" ")}"
    
    correct = false
    while correct == false
      print "Jawaban: "
      answer = gets
      correct = questions.answer_correct? answer
      score += 1 if correct
      correct ? result = "BENAR point anda : #{score}!\n" : result = "SALAH! Silakan Coba lagi\n"
      puts result
      print "\n"
    end
  else
    puts "--------------"
    puts "Permainan selesai."
    puts "--------------"
    print "Ingin coba lagi [Y/t]? : "
    answer = gets.chomp

    unless questions.continue? answer
      start = false
    end
  end
end