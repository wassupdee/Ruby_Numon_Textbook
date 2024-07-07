24/7/2
- 配列にはどんなオブジェクトでも格納できる（数値と文字列の混在もOK。配列の中に配列もOK）
- <<を使うと、配列の最後に要素を追加することができる
- 配列の多重代入は便利に使える場合がある
  quotient, remainder = 14.divmod(3)
  "商=#{quotient},余り=#{remiander}"
- 配列 each ブロックは定番セット
- eachメソッドは、配列から順番に要素を取り出すだけ。その要素をどう処理するかはブロック内に記述する
- ブロック内で初めて登場する変数のスコープはブロック内部のみ
- ブロックの書き方は、do...endと{}がある。{}は１行で書く場合
  numbers = [1,2,3,4]
  sum = 0
  numbers.each do { |n| sum += n}

24/7/3
- mapメソッドは、配列の各要素を処理し、新しい配列にして返す
  numbers = [1, 2, 3, 4, 5]
  new_numbers = numbers.map{ |n| n * 10 }
- selectメソッドは、各要素を評価し、戻り値が真の場合の要素を集める
  numbers = [1, 2, 3, 4, 5]
  even_numbers = numbers.select { |n| n.even? }
- sumメソッドは、要素の合計を求める。要素は文字列でもOK
  numbers = [1, 2, 3, 4, 5]
  numbers.sum
  numbers.sum { |n| n*10 }
- ブロックは、&:メソッド　で書き換えられる（ただし、条件あり）
  ['a', 'b', 'c'].map(&:upcase)
- 範囲は、1..5や1...5(最後の値は含まない)で作成できる
- 配列に対して、添え字の代わりに範囲オブジェクトを渡すと、その範囲の要素を取得することができる
  a = [1, 2, 3, 4, 5]
  a[1..3] #=>[2,3,4]

24/7/5
- 配列[位置、取得する長さ]
  a = [1, 2, 3, 4, 5]
  a[1,3] #=> [2,3,4]

- values_atで取得したい要素を指定
  a.values_at(0, 2, 4) #=> [1, 3, 5]

- a.last(2) #=> [2,3]

- 要素を変更する
  a = [1, 2, 3]
  a[-3] = 10
  a #=> [10, 2, 3]

24/7/6
- with_indexメソッドを使って、添え字を付けることができる
  fruits = ['apple', 'orange', 'melon']
  frunts.map.with_index { |fruit, i| "#{i}: #{fruit}" }

24/7/7
- 様々な繰り返し処理
  - timesメソッド：配列を使わずに単純にn回処理をしたい場合
    sum = 0
    5.times { |n| sum+= n }
    sum #=>10
  - upto, downtoメソッド：nからmまで数値を1つずつ増やし（減らし）ながら、処理を行う
    a = []
    10.upto(14) { |n| a << n}
    14.downto(10) { |n| a << n}
  - stepメソッド：nからmまで数値をx個ずつ増やしながら処理
    a = []
    1.step(10, 2) { |n| a << n }
    a #=> [1,3,5,7,9]
  - while文は条件が真である間、until文は条件が偽である間繰り返し処理を行う
  - forよりeachを使う
- breakを使うと繰り返し処理を脱出できる
  numbers = [1, 2, 3, 4, 5].shuffle
  numbers.each do |n|
    puts n
    break if n == 5
  end
