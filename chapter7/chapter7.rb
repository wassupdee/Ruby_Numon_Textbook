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