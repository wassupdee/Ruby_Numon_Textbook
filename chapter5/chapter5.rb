24/7/8
- ハッシュ({})とは、「キー」と「値」の組み合わせでデータを管理するオブジェクトのこと
  { キー => 値 }
- 新しく要素を追加する場合、ハッシュの後に[]を付けてキーを入れ、=の後に値を入れる
  currencies = { 'japan' => 'yen' }
  currencies['italy'] = 'euro'
  currencies #=> { "japan" => "yen", "italy" => "euro" }
- 値を取り出す場合は、
  currencies['japan'] #=> "yen"
- 要素を削除する場合は、
  currencies.delete('japan')
- eachメソッドを使う場合、キーと値の組み合わせを取り出す
  currencies.each do |key, value|
    puts "#{key} : #{value}"
  end
- シンボル(:)とは
  1. 表面上は文字列の様なので、プログラマにとって分かりやすい
  2. 中身は整数なので、コンピュータは高速に処理できる
  3. 大量に作っても、同じシンボルは同じオブジェクトなので、メモリ効率が良い
  4. イミュータブルなので、勝手に変わることはない
- 設計上文字列でなくてもよいのであれば、シンボルを使うべき
- シンボルは、ハッシュのキーによく使われる（この場合、キー：値と記述し、 =>を省略できる）
- メソッドの引数に、ハッシュの様なキーと値を入れられる、「キーワード引数」なるものがある
  def buy_burger(drink:, potato:)
    #省略
  end

  buy_burger(drink: true, potato: true)
  # キーワード引数を使わない場合、buy_burger(true, true)となり、何がtrueなのか分かりにくい

24/7/10
- よく使われるイディオム
  1.ぼっち演算(&.)
    nilに対してメソッドを呼び出してしまい、エラーが起きないようにする記法
    hoge.upcase　#hogeがnilの場合、no method errorが起きる
    hoge&.upcase #hogeがnilの場合、errorではなくnilが返る

  2.nilガード
    変数がtrue（何か入っていれば）、代入しないようにする記法
    a = 10
    a ||= 30
    a #=> 10
  
  3.!!を使い、trueまたはfalseのみを返す
    !!nil = false
    nilの否定はtrue、trueの否定はfalseとなる
