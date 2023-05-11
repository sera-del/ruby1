require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

# 1と2の条件分岐
if memo_type == 1
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください"
  
  # キーボードでファイル名を入力して取得
  file_name = gets.chomp 
  
  # ファイル名入力したら以下をコンソールに表示
  # 入力後、ctrl+Dの後、エンターキーが押されるまで待機
  p "メモしたい内容を入力してください"
  p "完了したらctrl+Dを入力してエンターキーを押してください。"
  
  # キーボードでメモ内容を入力して取得。入力されるまで待機
  inputContent = STDIN.read
  
  # csvファイルの出力
  CSV.open("#{file_name}.csv","w") do |csv|
    csv << ["#{inputContent}"]  #メモ内容反映
  end
  
elsif memo_type == 2
  puts "既存メモを編集します。拡張子を除いたファイル名を入力してください"
  
  # 既存メモのファイル名を入力して取得
  file_name = gets.chomp
  
  # ファイル名を入力したら以下をコンソールに表示
  p "変更したい内容を入力してください"
  p "完了したらctrl+Dを押します"
  
  # キーボードで追記したい内容を入力して取得
  inputContent2 = STDIN.read
  
  # csvファイルの更新
  CSV.open("#{file_name}.csv","a") do |csv|
    csv << ["#{inputContent2}"]     #メモ内容追加
    
  end
end