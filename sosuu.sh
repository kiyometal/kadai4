#!/bin/bash


#実行権限を与えておく
#mod +x 18745125.sh
#./18745125.sh 数字　で実行

#入力値の整数判定
echo "整数を入力してください＝"

input_number=$1

expr 1 + $1 > /dev/null 2>&1

if [ $? -le 1 ];then
        echo "これは整数です"
        else
        echo $input_number"は整数ではありません"
        exit 0
fi

#約数が２のものを素数とする
#約数を求めるため、入力値を１から順に割り続け、余りのない商をカウントする

y=0

for ((a=1; a<=input_number; a++));
do
        if [ $(($1 % $a)) == 0 ];then
        y=$[$y+1]
        fi
done

if [ $y == 2 ];then
        echo "入力値"$1"は約数が"$y"つなので素数です"
        else
        echo "入力値"$1"は約数が"$y"個あるので素数ではありません"
        exit 0
fi
