
def janken_game(draw)

    janken_hand = {0=>"グー", 1=>"チョキ", 2=>"パー"}
    janken_table = [
        [2, 1, 0],
        [0, 2, 1],
        [1, 0, 2]
    ] #0:player win, 1:computer win, 2:draw

    if draw
        puts "あいこで..."
    else
        puts "じゃんけん..."
    end
    puts "0(グー) 1(チョキ) 2(パー) 3(戦わない) "
    player_hand = gets.chomp.to_i
    computer_hand = rand(3)
    
    if not(player_hand == 0 || player_hand == 1 || player_hand == 2 || player_hand == 3)
        until player_hand == 0 || player_hand == 1 || player_hand == 2 || player_hand == 3 do
            puts "0~3 のどれかの数字を入力して下さい"
            puts "0(グー) 1(チョキ) 2(パー) 3(戦わない) "
            player_hand = gets.chomp.to_i
        end
    end
    
    if player_hand == 3
        puts "ゲームを終了します"
        return 3
        exit
    end   

    if draw
        puts "ショ！"
    else
        puts "ホイ！"
    end

    puts "--------------------------------------------------"
    puts "あなた：#{janken_hand[player_hand]}を出しました"
    puts "相手：　#{janken_hand[computer_hand]}を出しました"

    result = janken_table[computer_hand][player_hand]

    return result
end

def hoi_game(result)
    direction = {0=>"上", 1=>"下", 2=>"左", 3=>"右"}

    puts "あっち向いて〜"
    puts "0(上) 1(下) 2(左) 3(右) "
    player_direction = gets.chomp.to_i
    computer_direction =rand(4)
   
    puts "ホイ！"
    puts "--------------------------------------------------"
    puts "あなた：#{direction[player_direction]}"
    puts "相手：　#{direction[computer_direction]}"

    if result == 0 && player_direction == computer_direction
        puts "あなたの勝ち！"
        return 0
    elsif result == 0 && player_direction != computer_direction
        puts "もう一回！"
        return 1
    elsif result == 1 && player_direction == computer_direction
        puts "あなたの負け"
        return 0
    else
        puts "もう一回！"
        return 1
    end
    puts "--------------------------------------------------"
end


def game()
    janken_result = ""
    hoi_result = ""
    until hoi_result == 0
        janken_result = janken_game(false)        
        while janken_result == 2
            janken_result = janken_game(true)
        end

        if janken_result == 3
            exit
        end

        hoi_result = hoi_game(janken_result)
    end

    puts "ゲームを終了します"
end

game()