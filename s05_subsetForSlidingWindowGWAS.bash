#zcat ../raw_data/snps.txt.gz | cut -f 1,30,31,32,33,34,324,325,337,352,353,358,389,395,433,461,466,483,570,580,604,606,615,616,618,673,674,677,679,683,684,686,687,688,689,690,692,693,694,695,700,701,703,704,707,709,711,712,713,714,718,720,722,724,725,727,728,729,730,731,735,736,737,739,740,741,743,745,746,748,750,751,753,754,755,756,757,759,761,762,802,804,805,807,809,843,844,845,849,857,858,860,863,865,867,869,870,885,888,894,898,1043,1044,1045,1046,1050,1051,1052,1053,1054,1055,1056,1057,1058,1073,1074,1075,1086,1089,1091,1092,1093,1094,1097,1109,1110,1111,1112,1114,1115,1221,1296,1891 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window0_genos.txt
#gzip swGWAS_window0_genos.txt
#zcat ../raw_data/snps.txt.gz | cut -f 1,6,30,31,32,33,324,337,349,352,353,358,380,395,461,466,570,604,606,615,616,618,673,674,677,679,683,684,686,687,689,690,692,693,694,700,701,703,704,707,709,711,712,713,714,718,720,722,724,725,727,728,729,730,731,735,736,737,739,740,741,743,745,746,748,750,751,753,754,755,756,757,759,761,802,804,805,807,809,843,844,845,849,857,858,860,863,865,867,870,878,879,881,882,883,885,887,888,892,898,1043,1044,1045,1046,1051,1052,1053,1055,1056,1057,1058,1073,1074,1075,1083,1086,1089,1091,1092,1093,1094,1097,1105,1107,1109,1110,1111,1112,1114,1117,1217,1296,1891 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window1_genos.txt
#gzip swGWAS_window1_genos.txt
#zcat ../raw_data/snps.txt.gz | cut -f 1,6,13,30,31,32,33,337,349,358,380,395,455,461,466,468,482,570,604,606,615,616,618,673,677,683,684,686,687,690,692,693,694,700,701,704,707,709,711,712,713,714,718,720,722,727,728,729,730,731,735,736,737,740,741,743,745,746,748,750,751,753,754,755,756,757,759,761,802,805,809,814,818,843,844,845,849,857,858,860,863,865,867,878,879,881,882,883,885,887,888,892,898,1034,1043,1044,1045,1046,1051,1052,1053,1055,1056,1057,1058,1074,1075,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1089,1091,1092,1093,1094,1097,1105,1107,1109,1110,1111,1112,1114,1117,1217,1296 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window2_genos.txt
#gzip swGWAS_window2_genos.txt
#zcat ../raw_data/snps.txt.gz | cut -f 1,2,5,6,13,30,31,32,33,339,349,358,364,376,380,395,399,436,437,455,461,466,468,472,482,485,493,498,561,570,604,606,615,616,618,673,683,684,686,687,690,692,693,694,700,701,704,707,711,712,713,714,718,722,727,728,729,730,731,736,737,740,741,743,745,746,748,750,751,753,754,755,756,757,761,809,814,818,843,844,845,849,857,858,860,863,865,867,878,879,881,882,883,885,887,888,892,893,898,1032,1034,1043,1044,1045,1046,1051,1052,1055,1057,1058,1074,1077,1078,1079,1080,1081,1082,1083,1084,1085,1089,1091,1092,1093,1094,1105,1107,1109,1110,1111,1117,1217,1296 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window3_genos.txt
#gzip swGWAS_window3_genos.txt
#zcat ../raw_data/snps.txt.gz | cut -f 1,2,5,6,13,30,31,32,33,339,349,358,362,364,369,376,380,393,399,436,437,455,461,466,468,472,482,485,493,498,561,570,604,606,683,686,687,690,692,694,701,707,711,712,714,718,722,727,729,730,731,736,737,740,741,743,745,746,748,750,751,753,754,755,756,757,809,814,818,843,844,845,849,857,858,860,863,865,867,873,876,878,879,881,882,883,885,887,888,892,893,898,905,906,908,926,933,934,943,944,1032,1034,1043,1044,1045,1046,1051,1052,1055,1058,1077,1078,1079,1080,1081,1082,1083,1084,1085,1089,1091,1092,1093,1094,1098,1101,1105,1107,1109,1110,1117,1217,1296 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window4_genos.txt
#gzip swGWAS_window4_genos.txt
#zcat ../raw_data/snps.txt.gz | cut -f 1,2,3,4,5,6,13,30,31,32,33,339,349,350,358,362,364,369,376,380,393,399,436,437,455,461,466,468,472,482,485,493,498,561,570,604,606,683,686,687,690,692,701,712,714,718,722,727,729,730,731,737,740,741,746,748,750,751,753,755,756,757,814,818,843,844,849,857,858,860,863,865,873,876,878,879,881,882,883,885,887,888,892,893,898,901,905,906,908,909,911,912,914,924,926,930,933,934,941,943,944,946,1032,1034,1043,1044,1045,1046,1055,1077,1078,1079,1080,1081,1082,1083,1084,1085,1089,1092,1094,1098,1099,1101,1103,1104,1105,1107,1109,1110,1117,1217,1296 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window5_genos.txt
#gzip swGWAS_window5_genos.txt
#zcat ../raw_data/snps.txt.gz | cut -f 1,2,3,4,5,6,13,30,31,32,33,339,349,350,358,362,364,369,376,380,393,399,425,436,437,455,461,464,466,468,472,482,485,493,498,561,604,606,683,686,690,701,712,714,722,727,729,730,731,737,740,750,751,753,755,756,757,814,818,857,858,863,865,873,876,878,879,881,882,883,887,888,892,893,898,899,900,901,904,905,906,908,909,911,912,914,915,923,924,926,928,930,931,933,934,941,943,944,945,946,1032,1034,1036,1039,1040,1043,1044,1045,1046,1055,1077,1078,1079,1080,1081,1082,1083,1084,1085,1089,1094,1098,1099,1100,1101,1102,1103,1104,1105,1107,1117,1217,1296 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window6_genos.txt
#gzip swGWAS_window6_genos.txt
#zcat ../raw_data/snps.txt.gz | cut -f 1,2,3,4,5,6,12,13,30,31,32,33,162,163,164,300,301,303,304,305,320,339,349,350,362,364,367,369,376,380,393,399,425,436,437,455,464,468,472,482,485,493,498,500,512,530,561,683,690,701,714,722,729,730,731,737,740,750,751,756,814,818,857,858,865,873,876,878,879,881,882,883,887,888,892,893,898,899,900,901,904,905,906,908,909,911,912,914,915,923,924,926,928,930,931,933,934,941,943,944,945,946,1032,1034,1036,1039,1040,1043,1044,1045,1046,1077,1078,1079,1080,1081,1082,1083,1084,1085,1098,1099,1100,1101,1102,1103,1104,1105,1107,1117,1217,1218,1296 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window7_genos.txt
#gzip swGWAS_window7_genos.txt
#zcat ../raw_data/snps.txt.gz | cut -f 1,2,3,4,5,6,10,12,13,33,162,163,164,165,167,168,300,301,303,304,305,320,338,339,346,347,349,350,362,364,367,369,376,380,382,393,397,399,408,409,425,432,436,437,455,462,464,468,472,475,482,485,493,498,500,512,530,561,729,731,740,750,814,818,865,873,876,878,879,881,882,883,887,888,892,893,899,900,901,904,905,906,908,909,911,912,914,915,923,924,926,928,930,931,933,934,941,943,944,945,946,1032,1034,1036,1039,1040,1043,1044,1045,1046,1077,1078,1079,1080,1081,1082,1083,1084,1085,1098,1099,1100,1101,1102,1103,1104,1105,1107,1117,1217,1218,1296,1626 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window8_genos.txt
#gzip swGWAS_window8_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,2,3,4,5,6,10,12,13,162,163,164,165,167,168,300,301,303,304,305,320,327,332,338,339,342,346,347,349,350,362,364,367,369,376,380,382,383,385,388,393,397,399,408,409,425,431,432,436,437,440,446,451,455,462,464,468,472,475,482,485,493,498,500,512,530,561,562,572,814,818,873,876,878,879,881,882,883,893,899,900,901,904,905,906,908,909,911,912,914,915,923,924,926,928,930,931,933,934,941,943,944,945,946,1028,1029,1032,1034,1036,1039,1040,1077,1078,1079,1080,1081,1082,1083,1084,1085,1098,1099,1100,1101,1102,1103,1104,1107,1117,1217,1218,1626,1764 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window9_genos.txt
gzip swGWAS_window9_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,2,3,4,5,10,12,13,123,127,128,140,162,163,164,165,167,168,300,301,303,304,305,317,320,327,332,338,339,342,346,347,350,362,364,367,369,374,376,382,383,385,388,390,393,397,399,402,408,409,415,425,430,431,432,436,437,440,445,446,448,451,455,462,464,468,472,475,482,485,493,498,500,512,530,561,562,572,778,814,818,873,876,893,899,900,901,904,905,906,908,909,911,912,914,915,923,924,926,928,930,931,933,934,941,943,944,945,946,1027,1028,1029,1032,1034,1036,1039,1040,1069,1077,1078,1079,1080,1084,1098,1099,1100,1101,1102,1103,1104,1218,1626,1764 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window10_genos.txt
gzip swGWAS_window10_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,2,3,4,10,12,123,127,128,140,162,163,164,165,167,168,300,301,303,304,305,317,320,327,332,338,339,342,344,346,347,350,355,362,367,369,374,375,376,377,382,383,385,388,390,393,397,402,408,409,415,423,425,430,431,432,436,437,440,445,446,448,451,460,462,464,472,475,485,493,498,500,512,530,561,562,572,773,774,778,781,782,785,790,793,873,876,893,899,900,901,904,905,906,908,909,911,912,914,915,923,924,926,928,930,931,933,934,941,943,944,945,946,1027,1028,1029,1032,1036,1039,1040,1061,1069,1098,1099,1100,1101,1102,1103,1104,1218,1454,1626,1764 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window11_genos.txt
gzip swGWAS_window11_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,3,4,10,12,122,123,127,128,140,162,163,164,165,167,168,300,301,303,304,305,317,320,327,332,338,342,344,345,346,347,350,355,362,365,367,374,375,377,378,382,383,385,388,390,397,402,408,409,415,423,425,430,431,432,438,440,445,446,447,448,451,460,462,464,474,475,477,486,488,490,491,492,500,512,530,562,572,665,773,774,778,781,782,785,790,793,796,873,876,899,900,901,904,905,906,908,909,911,912,914,915,923,924,926,928,930,931,933,934,941,943,944,945,946,1027,1028,1029,1036,1039,1040,1061,1069,1099,1100,1101,1102,1103,1104,1218,1454,1626,1764 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window12_genos.txt
gzip swGWAS_window12_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,3,4,10,12,122,123,127,128,135,140,144,145,151,162,163,164,165,167,168,300,301,303,304,305,317,320,327,332,338,342,344,345,346,347,355,365,367,374,375,377,378,382,383,385,386,388,390,397,402,408,409,415,423,425,428,430,431,432,435,438,440,445,446,447,448,451,452,459,460,462,464,474,475,477,486,488,490,491,492,494,500,512,530,562,572,665,763,768,773,774,778,781,782,785,787,790,793,796,899,900,901,904,911,912,915,923,924,928,930,931,941,945,946,1027,1028,1029,1036,1039,1040,1061,1067,1068,1069,1099,1100,1102,1103,1104,1218,1454,1626,1764 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window13_genos.txt
gzip swGWAS_window13_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,10,12,44,122,123,127,128,135,140,144,145,151,162,163,164,165,167,168,191,202,253,290,300,301,303,304,305,317,320,327,332,338,342,344,345,346,347,355,365,367,374,375,377,378,382,383,385,386,388,390,397,402,408,409,415,422,423,425,428,429,430,431,432,435,438,440,445,446,447,448,451,452,459,460,462,464,474,475,477,486,488,489,490,491,492,494,500,510,511,512,530,542,562,572,573,646,661,665,671,763,768,773,774,778,781,782,785,787,790,793,796,899,900,904,915,923,945,1027,1028,1029,1039,1040,1061,1067,1068,1069,1100,1102,1218,1454,1626,1764 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window14_genos.txt
gzip swGWAS_window14_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,10,12,44,51,122,123,127,128,135,140,144,145,151,161,162,163,164,165,167,168,182,191,202,224,249,252,253,271,290,291,300,301,303,304,305,317,320,327,332,338,341,342,344,345,346,347,355,365,367,374,375,377,378,382,383,385,386,388,390,397,402,405,408,409,415,422,423,428,429,430,431,432,435,438,440,445,446,447,448,451,452,459,460,462,474,475,477,486,488,489,490,491,492,494,510,511,512,531,542,562,564,572,573,646,648,652,661,665,671,763,768,773,774,778,781,782,785,787,790,793,796,1027,1028,1029,1061,1067,1068,1069,1454,1626,1728,1764 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window15_genos.txt
gzip swGWAS_window15_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,10,44,51,122,123,127,128,135,140,144,145,148,151,153,161,182,186,187,191,200,202,224,249,252,253,271,290,291,317,327,332,338,341,342,344,345,346,347,355,360,361,365,374,375,377,378,382,383,385,386,388,390,397,402,405,408,409,415,422,423,428,429,430,431,432,435,438,440,445,446,447,448,451,452,459,460,462,463,474,475,477,486,488,489,490,491,492,494,510,511,531,534,542,548,562,564,572,573,579,588,646,648,652,660,661,665,671,763,768,773,774,778,781,782,785,787,790,793,796,1027,1028,1029,1061,1067,1068,1069,1165,1454,1561,1626,1728,1764 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window16_genos.txt
gzip swGWAS_window16_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,44,51,122,123,127,128,135,140,144,145,148,151,153,161,182,186,187,191,200,201,202,207,224,249,252,253,271,290,291,317,327,332,341,342,344,345,355,360,361,365,374,375,377,378,385,386,388,390,402,405,415,422,423,428,429,430,435,438,440,445,446,447,448,451,452,459,460,463,473,474,477,486,488,489,490,491,492,494,510,511,531,533,534,542,548,549,550,562,564,569,572,573,579,588,589,642,644,645,646,648,652,653,655,660,661,665,668,671,763,768,773,774,778,781,782,785,787,790,793,796,1027,1028,1029,1061,1067,1068,1069,1165,1454,1560,1561,1728 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window17_genos.txt
gzip swGWAS_window17_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,44,51,122,123,127,128,135,140,144,145,148,151,153,161,182,184,186,187,191,200,201,202,205,207,224,249,252,253,255,262,263,271,290,291,317,341,344,345,355,356,360,361,365,375,377,378,386,390,402,405,410,411,415,422,423,428,429,435,438,445,447,448,452,453,454,459,460,463,473,474,477,486,488,489,490,491,492,494,510,511,531,533,534,542,548,549,550,564,568,569,573,574,575,576,579,588,589,642,644,645,646,648,652,653,655,660,661,665,668,671,763,768,773,774,778,781,782,785,787,790,793,796,1061,1067,1068,1069,1165,1436,1454,1560,1561,1728 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window18_genos.txt
gzip swGWAS_window18_genos.txt
zcat ../raw_data/snps.txt.gz | cut -f 1,44,51,122,135,144,145,148,151,153,161,171,182,184,186,187,191,194,197,199,200,201,202,205,207,224,249,252,253,255,262,263,264,271,276,279,289,290,291,292,319,341,344,345,355,356,360,361,365,377,378,386,405,410,411,422,423,428,429,435,438,447,452,453,454,459,460,463,473,474,477,486,488,489,490,491,492,494,510,511,531,533,534,542,548,549,550,564,568,569,573,574,575,576,579,588,589,623,634,639,642,644,645,646,648,652,653,655,657,658,660,661,665,668,671,763,768,773,774,782,785,787,790,793,796,1067,1068,1165,1436,1454,1560,1561,1728 | sed -e 's/	/	X	Y	/' | sed -e 's/	/,/g' | sed 's/^/rs/g' | sed 's/,1/,2/g' | sed '1d'> swGWAS_window19_genos.txt
gzip swGWAS_window19_genos.txt