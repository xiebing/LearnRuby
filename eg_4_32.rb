# _*_ coding:utf-8 _*_
puts "将军".encoding
puts "jiangjun".encoding

utf = "中国"
p utf.encoding

gbk = utf.encode("GBK")
puts gbk
p gbk.encoding

sjis = utf.encode("Shift_JIS")
puts sjis
p sjis.encoding

force = utf.force_encoding("GBK")
puts force
puts utf
p force.encoding
