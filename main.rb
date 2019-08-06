puts "Game Acak Kata"
puts "--------------"
puts "Tekan Enter untuk mulai permainan."

start = false
score = 0
input = gets

if input == "\n"
  start = true
  questions = IO.readlines("questions.txt").map {|s| s.chomp}.shuffle
end

while start
  random_question = questions.sample(1)
  questions -= random_question

  question = random_question.map {|q| q.split("").shuffle.join}

  unless random_question.empty?
    puts "Tebak Kata : #{question.first}"
    
    correct = false
    while correct == false
      print "Jawaban: "
      answer = gets
      correct = answer.split(" ") == random_question
      score += 1 if correct
      correct ? result = "BENAR point anda : #{score}!\n" : result = "SALAH! Silakan Coba lagi\n"
      puts result
    end
  else
    puts "Permainan selesai."
    print "Ingin coba lagi [Y/t]? : "
    answer = gets.chomp

    if answer == "Y" || answer == "y"
      questions = IO.readlines("questions.txt").map {|s| s.chomp}.shuffle
    else
      start = false
    end
  end
end