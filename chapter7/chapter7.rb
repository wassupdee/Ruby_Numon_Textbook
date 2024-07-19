24/7/13
クラスをつくる目的
- クラスは内部にデータを保持し、さらに自分が保持しているデータを利用する独自のメソッドをセットで持つことができる。

class User
  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

@user = User.new('Alice', 'Ruby', 20)
@user.first_name #=> error クラス外からインスタンス変数は呼び出せないため。
# ただし、attr_accessor :first_nameをつけると、クラスからインスタンス変数を呼び出すメソッドが生成される。このメソッドで、インスタンス変数を呼び出せる
@user.first_name #=> "Alice"

24/7/14
1. クラスメソッドは、つくられた個々のインスタンスをまとめた情報を管理する（例：つくられたインスタンスの個数などカウントする）
2. インスタンスメソッドは、それ自身の情報しか見ていない

class User
  @@count = 0

  def initialize
   @@count += 1
  end

  def self.users_count
    puts "現在のユーザー数は#{@@count}人です"
  end
end

#Userクラスから、３つのインスタンスが作成される
#この時に、Userクラスのcountが１つずつ上がる
User.new
User.new
User.new

#Userクラス自身がカウントしていた数を出力する
User.users_count

=> 現在のユーザー数は3人です

24/7/16
- selfはクラス自身を指す場合もあるし、インスタンスを指す場合もある
- ゲッターメソッドの場合は、nameだけでOKだが、セッターメソッドを使いたい場合は、self.name = 'hoge'とselfを使う必要がある
class User
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end

  def hi
    "Hi, I am #{name}."
  end
  
  def rename
	  self.name = 'Bob'
  end
end

user = User.new('Alice')
puts user.hi # => "Hi, I am Alice."

24/7/19
- superを使うと、スーパークラスの同名のメソッドを呼び出すことができる
‐ サブクラスでは、スーパークラスと同名のメソッドを定義することで、スーパークラスの処理を上書きすることができる
- privateメソッドは、クラスの外からは呼び出せず、クラスの内部のみ（クラスの別のメソッドからの呼び出し）で使えるメソッド