#!/usr/bin/ruby
#./png_file/ の様に"/"まで入れる！
if ARGV[0]==nil
	puts "file directory is not found!\n"
	exit! 
end
prewd = ARGV[0]
#変更前の形式と変更後の形式を指定したい
puts "please type input file extension you have."
    inPattern = STDIN.gets.gsub(/\n/,"")
    #p inPattern
puts "please type output file extension you want to have."
    outPattern = STDIN.gets.gsub(/\n/,"")
epsfolder = prewd + "eps-pic" 
#指定されたディレクトリ内にeps専用のフォルダeps-picを作成
system("mkdir #{epsfolder}")

Dir::foreach(prewd) {|f|
    if /#{inPattern}/ =~ f
          nameEps = f.gsub(/#{inPattern}/,"#{outPattern}")
         system("convert #{prewd}#{f} #{epsfolder}/#{nameEps}")
    end
}
puts "work is done."
