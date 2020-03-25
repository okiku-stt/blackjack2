class Deck
  def initialize
    # 配列の定義

    @cards = [*(1..52)]
    @marks = []
    @numbers = []
    @figures = []
    @enemy_marks = []
    @enemy_numbers = []
    @enemy_figures = []

    # 初期画面
    puts "\n--Black Jack--\n[enter]Game Start"
    i = gets
    puts "最初にディーラーとあなたは2枚カードを引きます。"
    puts "まずはcpuのターンです。"
    puts "\n[enter]次に進む"
    i = gets
  end

  def total
    @sum = @figures.sum
    puts "あなたの合計は「#{@sum}」です。"
  end

  def draw
    # puts "[enter]次に進む"
    # i = gets
    puts "あなたはカードを引きました。"
    @draw = @cards.sample
    @destory = @cards.delete(@draw)
  end

  def mark
    @mark = @draw % 4
    if  @mark == 0
      @hand_mark = "クラブ"
    elsif @mark == 1
      @hand_mark = "スペード"
    elsif @mark == 2
      @hand_mark = "ハート"
    elsif @mark == 3
      @hand_mark = "ダイヤ"
    else
      puts "error"
    end
    @marks << @hand_mark
  end

  def number
    if @draw % 4 == 0
      @number = @draw.div(4) - 1
    else
      @number = @draw.div(4)
    end
    @list = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    @hand_number = @list[(@number)]
    @numbers << @hand_number
  end

  def figure
    if @draw % 4 == 0
      @hand_figure = @draw.div(4)
    else
      @hand_figure = @draw.div(4) + 1
    end

    @total = @figures.sum

    if @hand_figure >= 10
      @hand_figure = 10
    elsif @hand_figure == 1
      puts "Aを引きました。「1」か「11」のどちらかを入力してください。"
      puts "あなたの合計は「#{@total}」です。"
      @hand_figure = gets.to_i
      while @hand_figure != 1 && @hand_figure != 11 do
        puts "もう一度入力してください"
        @hand_figure = gets.to_i
      end
    else  
      @hand_figure
    end
    @figures << @hand_figure
  end

  def show
    puts "\n[enter]あなたの手札を見る"
    i = gets
    puts "--あなたの手札--"
    @marks.zip(@numbers) do |mark,number|
      puts "・#{mark}\s#{number}"
    end
    puts "----------------"
    @total = @figures.sum
    if @total <= 21
      puts "\n--あなたの合計--\n「#{@total}」\tあと「#{21 - @total}」です。\n----------------"
    else
      puts "\n--あなたの合計--\n「#{@total}」\n----------------\nバーストです。あなたの負けです。\nまた遊んでね！！"
      exit
    end
  end

  def menu
    puts "\n選択してください。"
    puts "[1]カードを引く"
    puts "[2]ターン終了"
    puts "[3]Exit"
  end

  def enemy_draw
    puts "cpuがカードを引きました。"
    @draw = @cards.sample
    @destory = @cards.delete(@draw)

    #マークの取得
    @enemy_mark = @draw % 4
    if  @enemy_mark == 0
      @e_hand_mark = "クラブ"
    elsif @enemy_mark == 1
      @e_hand_mark = "スペード"
    elsif @enemy_mark == 2
      @e_hand_mark = "ハート"
    elsif @enemy_mark == 3
      @e_hand_mark = "ダイヤ"
    else
      puts "error"
    end
    @enemy_marks << @e_hand_mark

    #数字の取得
    if @draw % 4 == 0
      @e_number = @draw.div(4) - 1
    else
      @e_number = @draw.div(4)
    end
    @e_list = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    @e_hand_number = @e_list[(@e_number)]
    @enemy_numbers << @e_hand_number

    #合計の計算
    if @draw % 4 == 0
      @e_hand_figure = @draw.div(4)
    else
      @e_hand_figure = @draw.div(4) + 1
    end

    if @e_hand_figure >= 10
      @e_hand_figure = 10
    elsif @e_hand_figure == 1 && @enemy_figures.sum <= 10
      @e_hand_figure = 11
    else
      @e_hand_figure
    end
    @enemy_figures << @e_hand_figure
  end

  def enemy_show
    puts "\n--cpuの手札--"
    puts @enemy_marks.first(1)
    puts @enemy_numbers.first(1)
    puts "----------------"
    # puts "--cpuの手札の枚数--"
    # print @enemy_figures.count
    # puts "枚"
  end

  def enemy_judge
    judge = @enemy_figures.sum
  end

  def battle
    # puts "難易度を選択してください。"
    # puts "[1]easy"
    # i = gets
    puts "\n[enter]勝負！！！"
    i = gets
    @total = @figures.sum
    @e_total = @enemy_figures.sum
    if @e_total >= 22
      puts "--★★★You Win!!!!★★★--\n\nあなた「#{@total}」\ncpuはバーストでした。\nまた遊んでね！！"
    elsif @total < @e_total
      puts "--You Lose--\n\nあなた「#{@total}」\ncpu：「#{@e_total}」\nまた遊んでね！！"
    elsif @total == @e_total
      puts "--★引き分け★--\n\nあなた「#{@total}」\ncpu：「#{@e_total}」\nまた遊んでね！！"
    else
      puts "--★★★You Win!!!!★★★--\n\nあなた「#{@total}」\ncpu：「#{@e_total}」\nまた遊んでね！！"
    end
  end
end