#!/opt/local/bin/ruby1.9
# coding: utf-8

# クラス変数とインスタンス変数の使い方を間違えてるかも

# 一文字目が大文字の物は定数
NOT_MINE = 0
OPEND = 1
MINE = 10

# クラス宣言
class Mine < Object
    # クラス変数は @@ と書く
    
    #@filed
    
    # メソッド定義
    # コンストラクタ
    # フィールドの初期化
    def initialize(size=10)
        @filed = Array.new(size)
        puts "initialize Mine"
        #@@filedSize = size
        @filed.length.times do |index|
            @field[index] = Array.new(size, NOT_MINE)
            #@filed[index].length.times do |line|
            #    @filed[index][line] = NOT_MINE
            #end
        end
        @filed[0][0] = MINE
        p @filed
    end
    
    # 地雷配置
    def setMine(number=20)
        puts "setMine"
        
        # メルセンヌツイスタでの乱数生成用オブジェクトを生成
        random = Random.new
        
        while true do
            index = random.rand(10)
            line = random.rand(10)
            if @field[index][line] == NOT_MINE
                @field[index][line] = MINE
                number -= 1
            end
            if number == 0
                break
            end
        end
    end
    
    # フィールドを描く
    def printFiled
        # 一行目を表示
        printf(" ")
        @filed.size do |index|
            printf(" %d", index)
        end
        printf("\n")
        
        @filed.size do |index|
        printf("%d", index)
           @filed[index].size do |line|
                if @filed[index][line] == OPEND
                    printf(" *")
                else 
                    printf(" @")
                end
            end
            printf("\n")
        end
        
    end
end

printf("please enter field size -> ")
fieldSize = $stdin.gets # 単に gets と書くことも出来る
printf("please enter mine number -> ")
mineNumber = gets
mine = Mine.new(fieldSize.to_i) # .to_i で String から Integer に
mine.setMine(mineNumber.to_i)

mine.printFiled

number = 0
while true do
    number+=1
    string = gets
    strings = string.split(" ")
    p strings

    if number == 2
        break
    end
end


