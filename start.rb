require "./deck"

deck = Deck.new

2.times do
  deck.enemy_draw
end

puts "[enter]次に進む"
i = gets

2.times do
deck.draw
deck.mark
deck.number
deck.figure
end

deck.enemy_show
deck.show

puts "\n[enter]次に進む"
input = gets.to_i

while input != 2 do
  deck.menu
  input = gets.to_i

  if input == 1
    deck.draw
    deck.mark
    deck.number
    deck.figure
    deck.show
  elsif input == 2
    puts "ディーラーのターンです。\n"
  elsif input == 3
    puts "また遊んでね！！"
    exit
  else
    puts "もう一度入力してください"
  end
end
# deck.battle
while true do
  if deck.enemy_judge <=16
    deck.enemy_draw
  else
    puts "\nディーラーのターンは終了です。"
    deck.battle
    exit
  end
end